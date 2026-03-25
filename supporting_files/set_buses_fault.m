function set_buses_fault(h)
%
% This function names the bus goto tags
%
% Copyright 2024 The MathWorks, Inc.
%

no = get(h,'Name');

hV3 = find_system(h,'LookUnderMasks','All','RegExp','on','Name','Vbus_3ph');
set(hV3,'GotoTag',['Vb3_',no]);

hCB3 = find_system(h,'LookUnderMasks','All','RegExp','on','Name','CB3From');
set(hCB3,'GotoTag',['CB3_',no]);

hV2 = find_system(h,'LookUnderMasks','All','RegExp','on','Name','Vbus_2ph');
set(hV2,'GotoTag',['Vb2_',no]);

hCB2 = find_system(h,'LookUnderMasks','All','RegExp','on','Name','CB2From');
set(hCB2,'GotoTag',['CB2_',no]);

hV1 = find_system(h,'LookUnderMasks','All','RegExp','on','Name','Vbus_1ph');
set(hV1,'GotoTag',['Vb1_',no]);

hCB1 = find_system(h,'LookUnderMasks','All','RegExp','on','Name','CB1From');
set(hCB1,'GotoTag',['CB1_',no]);



