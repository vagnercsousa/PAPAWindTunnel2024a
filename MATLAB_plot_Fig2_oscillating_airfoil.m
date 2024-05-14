%% This script generates Fig. 2 of the article
% (an animated figure is also provided for illustration purposes)

% create sample time, plunge and pitch data for the airfoil motion
% (sample data here for illustration purposes only; replace with actual results)
time = 0 : 0.05 : 2; % [s]
plunge = cos(2 * pi * 1 * time); % sample oscillatory motion in plunge DoF
pitch = 0.5 * sin(2 * pi * 1 * time); % sample oscillatory motion in pitch DoF

numAirf = 20; % number of airfoil to show in the figure
magnif = 1; % scale sample displacements to improve visibility (illustration purposes only)


% function flPlotAirfoil(plunge, pitch, numAirf, magnif)
%   Plots the typical aeroelastic section of NACA-0012 profile for the
%   input displacement vectors 'plunge' and 'pitch'. Input parameter
%   'numAirf' is the number of airfoils to be plotted in figure.
%   'magnif' scales the displacements to improve readability.


    %% NACA 0012 (121 Data Points)

    dp = [ ...
        1.000000      0.001260
        0.999315      0.001356
        0.997261      0.001644
        0.993844      0.002120
        0.989074      0.002783
        0.982963      0.003626
        0.975528      0.004642
        0.966790      0.005826
        0.956773      0.007168
        0.945503      0.008658
        0.933013      0.010286
        0.919335      0.012042
        0.904508      0.013914
        0.888573      0.015891
        0.871572      0.017959
        0.853553      0.020107
        0.834565      0.022323
        0.814660      0.024593
        0.793893      0.026905
        0.772320      0.029246
        0.750000      0.031603
        0.726995      0.033962
        0.703368      0.036311
        0.679184      0.038634
        0.654508      0.040917
        0.629410      0.043147
        0.603956      0.045307
        0.578217      0.047383
        0.552264      0.049358
        0.526168      0.051216
        0.500000      0.052940
        0.473832      0.054515
        0.447736      0.055923
        0.421783      0.057148
        0.396044      0.058175
        0.370590      0.058989
        0.345492      0.059575
        0.320816      0.059921
        0.296632      0.060015
        0.273005      0.059848
        0.250000      0.059412
        0.227680      0.058702
        0.206107      0.057714
        0.185340      0.056447
        0.165435      0.054902
        0.146447      0.053083
        0.128428      0.050996
        0.111427      0.048648
        0.095492      0.046049
        0.080665      0.043211
        0.066987      0.040145
        0.054497      0.036867
        0.043227      0.033389
        0.033210      0.029726
        0.024472      0.025893
        0.017037      0.021904
        0.010926      0.017770
        0.006156      0.013503
        0.002739      0.009114
        0.000685      0.004611
        0.000000      0.000000
        0.000685     -0.004611
        0.002739     -0.009114
        0.006156     -0.013503
        0.010926     -0.017770
        0.017037     -0.021904
        0.024472     -0.025893
        0.033210     -0.029726
        0.043227     -0.033389
        0.054497     -0.036867
        0.066987     -0.040145
        0.080665     -0.043211
        0.095492     -0.046049
        0.111427     -0.048648
        0.128428     -0.050996
        0.146447     -0.053083
        0.165435     -0.054902
        0.185340     -0.056447
        0.206107     -0.057714
        0.227680     -0.058702
        0.250000     -0.059412
        0.273005     -0.059848
        0.296632     -0.060015
        0.320816     -0.059921
        0.345492     -0.059575
        0.370590     -0.058989
        0.396044     -0.058175
        0.421783     -0.057148
        0.447736     -0.055923
        0.473832     -0.054515
        0.500000     -0.052940
        0.526168     -0.051216
        0.552264     -0.049358
        0.578217     -0.047383
        0.603956     -0.045307
        0.629410     -0.043147
        0.654508     -0.040917
        0.679184     -0.038634
        0.703368     -0.036311
        0.726995     -0.033962
        0.750000     -0.031603
        0.772320     -0.029246
        0.793893     -0.026905
        0.814660     -0.024593
        0.834565     -0.022323
        0.853553     -0.020107
        0.871572     -0.017959
        0.888573     -0.015891
        0.904508     -0.013914
        0.919335     -0.012042
        0.933013     -0.010286
        0.945503     -0.008658
        0.956773     -0.007168
        0.966790     -0.005826
        0.975528     -0.004642
        0.982963     -0.003626
        0.989074     -0.002783
        0.993844     -0.002120
        0.997261     -0.001644
        0.999315     -0.001356
        1.000000     -0.001260  ];


    %% Plot
    
    n = numAirf; % number of 'airfoils' in figure
    
    fs = length(plunge) - 1;

    t = round(0 : fs / (n - 1) : fs); % points (time instant) of each airfoil
    t(1) = 1; % (1st point)

    pit = pitch(t) * magnif; % ('*x' to magnify the motion)
    plu = plunge(t) * magnif;

    dp_rot = cell(1, n);


    figure();
    hold all;
    plot([0, n+0+0.2*(n-1)], [0, 0], ':k', 'LineWidth', 1);

    
    % -plunge because of pitch direction in rotation matrix below
    plot((0 : (n-1 + 0.2*(n-1))/(length(plunge)-1) : (n-1 + 0.2*(n-1))) + 1/4 +0.75, -plunge*1, '--b', 'LineWidth', 1);

    plot((0 : (n-1 + 0.2*(n-1))/(length(pitch)-1) : (n-1 + 0.2*(n-1))) + 1/4 +0.5, pitch*2, '--r', 'LineWidth', 1);


    for i = 1 : n

        for j = 1 : length(dp(:,1))

            % Rotation about point (X,Y) (translations are required):
            X = 0.25; % 1/4 cord: elastic axis of typical section
            Y = 0;

            % Scaling by
            Sx = 1;
            Sy = 1;


            ScMat = [   Sx,   0,    0;
                         0,  Sy,    0;
                         0,   0,    1   ]; % scale


            TransMat = [    1,      0,       X;
                            0,      1,       Y;
                            0,      0,       1  ]; % translate (x, y)


            RotMat = [  cos(pit(i)),   +sin(pit(i)),     0;
                       -sin(pit(i)),    cos(pit(i)),     0;
                             0,              0,          1  ]; % rotate (angle)

            % (direction of rotation is reversed (-/+ sin) due to +pitch displacement)


            TransMatM = [   1,      0,      -X;
                            0,      1,      -Y;
                            0,      0,       1	]; % translate (-x, -y)


            dp_rot{i}(j,:) = ScMat * TransMat * RotMat * TransMatM * [dp(j,:), 1]'; % <<== (W = 1)

            dp_rot{i}(j,:) = dp_rot{i}(j,:) + [(i-1)+(i-1)*0.2, 0, 0]; % <<== for ploting at right


            % plunge motion (translate all current airfoil points)

            TransMatM = [   1,      0,       0;
                            0,      1,    -plu(i);
                            0,      0,       1	]; % translate (-x, -y)

            dp_rot{i}(j,:) = TransMatM * dp_rot{i}(j,:)';

        end
        
        
        patch(dp_rot{i}(:,1), dp_rot{i}(:,2), 1:length(dp_rot{i}(:,1)), 'FaceColor', 'cyan', 'linewidth', 1.2);
        
    end


    axis image;
    box('on');
    set(gca, 'XTickLabel', []);
    set(gca, 'YTickLabel', []);

% end % of function

xlim([0, 23.8]);
ylim([-1.5, 1.5]);
