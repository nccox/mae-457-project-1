function AVL_demo_run(aircraft,param,xcg)
% Generates .run files for AVL demo.
% Inputs:
%   aircraft: name of .avl geometry file
%   param: parameter to vary (velocity in this case)
%   xcg: CG location (units aft of LE)

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
    fprintf(runFileID,'M\nM 1111\nV %.1f\nG 9.81\nD 1.225\n\n',param(i));
    fprintf(runFileID,'d2 rm 0\nd3 pm 0\nd4 ym 0\n');
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