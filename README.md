# SARSA0_MATLAB
This is a simple MATLAB Implementation of tabular SARSA(0) on the Grid World envrionment.

To run, MATLAB is required along with every file on this repository.
Then, type the following commnad on the Command Window.
  
      $ run simulateRL_sarsa0.mat

* The size of the Grid World is 8x8 by default, provided by files 'GW_Course_easy.mat' and 'GW_Course_hard.mat'.

* One can create a different Grid World environment by changing the variable 'n' and the .mat file as needed.

* Tabular SARSA(0) algorithm is used with a decreasing epsilon-greedy policy.

* The plot for mean reward per episode is generated. Then, the animation of the optimal path is played.

For questions and concerns, please contact Jihoon Suh (jihoonsuh715@gmail.com).
