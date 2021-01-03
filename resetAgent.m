function [agent, legalMove, terminalReached] = resetAgent(agent)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File name: resetAgent.m
% Author: Jihoon Suh
% E-mail: jihoonsuh715@gmail.com
% Date created: 01/01/2021
% Date last modified: 01/01/2021
% MATLAB Version: R2020b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input: agent with coordinates
% Output: the moved agent containing the coordinate

%     disp('Resetting for new episode...');

    agent.x = 1; agent.y = 1;
    
end