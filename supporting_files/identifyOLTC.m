function [from_to,loc] = identifyOLTC
%
% This function identifies which lines have OLTC transformers
%
% Copyright 2018 The MathWorks, Inc.
%



[~,~,raw] = xlsread('Regulator Data.xls','Sheet1');

% find line segments that the OLTC will be placed in

idxls = strcmp(raw(:,1),{'Line Segment: '});
idxlo = strcmp(raw(:,1),{'Location:'});
idxID = strcmp(raw(:,1),{'Regulator ID: '});

ls = raw(idxls,3);
lo = raw(idxlo,3); %#ok<*NASGU>
ID = raw(idxID,3);

loc = [lo{:}]';

nls = numel(ls);

from_to = zeros(nls,2);

for l = 1:nls
    
    [nn,~] = strsplit(ls{l},'-');
    
    from_to(l,:) = sort([str2double(nn{1}) str2double(nn{2})]);
    
    
end