%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File name: simulateRL_sarsa0.m
% Author: Jihoon Suh
% E-mail: jihoonsuh715@gmail.com
% Date created: 01/01/2021
% Date last modified: 01/03/2021
% MATLAB Version: R2020b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all; clc;
%----------------------- Initializations -----------------------
% load('GW_Course_easy.mat'); % the variable name for GW is 'GW' by default
load('GW_Course_hard.mat');
gwFig = drawGridWorld(GW, 'jet');
n = length(GW);
epi = 0;
max_epi = 10000;
epsilon = 1.0;
eps_decayRate = 0.9990; 
num_success = 0;
num_fail = 0;
step = 0;
max_steps = 300;
num_States = n*n;
num_Actions = 8;
Q_table = zeros(num_States, num_Actions);
player.x = 1; player.y = 1;
playerFig = drawAgent(player);
R_goal = 200;
R_pit = -20;
R_road = -1.5;
Rewards_per_epi = [];
Steps_per_epi = [];
alpha = 0.1; % Learning Rate
gamma = 0.9; % Discount Factor
statusChecker = 1000;

% Learning the Grid World with SARSA(0) with GLIE Policy
while (epi < max_epi)
    step = 0;
    cum_rewards = 0;
    dead = false;
    termReached = false;
    next_act_determined = false;
    while (step < max_steps && dead == false && termReached == false)
    % generate a random number
    rand_num = rand(1,1);
    curr_st = getStNum(player, n);
        % Epsilon-Greedy Policy
        if (next_act_determined == true)
            curr_act = next_act;
        else
            if rand_num > epsilon
                curr_act = chooseAction(Q_table, player, curr_st, n, 'greedy');
            else
                curr_act = chooseAction(Q_table, player, curr_st, n, 'random');
            end
        end
        [player, dead, termReached] = moveAgent(player, curr_act, GW);
        next_st = getStNum(player, n);
        % Epsilon-Greedy Policy
        if rand_num > epsilon
            next_act = chooseAction(Q_table, player, next_st, n, 'greedy');
        else
            next_act = chooseAction(Q_table, player, next_st, n, 'random');
        end
        next_act_determined = true;
        
        step = step + 1;
        
        % Reward
        if (dead == true)
            reward = R_pit;
            epi = epi + 1;
            num_fail = num_fail + 1;

        elseif (termReached == true)
            reward = R_goal;
            epi = epi + 1;
            num_success = num_success + 1;
        else
            reward = R_road;
        end
        cum_rewards = cum_rewards + reward;

% *******************   SARSA(0) learning update   *******************   
        Q_table(curr_st, curr_act) = (1 - alpha)*Q_table(curr_st, curr_act) + ...
                                    alpha*(reward + gamma*Q_table(next_st, next_act));
% *******************   SARSA(0) learning update   *******************   
        
        if (dead == true || termReached == true)
            player = resetAgent(player);
            epsilon = epsilon*eps_decayRate;
            Rewards_per_epi = [Rewards_per_epi; cum_rewards];
            Steps_per_epi = [Steps_per_epi; step];
        end
        
    end
    if (mod(epi, statusChecker) == 0)
        p1 = sprintf('Status Report at Episode %d:', epi);
        p2 = sprintf('        Epsilon: %.4f', epsilon);
        p3 = sprintf('        Number of Failures: %d', num_fail);
        p4 = sprintf('        Number of Successes: %d', num_success);
        disp(p1); disp(p2); disp(p3); disp(p4);
    end
end

% Plotting the results
figure;
plot([1:1:epi], movmean(Rewards_per_epi, max_steps)) % Average Reward Per Episode (Rewards accumulated at every step)
xlabel('Episode');
ylabel('Mean Reward');
title('Mean Reward: SARSA(0) on Grid World');

% Applying the greedy policy and simulate with learned Q table
gwFig = drawGridWorld(GW, 'jet');
title('Optimal Trajectory based greedy policy')
player.x = 1; player.y = 1; % player is a struct with the (x,y) coordinate
playerFig = drawAgent(player); % draw Agent on the Grid Wolrd
termReached = false;
Opt_Act_Seq = [];
curr_st = getStNum(player, n);
pause(0.8) % for animation
while (termReached == false)
    % Greedy Policy based on current Q table
    optimal_act = chooseAction(Q_table, player, curr_st, n, 'greedy');
    Opt_Act_Seq = [Opt_Act_Seq, optimal_act];
    [player, dead, termReached] = moveAgent(player, optimal_act, GW);
    set(playerFig, 'Visible', 'off');
    playerFig = drawAgent(player);
    pause(0.8) % for animation
    curr_st = getStNum(player, n);
end
rp1 = sprintf('Terminal State Reached with %d actions & reward of %.2f ',length(Opt_Act_Seq), ...
                                                        R_goal + R_road*(length(Opt_Act_Seq)-1));
rp2 = sprintf('Optimal Action Sequence is: %s', mat2str(Opt_Act_Seq));
disp(rp1); disp(rp2);