function define_outputs_faults(mdl)

%
% This function places from tags in the 'current_outputs' and
% 'voltage_outputs' subsystems
%
% Copyright 2026 The MathWorks, Inc.
%


%%

%%

hv = find_system(mdl,'FindAll','on','LookUnderMasks','All','Name','Vbus_1ph');

hvom = find_system(mdl,'FindAll','on','LookUnderMasks','All','Name','vb1_output_bus');

set(hvom,'Inputs',num2str(numel(hv)));

hvomp = get(hvom,'PortHandles');

for l = 1:numel(hv)
    
    nn = get(hv(l),'GotoTag');
    
    hf = add_block('simulink/Signal Routing/From',[mdl,'/measurements/bus_voltage_1ph_outputs/from_',nn]);
    
    hfp = get(hf,'PortHandles');
    
    set(hf,'GotoTag',nn);
    
    pos = get(hf,'Position');
    
    set(hf,'Position',[pos(1) pos(2)+(l-1)*20 pos(3) pos(4)+(l-1)*20])
    
    hl = add_line([mdl,'/measurements/bus_voltage_1ph_outputs'],hfp.Outport,hvomp.Inport(l));
    
    set(hl,'SignalNameFromLabel',get(hv(l),'GotoTag'))
    
end

%%

hv = find_system(mdl,'FindAll','on','LookUnderMasks','All','Name','Vbus_2ph');

hvom = find_system(mdl,'FindAll','on','LookUnderMasks','All','Name','vb2_output_bus');

set(hvom,'Inputs',num2str(numel(hv)));

hvomp = get(hvom,'PortHandles');

for l = 1:numel(hv)
    
    nn = get(hv(l),'GotoTag');
    
    hf = add_block('simulink/Signal Routing/From',[mdl,'/measurements/bus_voltage_2ph_outputs/from_',nn]);
    
    hfp = get(hf,'PortHandles');
    
    set(hf,'GotoTag',nn);
    
    pos = get(hf,'Position');
    
    set(hf,'Position',[pos(1) pos(2)+(l-1)*20 pos(3) pos(4)+(l-1)*20])
    
    hl = add_line([mdl,'/measurements/bus_voltage_2ph_outputs'],hfp.Outport,hvomp.Inport(l));
    
    set(hl,'SignalNameFromLabel',get(hv(l),'GotoTag'))
    
end

%%

hv = find_system(mdl,'FindAll','on','LookUnderMasks','All','Name','Vbus_3ph');

hvom = find_system(mdl,'FindAll','on','LookUnderMasks','All','Name','vb3_output_bus');

set(hvom,'Inputs',num2str(numel(hv)));

hvomp = get(hvom,'PortHandles');

for l = 1:numel(hv)
    
    nn = get(hv(l),'GotoTag');
    
    hf = add_block('simulink/Signal Routing/From',[mdl,'/measurements/bus_voltage_3ph_outputs/from_',nn]);
    
    hfp = get(hf,'PortHandles');
    
    set(hf,'GotoTag',nn);
    
    pos = get(hf,'Position');
    
    set(hf,'Position',[pos(1) pos(2)+(l-1)*20 pos(3) pos(4)+(l-1)*20])
    
    hl = add_line([mdl,'/measurements/bus_voltage_3ph_outputs'],hfp.Outport,hvomp.Inport(l));
    
    set(hl,'SignalNameFromLabel',get(hv(l),'GotoTag'))
    
end
%%

hv = find_system(mdl,'FindAll','on','LookUnderMasks','All','Name','Iline_1ph');

hvom = find_system(mdl,'FindAll','on','LookUnderMasks','All','Name','il1_output_bus');

set(hvom,'Inputs',num2str(numel(hv)));

hvomp = get(hvom,'PortHandles');

for l = 1:numel(hv)
    
    nn = get(hv(l),'GotoTag');
    
    hf = add_block('simulink/Signal Routing/From',[mdl,'/measurements/line_current_1ph_outputs/from_',nn]);
    
    hfp = get(hf,'PortHandles');
    
    set(hf,'GotoTag',nn);
    
    pos = get(hf,'Position');
    
    set(hf,'Position',[pos(1) pos(2)+(l-1)*20 pos(3) pos(4)+(l-1)*20])
    
    hl = add_line([mdl,'/measurements/line_current_1ph_outputs'],hfp.Outport,hvomp.Inport(l));
    
    set(hl,'SignalNameFromLabel',get(hv(l),'GotoTag'))
    
end
%%

hv = find_system(mdl,'FindAll','on','LookUnderMasks','All','Name','Iline_2ph');

hvom = find_system(mdl,'FindAll','on','LookUnderMasks','All','Name','il2_output_bus');

set(hvom,'Inputs',num2str(numel(hv)));

hvomp = get(hvom,'PortHandles');

for l = 1:numel(hv)
    
    nn = get(hv(l),'GotoTag');
    
    hf = add_block('simulink/Signal Routing/From',[mdl,'/measurements/line_current_2ph_outputs/from_',nn]);
    
    hfp = get(hf,'PortHandles');
    
    set(hf,'GotoTag',nn);
    
    pos = get(hf,'Position');
    
    set(hf,'Position',[pos(1) pos(2)+(l-1)*20 pos(3) pos(4)+(l-1)*20])
    
    hl = add_line([mdl,'/measurements/line_current_2ph_outputs'],hfp.Outport,hvomp.Inport(l));
    
    set(hl,'SignalNameFromLabel',get(hv(l),'GotoTag'))
    
end
%%

hv = find_system(mdl,'FindAll','on','LookUnderMasks','All','Name','Iline_3ph');

hvom = find_system(mdl,'FindAll','on','LookUnderMasks','All','Name','il3_output_bus');

set(hvom,'Inputs',num2str(numel(hv)));

hvomp = get(hvom,'PortHandles');

for l = 1:numel(hv)
    
    nn = get(hv(l),'GotoTag');
    
    hf = add_block('simulink/Signal Routing/From',[mdl,'/measurements/line_current_3ph_outputs/from_',nn]);
    
    hfp = get(hf,'PortHandles');
    
    set(hf,'GotoTag',nn);
    
    pos = get(hf,'Position');
    
    set(hf,'Position',[pos(1) pos(2)+(l-1)*20 pos(3) pos(4)+(l-1)*20])
    
    hl = add_line([mdl,'/measurements/line_current_3ph_outputs'],hfp.Outport,hvomp.Inport(l));
    
    set(hl,'SignalNameFromLabel',get(hv(l),'GotoTag'))
    
end
%%

hv = find_system(mdl,'FindAll','on','LookUnderMasks','All','Name','Ibus_3ph');

hvom = find_system(mdl,'FindAll','on','LookUnderMasks','All','Name','ib3_output_bus');

set(hvom,'Inputs',num2str(numel(hv)));

hvomp = get(hvom,'PortHandles');

for l = 1:numel(hv)
    
    nn = get(hv(l),'GotoTag');
    
    hf = add_block('simulink/Signal Routing/From',[mdl,'/measurements/bus_current_3ph_outputs/from_',nn]);
    
    hfp = get(hf,'PortHandles');
    
    set(hf,'GotoTag',nn);
    
    pos = get(hf,'Position');
    
    set(hf,'Position',[pos(1) pos(2)+(l-1)*20 pos(3) pos(4)+(l-1)*20])
    
    hl = add_line([mdl,'/measurements/bus_current_3ph_outputs'],hfp.Outport,hvomp.Inport(l));
    
    set(hl,'SignalNameFromLabel',get(hv(l),'GotoTag'))
    
end