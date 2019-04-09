function AVL_demo_plotting(aircraft,numTests,param)
% Reads in elevator angle and lift coefficient data from AVL
%   output files and plots vs. velocity.
% Inputs:
%   aircraft: name of .avl geometry file
%   numTests: number of AVL iterations
%   param: parameter to vary (velocity in this case)

vel = param;
de = zeros(1,numTests);
cl = zeros(1,numTests);

for j = 1:numTests
    fid = fopen([aircraft '_ST_' num2str(j) '.out']);
    if fid ~= -1
        % Skip to the line with CL data
        for i = 1:23
            fgetl(fid);
        end
        line = fgetl(fid);
        % Scan in CL
        cl_temp = textscan(line,'%s %s %f');
        cl(j) = cl_temp{3}(1);
        % Skip to the line with elevator angle data
        for i = 1:7
            fgetl(fid);
        end
        line = fgetl(fid);
        % Scan in elevator angle
        de_temp = textscan(line,'%s %s %f');
        de(j) = de_temp{3}(1);
        fclose(fid);
    else
        keyboard;
    end
end

figure
plot(vel,de);
xlabel('Velocity [m/s]','Interpreter','Latex')
ylabel('$\delta_e [^{\circ}]$','Interpreter','Latex')
grid on

figure
plot(vel,cl);
xlabel('Velocity [m/s]','Interpreter','Latex')
ylabel('$C_L$','Interpreter','Latex')
grid on
end
