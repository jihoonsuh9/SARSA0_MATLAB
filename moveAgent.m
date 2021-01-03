function [agent, death, terminalReached] = moveAgent(agent, action, GW)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File name: moveAgent.m
% Author: Jihoon Suh
% E-mail: jihoonsuh715@gmail.com
% Date created: 01/01/2021
% Date last modified: 01/02/2021
% MATLAB Version: R2020b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input: (1) the current agent containing the coordinate
%        (2) action number
%                    1: E
%                    2: SE
%                    3: S
%                    4: SW
%                    5: W
%                    6: NW
%                    7: N
%                    8: NE
%        (3) Grid World Structure
%
% Output: (1) the moved agent containing the coordinate
%         (2) flag for encountering the pit
%         (3) terminal state reach flag
death = false;
    if action == 1 % E
        if (GW(agent.y, agent.x + 1) == inf)
            death = true;
%             disp('PIT! Player trapped!');
            agent.x = agent.x + 1;
        else
            agent.x = agent.x + 1;
        end 
    elseif action == 2 % SE
        if (GW(agent.y + 1, agent.x + 1) == inf)
            death = true;
%             disp('PIT! Player trapped!');
            agent.x = agent.x + 1;
            agent.y = agent.y + 1;
        else
            agent.x = agent.x + 1;
            agent.y = agent.y + 1;
        end
    elseif action == 3 % S
        if (GW(agent.y + 1, agent.x) == inf)
            death = true;
%             disp('PIT! Player trapped!');
            agent.y = agent.y + 1;
        else
            agent.y = agent.y + 1;
        end
    elseif action == 4 % SW
        if (GW(agent.y + 1, agent.x - 1) == inf)
            death = true;
%             disp('PIT! Player trapped!');
            agent.x = agent.x - 1;
            agent.y = agent.y + 1;
        else
            agent.x = agent.x - 1;
            agent.y = agent.y + 1;
        end
    elseif action == 5 % W
        if (GW(agent.y, agent.x - 1) == inf)
            death = true;
%             disp('PIT! Player trapped!');
            agent.x = agent.x - 1;
        else
            agent.x = agent.x - 1;
        end
    elseif action == 6 % NW
        if (GW(agent.y - 1, agent.x - 1) == inf)
            death = true;
%             disp('PIT! Player trapped!');
            agent.x = agent.x - 1;
            agent.y = agent.y - 1;
        else
            agent.x = agent.x - 1;
            agent.y = agent.y - 1;
        end
    elseif action == 7 % N
        if (GW(agent.y - 1, agent.x) == inf)
            death = true;
%             disp('PIT! Player trapped!');
            agent.y = agent.y - 1;
        else
            agent.y = agent.y - 1;
        end
    elseif action == 8 % NE
        if (GW(agent.y - 1, agent.x + 1) == inf)
            death = true;
%             disp('PIT! Player trapped!');
            agent.x = agent.x + 1;
            agent.y = agent.y - 1;
        else
            agent.x = agent.x + 1;
            agent.y = agent.y - 1;
        end
    end
    
    if (agent.x == 8 && agent.y == 8)
        terminalReached = true;
    else
        terminalReached = false;
    end
end