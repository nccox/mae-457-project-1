% AVL file of aircraft
aircraft = 'glider2.avl';

% Velocities to test (in knots)
velocity_knots = 1:0.5:20;
% Convert velocities to meters per second
param = velocity_knots.*0.514444;
%param = 33:0.1:36;
%param = 33.5:0.005:33;
%param = 33.555215;

% CG location (units aft of LE)
xcg_inches = 1.5;
% Convert to meters
xcg = xcg_inches.*0.0254;

mass = 0.020;

% Run the AVL demo
AVL_run(aircraft,param,xcg,mass)

%% find Vtrim
load('results.mat');
vtrim = interp1(de,vel,0);
fprintf('V_trim for delta_e=0: %.6f',vtrim);