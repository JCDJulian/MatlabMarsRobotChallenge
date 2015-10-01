% Copyright 2014 - 2015 The MathWorks, Inc.
%% loadRobotParameters.m
% This MATLAB script populates the workspace with parameters related to the
% simulation of the Mars rover robot. It specifies plant model parameters to
% characterise the motors and motion of the Mars rover robot.

do_one_run = true; % TRUE for competition (robot stop when all targets are done)
                    % FALSE for demo (robot run forever, start again with
                    %   first target when last one is done)

%% Robot Geometry
AxleLength = 16.36; %Distance between centre-line of driving wheels is 162mm [cm]
WheelRadius = 7/2 ; %Driving wheel diameter is 70mm [cm]

%% Initial Conditions for Robot Position
theta0 = 0; %Initial Robot Angle relative to positive x-axis [deg]
startPos = single([50 50]); % [cm] %simplifies stateflow if declared single here, but requires cast to double in integrator

%% Plant Model Motor Parameters:
EncR_init = 0;          %Right encoder initialisation value [deg]
EncL_init = 0;          %Left encoder initialisation value [deg]
EncRes = 636;           %Encoder resolution 636
TauMotor = 0.1;         %Motor time constant

slip_intensity = 0.001; % Estimated slip intensity

%% Plant motor characteristics
motorX = [-100.000000 -90.000000 -70.000000 -50.000000 -30.000000 -27.000000 27.000000 30.000000 50.000000 70.000000 90.000000 100.000000 ];
motorL = [-967.207000 -900.359000 -783.375000 -618.344000 -325.884000 -0.000000 0.000000 325.884000 618.344000 783.375000 900.359000 967.207000 ];
motorR = [-937.961000 -850.223000 -768.752000 -618.344000 -302.905000 -0.000000 0.000000 302.905000 618.344000 768.752000 850.223000 937.961000 ];

motorDeadBand = 30;

%% Camera characteristics
pcam = [24, 100]; % pcam depth of the field of view [cm]
lcam = [21, 90];  % width of the field of view [cm]

%% Distance sensor characteristics
Simulink.defineIntEnumType('DistanceSensorPosition', {'NO','LEFT','MIDDLE','RIGHT'},0:3)

sensor_distance =   [85  80  75  70  65  60  55  50  45  40  35  30  25  20  15  10  5];
sensor_value =      [132 136 144 151 156 162 173 190 210 225 256 275 321 393 504 715 965];
AngularSpeed = 300;

%% Simulation Parameters
Ts = 0.1;  % Step size for model

%% Default Sites Positions
Sites;
