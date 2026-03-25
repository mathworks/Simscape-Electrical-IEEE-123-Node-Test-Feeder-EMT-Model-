%
% This script creates the 'load_inputs' input data
%
% Copyright 2026 The MathWorks, Inc.
%

t = linspace(0,100,numel(t))';

hpq = find_system(mdl,'FindAll','on','LookUnderMasks','on','Name','input_demux');
tagPQ = get(hpq,'OutputSignalNames')';

load_inputs1 = [];

for lld = 1:numel(tagPQ)
    
    [qq,ww] = strtok(tagPQ(lld),'_');
   
    ll1 = qq{:};
    pp1 = ww{:}(end);
    
    lds = [eval([ll1,'_P',pp1]) eval([ll1,'_Q',pp1])];
    
    load_inputs1 = [load_inputs1 lds]; %#ok<*AGROW>
    
end

load_inputs = load_inputs1;

idxT1 = t < 0.05;
idxT2 = t >= 0.05 & t <0.1;


load_inputs(idxT1,:) = load_inputs(idxT1,:).*linspace(0.001,0.001,sum(idxT1))';
load_inputs(idxT2,:) = load_inputs(idxT2,:).*linspace(0.001,1,sum(idxT2))';
