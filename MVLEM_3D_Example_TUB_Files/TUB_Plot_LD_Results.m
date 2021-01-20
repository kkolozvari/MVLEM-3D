clc
clear all
close all

NoStepPerDir = 200; % Numer of increments per step
PlotLim = 700;

% Load Model Data
FolderName1 = sprintf('TUB_Analysis_Results');
NODE_CONTROL2950 = load(fullfile(FolderName1,'NODE_DISP_2950.out'));
REACTIONS = load(fullfile(FolderName1,'REACTIONS_1.out'));
NODE_CONTROL3350 = load(fullfile(FolderName1,'NODE_DISP_3350.out'));

modelColor = 'r';
modelLineThick = 1.0;
testColor = 'k';
testLineThick = 1.0;
axisColor = [0.5 0.5 0.5];

%% INPUT END

% Process Model Data
DtopX2950 = NODE_CONTROL2950(:,2);
DtopX2950(1:100)=[];
DtopY2950 = NODE_CONTROL2950(:,3);
DtopY2950(1:100)=[];
DtopX3350 = NODE_CONTROL3350(:,2);
DtopX3350(1:100)=[];

[nosteps,~] = size(DtopX3350);

[nostepsR,datasizeR] = size(REACTIONS);
for i=1:nostepsR
    Rx(i) = sum(REACTIONS(i,2:6:datasizeR));
    Ry(i) = sum(REACTIONS(i,3:6:datasizeR));
end

for i=1:nostepsR
    Fx(i) = -Rx(i);
    Fy(i) = -Ry(i);
end

% Remove gravity results
Fx(1:100)=[];
Fy(1:100)=[];

Dir = xlsread('TUB_Dtop_Model_Input.xlsx','Dtop','D4:D128');
[nodir,trash] = size(Dir);

Dirs = zeros(nodir*NoStepPerDir,1);

for i=1:nodir
    for j=1:NoStepPerDir
        Dirs((i-1)*NoStepPerDir+j,1) = Dir(i);
    end
end

%% Load Test Data
NScycle_NS_FD = load('TUB_Test_Data\NScycle_NS_FD.txt');
EWcycle_EW_FD = load('TUB_Test_Data\EWcycle_EW_FD.txt');
Diagcycle_NS_FD = load('TUB_Test_Data\Diagcycle_NS_FD.txt');
Diagcycle_EW_FD = load('TUB_Test_Data\Diagcycle_EW_FD.txt');

%% Calculate Results
dX=1;dY=1;
for i=1:nosteps
    if Dirs(i) == 1 % X cycles (EW)
        Fx_12(i,1) = Fx(i);
        DtopX_12_3350(i,1) = DtopX3350(i,1);
        Fy_ew(i,1) = Fy(i);
        Fy_12(i,1) = 0.0;
        Fx_ns(i,1) = 0.0;
        DtopY_12_2950(i,1) = 0.0;
        dX = dX+1;
    elseif Dirs(i) == 2 % Y cycles (NS)
        Fx_12(i,1) = 0.0;
        DtopX_12_3350(i,1) = 0.0;
        Fy_12(i,1) = Fy(i);
        Fy_ew(i,1) = 0.0;
        Fx_ns(i,1) = Fx(i);
        DtopY_12_2950(i,1) = DtopY2950(i,1);
        %         dY = dY+1;
    elseif Dirs(i) == 3 % Diagonal cycles
        Fx_Diag(i,1) = Fx(i);
        DtopX_Diag_2950(i,1) = DtopX2950(i,1);
        Fy_Diag(i,1) = Fy(i);
        DtopY_Diag_2950(i,1) = DtopY2950(i,1);
    else
        Fx_12(i,1) = 0.0;
        DtopX_12_3350(i,1) = 0.0;
        Fy_12(i,1) = 0.0;
        Fy_ew(i,1) = 0.0;
        Fx_ns(i,1) = 0.0;
        DtopY_12_2950(i,1) = 0.0;
        
        Fx_Diag(i,1) = 0.0;
        DtopX_Diag_2950(i,1) = 0.0;
        Fy_Diag(i,1) = 0.0;
        DtopY_Diag_2950(i,1) = 0.0;
        
        dY = dY+1;
    end
end

%% SRSS Calculations

% SRSS Calculation
for i=1:length(Diagcycle_NS_FD(:,1))
    if Diagcycle_EW_FD(i,1) >= 0
        Diag_SRSS_Disp_Test(i,1) = sqrt(Diagcycle_NS_FD(i,1)^2 + Diagcycle_EW_FD(i,1)^2);
    else
        Diag_SRSS_Disp_Test(i,1) = -sqrt(Diagcycle_NS_FD(i,1)^2 + Diagcycle_EW_FD(i,1)^2);
    end
end

for i=1:length(Diagcycle_NS_FD(:,1))
    if Diagcycle_EW_FD(i,1) >= 0
        Diag_SRSS_Force_Test(i,1) = sqrt(Diagcycle_NS_FD(i,2)^2 + Diagcycle_EW_FD(i,2)^2);
    else
        Diag_SRSS_Force_Test(i,1) = -sqrt(Diagcycle_NS_FD(i,2)^2 + Diagcycle_EW_FD(i,2)^2);
    end
end

% SRSS direction
for i=1:nosteps
    if DtopY_Diag_2950(i,1) == 0
        SRSS_Dir(i,1) = 0;
    else
        SRSS_Dir(i,1) = DtopY_Diag_2950(i,1)/abs(DtopY_Diag_2950(i,1));
    end
end

% SRSS displacement - model
DtopX_Diag_2950_sq = DtopX_Diag_2950.^2;
DtopY_Diag_2950_sq = DtopY_Diag_2950.^2;
for i=1:nosteps
    SRSS_Disp(i,1) = sqrt(DtopX_Diag_2950_sq(i,1) + DtopY_Diag_2950_sq(i,1))*SRSS_Dir(i,1);
end

% SRSS force - model
Diag_SRSS_F_X_sq = Fx_Diag.^2;
Diag_SRSS_F_Y_sq = Fy_Diag.^2;
for i=1:nosteps
    Diag_SRSS_F_Model(i,1) = sqrt(Diag_SRSS_F_X_sq(i,1) + Diag_SRSS_F_Y_sq(i,1))*SRSS_Dir(i,1);
end

%% Plot
figure(1)
subplot(1,3,1)
plot([0 0],[-PlotLim PlotLim],'Color',axisColor,'LineWidth',0.2)
hold on
plot([-120 120],[0 0],'Color',axisColor,'LineWidth',0.2)
Test = plot(EWcycle_EW_FD(:,1),EWcycle_EW_FD(:,2),testColor,'Linewidth',testLineThick);
Model = plot(DtopX_12_3350(:,1)*25.4,Fx_12(:,1)/0.224808943871,modelColor,'Linewidth',modelLineThick);
axis([-120 120 -PlotLim PlotLim])
xlabel('EW displ. at h=3.35m (mm)')
ylabel('EW Force (kN)')
title('a) Load-deformation in EW dir.')

legend('Location','southeast')
legend('boxoff')
hA=gca;
hA.XMinorTick = 'on';
hA.YMinorTick = 'on';
lg = legend([Test Model], 'Test','Model');

subplot(1,3,2)
plot([0 0],[-PlotLim PlotLim],'Color',axisColor,'LineWidth',0.2)
hold on
plot([-120 120],[0 0],'Color',axisColor,'LineWidth',0.2)
Test = plot(NScycle_NS_FD(:,1),NScycle_NS_FD(:,2),testColor,'Linewidth',testLineThick);
Model = plot(DtopY_12_2950(:,1)*25.4,Fy_12(:,1)/0.224808943871,modelColor,'Linewidth',modelLineThick);
axis([-120 120 -PlotLim PlotLim])
xlabel('NS displ. at h=2.95m (mm)')
ylabel('NS Force (kN)')
title('b) Load-deformation in NS dir.')

legend('Location','southeast')
legend('boxoff')
hA=gca;
hA.XMinorTick = 'on';
hA.YMinorTick = 'on';
lg = legend([Test Model], 'Test','Model');

subplot(1,3,3)
p1 = plot([0 0],[-PlotLim PlotLim],'Color',axisColor,'LineWidth',0.2);
hold on
plot([-120 120],[0 0],'Color',axisColor,'LineWidth',0.2)
Test = plot(Diag_SRSS_Disp_Test(:,1),Diag_SRSS_Force_Test(:,1),testColor,'Linewidth',testLineThick);
Model = plot(SRSS_Disp(:,1)*25.4,Diag_SRSS_F_Model(:,1)/0.224808943871,modelColor,'Linewidth',modelLineThick);
axis([-100 100 -PlotLim PlotLim])
xlabel('SRSS displacement at h=2.95m (mm)')
ylabel('SRSS Force (kN)')
title('c) SRSS Force-Displ. in Diagonal Dir.')

legend('Location','southeast')
legend('boxoff')
hA=gca;
hA.XMinorTick = 'on';
hA.YMinorTick = 'on';
lg = legend([Test, Model],'Test','Model');

set(0,'defaultfigureposition', [100 100 1200 300]);