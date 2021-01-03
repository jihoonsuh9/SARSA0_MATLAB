function [stNum] = getStNum(agent, n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File name: getStNum.m
% Author: Jihoon Suh
% E-mail: jihoonsuh715@gmail.com
% Date created: 01/01/2021
% Date last modified: 01/01/2021
% MATLAB Version: R2020b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input: (1) agent with coordinates
%        (2) Grid World dimension length
% Output: the state number associated with the agent's coordinate
%               stNum ranges from 1 ~ n*n
    stNum = n*(agent.y - 1) + agent.x;
end
