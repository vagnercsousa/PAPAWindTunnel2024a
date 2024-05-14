clc;
clear;

filename = {'xf-n0012-il-R1e5-N5.txt', 'xf-n0012-il-R1e5-N9.txt', ...
            'xf-n0012-il-R2e5-N5.txt', 'xf-n0012-il-R2e5-N9.txt'};

ii = 1; % data file to read (from the list of filenames above)

fileID = fopen(filename{ii});
data = textscan(fileID, '%f %f %f %f %f %f %f', 'Delimiter', '\t', 'HeaderLines', 12);
fclose(fileID);

% data file format:
% alpha    CL        CD       CDp       CM     Top_Xtr  Bot_Xtr

xf_alpha = data{1}; % [deg]
xf_CL = data{2}; % [--]
xf_CD = data{3}; % [--]
xf_CDp = data{4}; % [--]
xf_CM = data{5}; % [--]
xf_Top_Xtr = data{6};
xf_Bot_Xtr = data{7};


figure(1);
hold('on');
plot(xf_alpha, xf_CL, 'LineWidth', 1.2);
set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on', 'FontSize', 15, 'Box', 'on');
xlabel('$\alpha$ [deg]', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('$c_{l}$', 'Interpreter', 'latex', 'FontSize', 18);


figure(2);
hold('on');
plot(xf_alpha, xf_CM, 'LineWidth', 1.2);
set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on', 'FontSize', 15, 'Box', 'on');
xlabel('$\alpha$ [deg]', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('$c_{m}$', 'Interpreter', 'latex', 'FontSize', 18);


figure(3);
hold('on');
plot(xf_alpha, xf_CD, 'LineWidth', 1.2);
set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on', 'FontSize', 15, 'Box', 'on');
xlabel('$\alpha$ [deg]', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('$c_{d}$', 'Interpreter', 'latex', 'FontSize', 18);


figure(4);
hold('on');
plot(xf_alpha, xf_CL ./ xf_CD, 'LineWidth', 1.2);
set(gca, 'XMinorTick', 'on', 'YMinorTick', 'on', 'FontSize', 15, 'Box', 'on');
xlabel('$\alpha$ [deg]', 'Interpreter', 'latex', 'FontSize', 18);
ylabel('$c_{l} / c_{d}$', 'Interpreter', 'latex', 'FontSize', 18);
