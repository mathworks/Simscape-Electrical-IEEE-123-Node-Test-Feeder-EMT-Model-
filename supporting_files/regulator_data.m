%
% This script reads in the regulator data
%
% Copyright 2018 The MathWorks, Inc.
%


T = readtable('Regulator Data.xls','Format','Auto');
T.Properties.VariableNames ={'Param','X','Var1','Var2','Var3'};


idx = find(ismember(T.Param,'Regulator ID:'));


for l = 1:numel(idx)
    
    if l < numel(idx)
        
        T1 = T(idx(l):idx(l+1)-2,{'Param','Var1','Var2','Var3'});
        
    else
        
        T1 = T(idx(l):end,{'Param','Var1','Var2','Var3'});
        
    end
    
    
    [c1,c2] = strsplit(T1.Var1{2},'-');
    
    f_t = sort([str2double(c1{1}) str2double(c1{2})]);
    
    nft1 = num2str(f_t(1));
    nft2 = num2str(f_t(2));
    
    oft = ['OLTC_',nft1,'_',nft2];
    
    noPh = sum(~cellfun(@isempty,T1{10,{'Var1','Var2','Var3'}}));
    
    data.reg.(oft).A.VNom = 4.16e3;
    data.reg.(oft).A.VTBase = 120;
    data.reg.(oft).A.VoltHold = str2double(T1.Var1{13});
    data.reg.(oft).A.R = str2double(T1.Var1{11});
    data.reg.(oft).A.X = str2double(T1.Var1{12});
    data.reg.(oft).A.CT = str2double(T1.Var1{9});
    
    if noPh >= 2
        
        data.reg.(oft).B.VNom = 4.16e3;
        data.reg.(oft).B.VTBase = 120;
        data.reg.(oft).B.VoltHold = str2double(T1.Var2{13});
        data.reg.(oft).B.R = str2double(T1.Var2{11});
        data.reg.(oft).B.X = str2double(T1.Var2{12});
        data.reg.(oft).B.CT = str2double(T1.Var1{9});
        
    end
    
    if noPh >= 3
        
        data.reg.(oft).C.VNom = 4.16e3;
        data.reg.(oft).C.VTBase = 120;
        data.reg.(oft).C.VoltHold = str2double(T1.Var3{13});
        data.reg.(oft).C.R = str2double(T1.Var3{11});
        data.reg.(oft).C.X = str2double(T1.Var3{12});
        data.reg.(oft).C.CT = str2double(T1.Var1{9});
        
    end
    
    
    
end