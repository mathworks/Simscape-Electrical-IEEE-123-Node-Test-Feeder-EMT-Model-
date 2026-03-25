function setRegulatorData(mdl)
%
% This function parameterizes the OLTC transformers
%
% Copyright 2018 The MathWorks, Inc.
%

h = find_system(mdl,'FindAll','on','LookUnderMasks','All','Name','OLTC');

for l = 1:numel(h)
    
    np = get(h(l),'Parent');
    qq = strsplit(np,'/');
    
    set(h(l),'regdata',['data.reg.OLTC_',qq{2}])
    
end


