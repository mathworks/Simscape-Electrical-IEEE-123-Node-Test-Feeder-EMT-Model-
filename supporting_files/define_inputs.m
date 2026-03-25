function tagPQ = define_inputs(mdl)

%
% This function creates the goto tags within the 'inputs' subsystem
%
% Copyright 2018 The MathWorks, Inc.
%

%%

hpq1 = find_system(mdl,'FindAll','on','LookUnderMasks','on','Name','PQ1');
hpq2 = find_system(mdl,'FindAll','on','LookUnderMasks','on','Name','PQ2');
hpq3 = find_system(mdl,'FindAll','on','LookUnderMasks','on','Name','PQ3');

hpq = [hpq1;hpq2;hpq3];

hom = find_system(mdl,'FindAll','on','LookUnderMasks','All','Name','input_demux');

set(hom,'Outputs',['[',num2str(2*ones(1,numel(hpq))),']']);

homp = get(hom,'PortHandles');

tagPQ = cell(numel(hpq),1);

for lt = 1:numel(hpq)
    
    tagPQ{lt} = get(hpq(lt),'GotoTag');
    
end

for l = 1:numel(hpq)
    
    nn = get(hpq(l),'GotoTag');
    
    hf = add_block('simulink/Signal Routing/Goto',[mdl,'/inputs/to_',nn]);
    
    set(hf,'TagVisibility','global');
    
    hfp = get(hf,'PortHandles');
    
    set(hf,'GotoTag',nn);
    
    pos = get(hf,'Position');
    
    set(hf,'Position',[pos(1)+800 pos(2)+(l-1)*50 pos(3)+1000 pos(4)+(l-1)*50])
    
    hl = add_line([mdl,'/inputs'],homp.Outport(l),hfp.Inport);
    
    set(hl,'SignalNameFromLabel',get(hpq(l),'GotoTag'))
    
end

