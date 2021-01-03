function [actionNum] = chooseAction(Qmatrix, agent, stateNum, n, PolType)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File name: chooseAction.m
% Author: Jihoon Suh
% E-mail: jihoonsuh715@gmail.com
% Date created: 01/01/2021
% Date last modified: 01/02/2021
% MATLAB Version: R2020b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input: (1) Q table
%        (2) agent
%        (3) State Number
%        (4) dimension length of GW
%        (5) Type of Policy ('greedy' or 'random')
% Output: the action number chosen for inputs

    legalActions = getLegalActions(agent, n);
    if PolType == 'greedy'
        [~, legalMaxidx] = max(Qmatrix(stateNum, legalActions));
        actionNum = legalActions(legalMaxidx);
    elseif PolType == 'random'
        legalidx = randi(length(legalActions), 1);
        actionNum = legalActions(legalidx); % random out of 1~8
    end

end
