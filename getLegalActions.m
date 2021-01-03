function [legalActNumbers] = getLegalActions(agent, n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File name: getLegalActions.m
% Author: Jihoon Suh
% E-mail: jihoonsuh715@gmail.com
% Date created: 01/01/2021
% Date last modified: 01/02/2021
% MATLAB Version: R2020b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input: (1) agent with coordinates
%        (2) dimension length of GW
% Output: Legal Action Numbers

    legalActNumbers = 1:n;
    illegalActions = [];
    if (agent.x + 1 > n)
        illegalActions = [illegalActions, 1];
        illegalActions = [illegalActions, 2];
        illegalActions = [illegalActions, 8];
    end

    if (agent.y + 1 > n)
        illegalActions = [illegalActions, 2];
        illegalActions = [illegalActions, 3];
        illegalActions = [illegalActions, 4];
    end

    if (agent.x - 1 < 1)
        illegalActions = [illegalActions, 4];
        illegalActions = [illegalActions, 5];
        illegalActions = [illegalActions, 6];
    end

    if (agent.y - 1 < 1)
        illegalActions = [illegalActions, 6];
        illegalActions = [illegalActions, 7];
        illegalActions = [illegalActions, 8];
    end

    illegalActions = unique(illegalActions, 'first');
    legalActNumbers = setdiff(legalActNumbers, illegalActions);
    
end
