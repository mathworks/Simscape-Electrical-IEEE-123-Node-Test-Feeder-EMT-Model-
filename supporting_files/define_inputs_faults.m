function [tag1,tag2,tag3] = define_inputs_faults(mdl)

%
% This function creates the goto tags within the 'inputs' subsystem
%
% Copyright 2024 The MathWorks, Inc.
%

%%

hpq = find_system(mdl,'FindAll','on','LookUnderMasks','on','Name','CB3From');

hom = find_system(mdl,'FindAll','on','LookUnderMasks','All','Name','cb3_input_demux');

set(hom,'Outputs',num2str(numel(hpq)));

homp = get(hom,'PortHandles');

tag3 = cell(numel(hpq),1);

for lt = 1:numel(hpq)
    
    tag3{lt} = get(hpq(lt),'GotoTag');
    
end

for l = 1:numel(hpq)
    
    nn = get(hpq(l),'GotoTag');
    
    hf = add_block('simulink/Signal Routing/Goto',[mdl,'/cb3_inputs/to_',nn]);
    
    set(hf,'TagVisibility','global');
    
    hfp = get(hf,'PortHandles');
    
    set(hf,'GotoTag',nn);
    
    pos = get(hf,'Position');
    
    set(hf,'Position',[pos(1)+800 pos(2)+(l-1)*50 pos(3)+1000 pos(4)+(l-1)*50])
    
    hl = add_line([mdl,'/cb3_inputs'],homp.Outport(l),hfp.Inport);
    
    set(hl,'SignalNameFromLabel',get(hpq(l),'GotoTag'))
    
end

%%

hpq = find_system(mdl,'FindAll','on','LookUnderMasks','on','Name','CB2From');

hom = find_system(mdl,'FindAll','on','LookUnderMasks','All','Name','cb2_input_demux');

set(hom,'Outputs',num2str(numel(hpq)));

homp = get(hom,'PortHandles');

tag2 = cell(numel(hpq),1);

for lt = 1:numel(hpq)
    
    tag2{lt} = get(hpq(lt),'GotoTag');
    
end

for l = 1:numel(hpq)
    
    nn = get(hpq(l),'GotoTag');
    
    hf = add_block('simulink/Signal Routing/Goto',[mdl,'/cb2_inputs/to_',nn]);
    
    set(hf,'TagVisibility','global');
    
    hfp = get(hf,'PortHandles');
    
    set(hf,'GotoTag',nn);
    
    pos = get(hf,'Position');
    
    set(hf,'Position',[pos(1)+800 pos(2)+(l-1)*50 pos(3)+1000 pos(4)+(l-1)*50])
    
    hl = add_line([mdl,'/cb2_inputs'],homp.Outport(l),hfp.Inport);
    
    set(hl,'SignalNameFromLabel',get(hpq(l),'GotoTag'))
    
end

%%

hpq = find_system(mdl,'FindAll','on','LookUnderMasks','on','Name','CB1From');

hom = find_system(mdl,'FindAll','on','LookUnderMasks','All','Name','cb1_input_demux');

set(hom,'Outputs',num2str(numel(hpq)));

homp = get(hom,'PortHandles');

tag1 = cell(numel(hpq),1);

for lt = 1:numel(hpq)
    
    tag1{lt} = get(hpq(lt),'GotoTag');
    
end

for l = 1:numel(hpq)
    
    nn = get(hpq(l),'GotoTag');
    
    hf = add_block('simulink/Signal Routing/Goto',[mdl,'/cb1_inputs/to_',nn]);
    
    set(hf,'TagVisibility','global');
    
    hfp = get(hf,'PortHandles');
    
    set(hf,'GotoTag',nn);
    
    pos = get(hf,'Position');
    
    set(hf,'Position',[pos(1)+800 pos(2)+(l-1)*50 pos(3)+1000 pos(4)+(l-1)*50])
    
    hl = add_line([mdl,'/cb1_inputs'],homp.Outport(l),hfp.Inport);
    
    set(hl,'SignalNameFromLabel',get(hpq(l),'GotoTag'))
    
end

