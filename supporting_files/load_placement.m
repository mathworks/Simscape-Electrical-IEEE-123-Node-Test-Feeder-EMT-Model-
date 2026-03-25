function load_placement(mdl,data)
%
% This function places the loads and connects them to the correct phases
%
% Copyright 2018 The MathWorks, Inc.
%


pp = [(data.loads.PA > 0 | data.loads.QA > 0) (data.loads.PB > 0 | data.loads.QB > 0) (data.loads.PC > 0 | data.loads.QC > 0)];

typel = data.loads.Load_Type;

% place the loads

model = [mdl,'/'];

xnp = 0;

for ll = 1:numel(data.loads.Bus_No)
   
    % compare phase connections
    
    idx = ismember(data.buses.Bus_No,data.loads.Bus_No(ll)); %#ok<*NODEF>
    
    qq1 = data.buses{idx,{'A','B','C'}};
    qq2 = pp(ll,:);
    
    pc_idx = find(qq2(logical(qq1)));
    
    
    h1a = find_system([model,num2str(data.loads.Bus_No(ll))]);
    h1b = get_param(h1a,'Handle');
    h1 = h1b{1};
    
    ph1 = get(h1,'Position');
        
    if strcmp(typel(ll),'Y-I')
        
        h = add_block(['YconstI/',num2str(sum(qq2))],[model,'L',num2str(data.loads.Bus_No(ll))]);
        
    elseif strcmp(typel(ll),'Y-Z')
        
        h = add_block(['YconstZ/',num2str(sum(qq2))],[model,'L',num2str(data.loads.Bus_No(ll))]);
        
    elseif strcmp(typel(ll),'Y-PQ') || strcmp(typel(ll),'Y-PR') % The benchmark data has a typo for load 4 'Y-PR'
        
        h = add_block(['YconstPQ/',num2str(sum(qq2))],[model,'L',num2str(data.loads.Bus_No(ll))]);
        
    elseif strcmp(typel(ll),'D-Z')
        
        h = add_block(['DconstZ/',num2str(sum(qq2))],[model,'L',num2str(data.loads.Bus_No(ll))]);
        
        if numel(pc_idx)<3 
            
            if pc_idx(end)<3
                
                pc_idx = [pc_idx pc_idx+1]; %#ok<*AGROW>
                
            else
                
                pc_idx = [pc_idx-1 pc_idx];
                
            end
             
        end
        
    elseif strcmp(typel(ll),'D-PQ')
        
        h = add_block(['DconstPQ/',num2str(sum(qq2))],[model,'L',num2str(data.loads.Bus_No(ll))]);
        
        if numel(pc_idx)<3 
            
            if pc_idx(end)<3
                
                pc_idx = [pc_idx pc_idx+1];
                
            else
                
                pc_idx = [pc_idx-1 pc_idx];
                
            end
             
        end
        
    elseif strcmp(typel(ll),'D-I')
        
        h = add_block(['DconstI/',num2str(sum(qq2))],[model,'L',num2str(data.loads.Bus_No(ll))]);
        
        if numel(pc_idx)<3 
            
            if pc_idx(end)<3
                
                pc_idx = [pc_idx pc_idx+1];
                
            else
                
                pc_idx = [pc_idx-1 pc_idx];
                
            end
             
        end
        
    else
        
        xnp = xnp + 1;
        
        lnp(xnp) = ll; %#ok<*NASGU>
        
    end
    
    % set data
    
    
    ppp = find(qq2);
    
    nppp = numel(ppp);
    
    numload = data.loads.Bus_No(ll);
         
    hpq1 = find_system(h,'FindAll','on','Name','PQ1');
    hpq2 = find_system(h,'FindAll','on','Name','PQ2');
    hpq3 = find_system(h,'FindAll','on','Name','PQ3');
    
    try 
        
          if nppp == 3
        
            set(h,'PA1',['L',num2str(numload),'_PA']);
            set(h,'QA1',['L',num2str(numload),'_QA']);
            set(h,'PB1',['L',num2str(numload),'_PB']);
            set(h,'QB1',['L',num2str(numload),'_QB']);
            set(h,'PC1',['L',num2str(numload),'_PC']);
            set(h,'QC1',['L',num2str(numload),'_QC']);
        
    elseif nppp == 2
        
        
        if sum(ppp == [1 2]) == 2
            
            set(h,'PA1',['L',num2str(numload),'_PA']);
            set(h,'QA1',['L',num2str(numload),'_QA']);
            set(h,'PB1',['L',num2str(numload),'_PB']);
            set(h,'QB1',['L',num2str(numload),'_QB']);
            
        elseif sum(ppp == [1 3]) == 2
            
            
            set(h,'PA1',['L',num2str(numload),'_PA']);
            set(h,'QA1',['L',num2str(numload),'_QA']);
            set(h,'PB1',['L',num2str(numload),'_PC']);
            set(h,'QB1',['L',num2str(numload),'_QC']);
            
        elseif sum(ppp == [2 3]) == 2
            
            
            set(h,'PA1',['L',num2str(numload),'_PB']);
            set(h,'QA1',['L',num2str(numload),'_QB']);
            set(h,'PB1',['L',num2str(numload),'_PC']);
            set(h,'QB1',['L',num2str(numload),'_QC']);
            
        end
        
    elseif nppp == 1
        
        
        if ppp == 1
            
            set(h,'PA1',['L',num2str(numload),'_PA']);
            set(h,'QA1',['L',num2str(numload),'_QA']);
            
        elseif ppp == 2
            
            set(h,'PA1',['L',num2str(numload),'_PB']);
            set(h,'QA1',['L',num2str(numload),'_QB']);
            
        elseif ppp == 3
            
            set(h,'PA1',['L',num2str(numload),'_PC']);
            set(h,'QA1',['L',num2str(numload),'_QC']);
            
        end
        
    end
  
        
    catch
    
    
    if nppp == 3
        
        set(hpq1,'GotoTag',['L',num2str(numload),'_PQA']);
        set(hpq2,'GotoTag',['L',num2str(numload),'_PQB']);
        set(hpq3,'GotoTag',['L',num2str(numload),'_PQC']);
        
    elseif nppp == 2
        
        
        if sum(ppp == [1 2]) == 2
            
            set(hpq1,'GotoTag',['L',num2str(numload),'_PQA']);
            set(hpq2,'GotoTag',['L',num2str(numload),'_PQB']);
            
        elseif sum(ppp == [1 3]) == 2
            
            
            set(hpq1,'GotoTag',['L',num2str(numload),'_PQA']);
            set(hpq2,'GotoTag',['L',num2str(numload),'_PQC']);
            
        elseif sum(ppp == [2 3]) == 2
            
            
            set(hpq1,'GotoTag',['L',num2str(numload),'_PQB']);
            set(hpq2,'GotoTag',['L',num2str(numload),'_PQC']);
            
        end
        
    elseif nppp == 1
        
        
        if ppp == 1
            
            set(hpq1,'GotoTag',['L',num2str(numload),'_PQA']);
            
        elseif ppp == 2
            
            set(hpq1,'GotoTag',['L',num2str(numload),'_PQB']);
            
        elseif ppp == 3
            
            set(hpq1,'GotoTag',['L',num2str(numload),'_PQC']);
            
        end
        
    end
    
    end
    posa = get(h,'Position');
    
    pos = posa - [posa(1) posa(2) posa(1) posa(2)];
    
    set(h,'Position',[ph1(1) ph1(2) ph1(1) ph1(2)] + pos + [50 50 50 50])
        
     % add the lines
      
     hp = get(h,'Porthandles');
     hp1 = get(h1,'Porthandles');
     
     lhp = numel(hp.LConn);
     lhp1 = numel(hp1.LConn);
     
      
    for l = 1:numel(hp.LConn)
        
        % determine which bus the line is closer to, and connect on that
        % basis
        
        if l == 1
           
            Lpp = get(hp.LConn(end),'Position');
            
            Lpp1 = get(hp1.LConn(end),'Position');
            Rpp1 = get(hp1.LConn(end),'Position');
            
            LL1 = sqrt((Lpp(1) - Lpp1(1))^2 + (Lpp(2) - Lpp1(2))^2);
            LR1 = sqrt((Lpp(1) - Rpp1(1))^2 + (Lpp(2) - Rpp1(2))^2);
            
        end
        
            add_line(mdl,hp.LConn(l),hp1.LConn(pc_idx(l)))
             
    end
    
    pause(0.01)
        
    
end

