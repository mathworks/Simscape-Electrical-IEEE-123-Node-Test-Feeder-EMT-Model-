function set_buses(h)
%
% This function names the bus goto tags
%
% Copyright 2018 The MathWorks, Inc.
%


hV = find_system(h,'LookUnderMasks','All','RegExp','on','Name','Vabc');
%hG = find_system(h,'LookUnderMasks','All','RegExp','on','Name','Gain');

no = get(h,'Name');

set(hV,'GotoTag',['Vabc_',strtok(no,'Bus_')]);

% hp = get(hG,'PortHandles');
% set(hp.Outport,'DataLogging','on');
% set(hp.Outport,'Name',['Vabc_',no]);
% 
% hgen = find_system(h,'LookUnderMasks','All','RegExp','on','Name','gen01');
% 
% if ~isempty(hgen)
% 
%     set(hgen,'Name',['gen',no]);
% 
%     hpsV = find_system(hgen,'LookUnderMasks','All','RegExp','on','Name','psV');
%     hpsQ = find_system(hgen,'LookUnderMasks','All','RegExp','on','Name','psQ');
%     hpsF = find_system(hgen,'LookUnderMasks','All','RegExp','on','Name','psF');
%     hpsP = find_system(hgen,'LookUnderMasks','All','RegExp','on','Name','psP');
% 
%     hpV = get(hpsV,'PortHandles');
%     set(hpV.Outport,'DataLogging','on');
%     set(hpV.Outport,'Name',['Vgen_',no]);
% 
%     hpQ = get(hpsQ,'PortHandles');
%     set(hpQ.Outport,'DataLogging','on');
%     set(hpQ.Outport,'Name',['Qgen_',no]);
% 
%     hpF = get(hpsF,'PortHandles');
%     set(hpF.Outport,'DataLogging','on');
%     set(hpF.Outport,'Name',['Fgen_',no]);
% 
%     hpP = get(hpsP,'PortHandles');
%     set(hpP.Outport,'DataLogging','on');
%     set(hpP.Outport,'Name',['Pgen_',no]);
% 
% end
% 

