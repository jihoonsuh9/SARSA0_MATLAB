function gwFig = drawGridWorld(gridWorld, gwColor)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File name: drawGridWorld.m
% Author: Jihoon Suh
% E-mail: jihoonsuh715@gmail.com
% Date created: 01/01/2021
% Date last modified: 01/01/2021
% MATLAB Version: R2020b
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Input: the numeric array of the Grid World;
%       value 'Inf' indicates the pit
%       The start state is at (1,1) and the goal state (8,8)
% Output: visualize the Grid World in a figure
    figure;
    gwFig = image(gridWorld);
    colormap(gwColor); 
%     colorbar;
    axis off; axis equal;
    hold on;
    for x = 1:length(gridWorld)-1
        plot([x+0.5 x+0.5], [0.5 8.5], 'w--');
    end
    for y = 1:length(gridWorld)-1
        plot([0.5, 8.5], [y+0.5 y+0.5], 'w--');
    end
    
% Marking the Grid World with START and GOAL states
    plot(1, 1, 'wo', 'MarkerSize', 25, 'LineWidth', 1.5);
    plot(8, 8, 'gp', 'MarkerSize', 25, 'Linewidth', 1.5);
    
%     text(0.55, 1, 'START', 'Color', 'black', 'FontSize', 8)
%     text(7.65, 8, 'GOAL', 'Color', 'black', 'FontSize', 8)
end
    