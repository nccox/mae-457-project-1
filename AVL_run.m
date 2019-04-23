function AVL_run(aircraft,param,xcg,mass)
% Generates .run files for AVL demo.
% Inputs:
%   aircraft: name of .avl geometry file
%   param: parameter to vary (velocity in this case)
%   xcg: CG location (units aft of LE)
%	mass: aircraft mass (mass units)

numTests = length(param);

% open batch file for writing
batFile = [aircraft '.bat'];
batFileID = fopen(batFile,'w');
fprintf(batFileID,'@echo off\n');

for i = 1:numTests
    % Generate .run file
    runFile = [aircraft '_' num2str(i) '.run'];
    runFileID = fopen(runFile,'w');
    fprintf(runFileID,'LOAD\n');
    fprintf(runFileID,[aircraft '\n']);
    fprintf(runFileID,'OPER\n');
	% Enter parameters modification area
	fprintf(runFileID,'M\n');
	% Specify the aircraft's mass
    fprintf(runFileID,'M %.2f\n',mass);
	% Specify the aircraft's velocity
	fprintf(runFileID,'V %.1f\n',param(i));
	% Set gravitational acceleration
	fprintf(runFileID,'G 9.81\n');
	% Set atmospheric density to SSL value
	fprintf(runFileID,'D 1.225\n');
	% Exit the parameters modification area
	fprintf(runFileID,'\n');
    fprintf(runFileID,'d1 rm 0\nd2 pm 0\nd3 ym 0\n');
    fprintf(runFileID,'c1\nx %.3f\n\nX\nST\n',xcg);
    
    % Define .out filename
    outFile = [aircraft '_ST_' num2str(i) '.out'];
    fprintf(runFileID,[outFile '\nO']);
    fprintf(runFileID,'\n\nquit');
    fclose(runFileID);
    
    % Print commands to batch file
    fprintf(batFileID,['del ' outFile '\n']);
    fprintf(batFileID,['avl < ' runFile '\n']); 
end
fclose(batFileID);

% Run AVL program and plot results
system([aircraft '.bat'])
AVL_plotting(aircraft,numTests,param);
end