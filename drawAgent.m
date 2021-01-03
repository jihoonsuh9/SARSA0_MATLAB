function [agent_Fig] = drawAgent(agent)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File name: drawAgent.m
% Author: Jihoon Suh
% E-mail: jihoonsuh715@gmail.com
% Date created: 01/01/2021
% Date last modified: 01/01/2021
% MATLAB Version: R2020b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input: the current Grid World figure and the agent struct
% Output: visualize the Grid World with the agent's location
    hold on;
    agent_Fig = plot(agent.x, agent.y, '*', 'Color', '#EDB120', 'MarkerSize', 15, 'LineWidth', 3.3);
end