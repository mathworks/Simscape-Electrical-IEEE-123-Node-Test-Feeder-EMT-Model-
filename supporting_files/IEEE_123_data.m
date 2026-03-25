%
% This script defines the network data
%
% Copyright 2018 The MathWorks, Inc.
%

warning('off','all')

% IEEE 123 bus

% miles/km

mi2km = 1.609344;

% feet to km

ft2km = 0.0003048;

% microsiemens to Farads

ms2F = 1/2/pi/60*1e-6;


%% Configuration 1 - series reactance - ohm/mile

lineData.R_1 = [ 0.4576 0.1560 0.1535
        0.1560 0.4666 0.1580
        0.1535 0.1580 0.4615];
    
lineData.X_1 = [ 1.0780 0.5017 0.3849
        0.5017 1.0482 0.4236
        0.3849 0.4236 1.0651];

% charging susceptance - microsiemens/mile

lineData.B_1 = [ 5.6765 -1.8319 -0.6982
        -1.8319 5.9809 -1.1645
        -0.6982 -1.1645 5.3971];

% convert

lineData.R_1 = lineData.R_1/mi2km;

lineData.L_1 = lineData.X_1/mi2km/2/pi/60;

lineData.C_1 = lineData.B_1/mi2km*ms2F;


%% Configuration 2 - series reactance - ohm/mile

lineData.R_2 = [ 0.4666 0.1580 0.1560
        0.1580 0.4615 0.1535
        0.1560 0.1535 0.4576];
    
lineData.X_2 = [ 1.0482 0.4236 0.5017
        0.4236 1.0651 0.3849
        0.5017 0.3849 1.0780];

% charging susceptance - microsiemens/mile

lineData.B_2 = [ 5.9809 -1.1645 -1.8319
        -1.1645 5.3971 -0.6982
        -1.8319 -0.6982 5.6765];

% convert

lineData.R_2 = lineData.R_2/mi2km;

lineData.L_2 = lineData.X_2/mi2km/2/pi/60;

lineData.C_2 = lineData.B_2/mi2km*ms2F;


%% Configuration 3 - series reactance - ohm/mile

lineData.R_3 = [ 0.4615 0.1535 0.1580
        0.1535 0.4576 0.1560
        0.1580 0.1560 0.4666];
    
lineData.X_3 = [ 1.0651 0.3849 0.4236
        0.3849 1.0780 0.5017
        0.4236 0.5017 1.0482];

% charging susceptance - microsiemens/mile

lineData.B_3 = [ 5.3971 -0.6982 -1.1645
        -0.6982 5.6765 -1.8319
        -1.1645 -1.8319 5.9809];

% convert

lineData.R_3 = lineData.R_3/mi2km;

lineData.L_3 = lineData.X_3/mi2km/2/pi/60;

lineData.C_3 = lineData.B_3/mi2km*ms2F;

%% Configuration 4 - series reactance - ohm/mile

lineData.R_4 = [ 0.4615 0.1580 0.1535
        0.1580 0.4666 0.1560
        0.1535 0.1560 0.4576];
    
lineData.X_4 = [ 1.0651 0.4236 0.3849
        0.4236 1.0482 0.5017
        0.3849 0.5017 1.0780];

% charging susceptance - microsiemens/mile

lineData.B_4 = [ 5.3971 -1.1645 -0.6982
        -1.1645 5.9809 -1.8319
        -0.6982 -1.8319 5.6765];

% convert

lineData.R_4 = lineData.R_4/mi2km;

lineData.L_4 = lineData.X_4/mi2km/2/pi/60;

lineData.C_4 = lineData.B_4/mi2km*ms2F;

%% Configuration 5 - series reactance - ohm/mile

lineData.R_5 = [ 0.4666 0.1560 0.1580
        0.1560 0.4576 0.1535
        0.1580 0.1535 0.4615];
    
lineData.X_5 = [ 1.0482 0.5017 0.4236
        0.5017 1.0780 0.3849
        0.4236 0.3849 1.0651];

% charging susceptance - microsiemens/mile

lineData.B_5 = [ 5.9809 -1.8319 -1.1645
        -1.8319 5.6765 -0.6982
        -1.1645 -0.6982 5.3971];

% convert

lineData.R_5 = lineData.R_5/mi2km;

lineData.L_5 = lineData.X_5/mi2km/2/pi/60;

lineData.C_5 = lineData.B_5/mi2km*ms2F;

%% Configuration 6 - series reactance - ohm/mile

lineData.R_6 = [ 0.4576 0.1535 0.1560
        0.1535 0.4615 0.1580
        0.1560 0.1580 0.4666];
    
lineData.X_6 = [ 1.0780 0.3849 0.5017
        0.3849 1.0651 0.4236
        0.5017 0.4236 1.0482];

% charging susceptance - microsiemens/mile

lineData.B_6 = [ 5.6765 -0.6982 -1.8319
        -0.6982 5.3971 -1.1645
        -1.8319 -1.1645 5.9809];

% convert

lineData.R_6 = lineData.R_6/mi2km;

lineData.L_6 = lineData.X_6/mi2km/2/pi/60;

lineData.C_6 = lineData.B_6/mi2km*ms2F;

%% Configuration 7 - series reactance - ohm/mile [A,C]

lineData.R_7 = [ 0.4576 0.1535
        0.1535 0.4615];
    
lineData.X_7 = [ 1.0780 0.3849
        0.3849 1.0651];

% charging susceptance - microsiemens/mile

lineData.B_7 = [ 5.1154  -1.0549
        -1.0549 5.1704];

% convert

lineData.R_7 = lineData.R_7/mi2km;

lineData.L_7 = lineData.X_7/mi2km/2/pi/60;

lineData.C_7 = lineData.B_7/mi2km*ms2F;

%% Configuration 8 - series reactance - ohm/mile [A,B]

lineData.R_8 = [ 0.4576 0.1535
        0.1535 0.4615];
    
lineData.X_8 = [ 1.0780 0.3849
        0.3849 1.0651];

% charging susceptance - microsiemens/mile

lineData.B_8 = [ 5.1154  -1.0549
        -1.0549  5.1704];

% convert

lineData.R_8 = lineData.R_8/mi2km;

lineData.L_8 = lineData.X_8/mi2km/2/pi/60;

lineData.C_8 = lineData.B_8/mi2km*ms2F;

%% Configuration 9 - series reactance - ohm/mile [A]

lineData.R_9 = 1.3292;
    
lineData.X_9 = 1.3475;

% charging susceptance - microsiemens/mile

lineData.B_9 = 4.5193;

% convert 

lineData.R_9 = lineData.R_9/mi2km;

lineData.L_9 = lineData.X_9/mi2km/2/pi/60;

lineData.C_9 = lineData.B_9/mi2km*ms2F;

%% Configuration 10 - series reactance - ohm/mile [B]

lineData.R_10 = 1.3292;
    
lineData.X_10 = 1.3475;

% charging susceptance - microsiemens/mile

lineData.B_10 = 4.5193;

% convert

lineData.R_10 = lineData.R_10/mi2km;

lineData.L_10 = lineData.X_10/mi2km/2/pi/60;

lineData.C_10 = lineData.B_10/mi2km*ms2F;

%% Configuration 11 - series reactance - ohm/mile [C]

lineData.R_11 = 1.3292;
    
lineData.X_11 = 1.3475;

% charging susceptance - microsiemens/mile

lineData.B_11 = 4.5193;

% convert

lineData.R_11 = lineData.R_11/mi2km;

lineData.L_11 = lineData.X_11/mi2km/2/pi/60;

lineData.C_11 = lineData.B_11/mi2km*ms2F;

%% Configuration 12 - series reactance - ohm/mile

lineData.R_12 = [1.5209 0.5198 0.4924
        0.5198 1.5329 0.5198
        0.4924 0.5198 1.5209];
    
lineData.X_12 = [0.7521 0.2775 0.2157
        0.2775 0.7162 0.2775
        0.2157 0.2775 0.7521];

% charging susceptance - microsiemens/mile

lineData.B_12 = [67.2242 -1e-6   -1e-6
        -1e-6    67.2242 -1e-6
        -1e-6    -1e-6   67.2242];

% convert

lineData.R_12 = lineData.R_12/mi2km;

lineData.L_12 = lineData.X_12/mi2km/2/pi/60;

lineData.C_12 = lineData.B_12/mi2km*ms2F;


%% Loads

data.loads = readtable('spot loads data.xls','Sheet','Sheet1','Range','A4:H89'); % read load data in to a table

data.loads.Properties.VariableNames = {'Bus_No','Load_Type','PA','QA','PB','QB','PC','QC'}; % rename variables
 
idx1 = ismember(data.loads.Load_Type,{'Y-PR'});

data.loads.Load_Type(idx1) = {'Y-PQ'};

% add capacitance to loads

idx88 = data.loads.Bus_No == 88;
data.loads.QA(idx88) = data.loads.QA(idx88) - 50;

idx90 = data.loads.Bus_No == 90;
data.loads.QB(idx90) = data.loads.QB(idx90) - 50;

idx92 = data.loads.Bus_No == 92;
data.loads.QC(idx92) = data.loads.QC(idx92) - 50;

t = (0:0.25:8760)';

nt = numel(t);

for l = 1:numel(data.loads.Bus_No) % assign load values to a data structure
   
    nb = data.loads.Bus_No(l);
    
    nodeNo = num2str(nb);
    
    eval(['L',nodeNo,'_PA = data.loads.PA(l)*1e3*ones(nt,1);'])
    eval(['L',nodeNo,'_QA = data.loads.QA(l)*1e3*ones(nt,1);'])
    eval(['L',nodeNo,'_PB = data.loads.PB(l)*1e3*ones(nt,1);'])
    eval(['L',nodeNo,'_QB = data.loads.QB(l)*1e3*ones(nt,1);'])
    eval(['L',nodeNo,'_PC = data.loads.PC(l)*1e3*ones(nt,1);'])
    eval(['L',nodeNo,'_QC = data.loads.QC(l)*1e3*ones(nt,1);'])
    
end


%% load line data

data.lines = readtable('line data.xls','Sheet','Sheet1','Range','A3:D121'); % read line data into table

data.lines.Properties.VariableNames = {'From','To','Length_ft','Config_No'}; % rename variables

%% relate configuration to phase sequence

config_phases = [1  3  1 1 1
                 2  3  1 1 1
                 3  3  1 1 1
                 4  3  1 1 1
                 5  3  1 1 1
                 6  3  1 1 1
                 7  2  1 0 1
                 8  2  1 1 0
                 9  1  1 0 0
                 10 1  0 1 0
                 11 1  0 0 1
                 12 3  1 1 1];

data.config_phases = table(config_phases(:,1),config_phases(:,2),config_phases(:,3),config_phases(:,4),config_phases(:,5),'VariableNames',{'Config_No','No_Phases','A','B','C'});             
           
clear config_phases

%% Add the Phase Connectivity to the Line Data

for l = 1:numel(data.lines.Config_No)
    
    idxCN = ismember(data.config_phases.Config_No,data.lines.Config_No(l)); % index into the configuration
    
    lA(l,1) = data.config_phases.A(idxCN); %#ok<*SAGROW>
    
    lB(l,1) = data.config_phases.B(idxCN);
    
    lC(l,1) = data.config_phases.C(idxCN);
    
end

line_phases = table(lA,lB,lC,'VariableNames',{'A','B','C'});

data.lines = [data.lines line_phases];

clear line_phases lA lB lC

%% Determine what phases are connected to each bus and also add XY coordinates

IEEE_123_XY_data % XY coordinate data

data.buses = table(node_XY_data(:,1),node_XY_data(:,2),node_XY_data(:,3),'VariableNames',{'Bus_No','X_Coord','Y_Coord'});

bus_lines = unique([data.lines.From;data.lines.To]); % buses connected to lines

phConn = zeros(numel(data.buses.Bus_No),3);

for lb = 1:numel(bus_lines)
    
   idxA = ismember(data.buses.Bus_No,bus_lines(lb));
    
   idxB = ismember(data.lines.From,bus_lines(lb)) | ismember(data.lines.To,bus_lines(lb)); % index into the lines that the bus is connected to
    
   phConna = data.lines(idxB,{'A','B','C'});
   
   phConn(idxA,:) = sum([phConna.A phConna.B phConna.C],1) > 0; % phases that are connected to the bus
   

end

additional_bus_info = table(sum(phConn,2),phConn(:,1),phConn(:,2),phConn(:,3),'VariableNames',{'No_Phases','A','B','C'});

data.buses = [data.buses additional_bus_info];

clear additional_bus_info

%% Breakers

data.breakers = readtable('switch data.xls','Sheet','Sheet1','Range','A3:C14'); % read breaker data in to a table

data.breakers = data.breakers([1:8 10:11],:); % remove breaker between 54 and 94 as I haven't implemented single-phase breakers yet

data.breakers.Properties.VariableNames = {'From','To','Status'}; % rename variables

% add phase information to buses connected through breakers 

bFT = [data.breakers.From data.breakers.To];
    
idxbFT = ~ismember(bFT,unique([data.lines.From(:,1);data.lines.To(:,1)]));

busAB = [bFT(idxbFT) bFT(fliplr(idxbFT))];

for lb = 1:numel(busAB(:,1)) % loop through the 'breaker only' buses and assign the phase connectivity associated with the 'breaker + line' bus
    
    idxA = ismember(data.buses.Bus_No,busAB(lb,1));
    idxB = ismember(data.buses.Bus_No,busAB(lb,2));
    
    data.buses(idxA,{'A','B','C'}) = data.buses(idxB,{'A','B','C'});
    
    data.buses.No_Phases(idxA) = sum(data.buses{idxB,{'A','B','C'}});
    
end

% look for buses that do not appear to be connected and remove

idxE = ~ismember(data.buses(:,{'A','B','C'}),table(0,0,0,'VariableNames',{'A','B','C'}));

if sum(idxE) ~= numel(idxE)
   
   bus_removed = data.buses(~idxE,:); %#ok<*NASGU>
   % 
   % warndlg(['bus ',num2str(bus_removed.Bus_No),' was removed as it did not appear to be connected.'])
   % 
end

data.buses = data.buses(idxE,:);

clear idxA idxB idxE busAB idxbFT bFT

%% OLTC

[from_to,loc] = identifyOLTC;

data.OLTC = table(from_to(:,1),from_to(:,2),loc,'VariableNames',{'From','To','Controlled_Bus'});

clear from_to loc phConn phConna nodeNo node_XY_data lb l idxCN bus_removed bus_lines

%% Capacitors

data.capacitors = readtable('cap data.xls','Sheet','Sheet1','Range','A4:D8'); % read breaker data in to a table

data.capacitors.Properties.VariableNames = {'Bus_No','A','B','C'}; % rename variables

%% source bus

data.source_bus = 150;

%% regulator data

regulator_data


