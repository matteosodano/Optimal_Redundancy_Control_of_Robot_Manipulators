clear;
tic;
%% data
delta_t = 0.01;
ti = 0;
tf = 1;

qi = [0; pi/2; 0];
ve = [-1; 0];                    

KAPPA0 = [0, 10, 1000, 200];
STR = ["zero", "manipulability", "jointLimits", "both"];
MOVIE = ["movie1.mp4", "movie2.mp4", "movie3.mp4", "movie4.mp4"];

i = 1;
sprintf("Simulation #%i", i);

[Q, ~, ~, R, ~, ~, ~, ~, E] = maxPontryagin(delta_t, ti, tf, qi, KAPPA0(i), ve, STR(i));   
toc;
%% Run Graphs() or animate() separately
%Graphs(Q, E, delta_t, ti, tf); 
%animate(Q, MOVIE(i));          % Robotics Toolbox by Peter Corke needed

