% AVL file of aircraft
aircraft = 'm7-260C.avl';

% Velocities to test (in knots)
velocity_knots = 43:5:158;
% Convert velocities to meters per second
param = velocity_knots.*0.514444;

% CG location (units aft of LE)
xcg_inches = 21.895428;
% Convert to meters
xcg = xcg_inches.*0.0254;

% Run the AVL demo
AVL_demo_run(aircraft,param,xcg)