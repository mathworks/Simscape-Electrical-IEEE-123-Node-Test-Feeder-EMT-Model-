function set_OLTC_only(mdl,on_off)
%
% This function sets the status of the OLTC transformers
%
% Copyright 2018 The MathWorks, Inc.
%

h = find_system(mdl,'LookUnderMasks','All','FindAll','on','RegExp','on','Name','switchOLTC');

for l = 1:numel(h)
    
    set(h(l),'Value',on_off);
    
end
