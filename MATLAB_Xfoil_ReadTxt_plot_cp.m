clc;
clear;

filename = {'xf_xCp_R100_a00.dat', 'xf_xCp_R100_a04.dat', ...
            'xf_xCp_R100_a08.dat', 'xf_xCp_R100_a12.dat', ...
            'xf_xCp_R100_a04_visc.dat', 'xf_xCp_R100_a08_visc.dat'};

ii = 1; % data file to read (from the list of filenames above)

fileID = fopen(filename{ii});
data = textscan(fileID, '%f %f %f', 'Delimiter', '\t', 'HeaderLines', 3);
fclose(fileID);

% data file format:
% chord-normalized x y coordinates and corresponding pressure coefficient
xf_x = data{1}; % [x/c]
xf_y = data{2}; % [y/c]
xf_Cp = data{3}; % [--]

% split data between upper and lower surfaces (to plot with different line styles)
xf_x1 = xf_x(1:end/2);
xf_x2 = xf_x((end/2+1):end);
xf_y1 = xf_y(1:end/2);
xf_y2 = xf_y((end/2+1):end);
xf_Cp1 = xf_Cp(1:end/2);
xf_Cp2 = xf_Cp((end/2+1):end);


fileID = fopen('NACA0012.dat');
data = textscan(fileID, '%f %f', 'Delimiter', '\t', 'HeaderLines', 1);
fclose(fileID);
nx = data{1}; % [x/c]
ny = data{2}; % [y/c]


figure(1);
hold('on');
% plot(xf_x, xf_Cp, 'LineWidth', 1.2); % upper and lower as a single curve
plot(xf_x1, xf_Cp1, xf_x2, xf_Cp2, 'LineWidth', 1.2); % split upper and lower curves
set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on', 'FontSize', 15, 'Box', 'on');
xlabel('$x/c$', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('$c_{p}$', 'Interpreter', 'latex', 'FontSize', 18);
set(gca, 'YDir', 'reverse'); % y-axis is negative upwards


figure(2);
hold('on');
plot(nx, ny, 'LineWidth', 2); % plot the airfoil
set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on', 'FontSize', 15, 'Box', 'on');
xlabel('$x/c$', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('$y/c$', 'Interpreter', 'latex', 'FontSize', 18);
axis('image'); % proportional aspect ratio
