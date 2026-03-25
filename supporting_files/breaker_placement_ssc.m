function breaker_placement_ssc(mdl,data)
%
% This function places the breakers
%
% Copyright 2018 The MathWorks, Inc.
%


from_to = data.OLTC{:,{'From','To'}};

data.breakers.Initial_State(ismember(data.breakers.Status,{'closed'}),1) = 0;
data.breakers.Initial_State(ismember(data.breakers.Status,{'open'}),1) = 1;

%initialstate = [{'open'},{'closed'}];          
          
nld = numel(data.breakers.From);

model = [mdl,'/'];

for ll = 1:nld
   
    f_t = sort([data.breakers.From(ll) data.breakers.To(ll)]);
    
    % determine if from to matches an OLTC placement
    
    ii = from_to(:,1) == f_t(:,1) & from_to(:,2) == f_t(:,2);
    
    flagOLTC = 0;
    
    if sum(ii)>0 % set flag to pick up line segment with OLTC
        
        flagOLTC = 1;
        
    end
    
    h1a = find_system([model,'Bus_',num2str(data.breakers.From(ll))]);
    h1b = get_param(h1a,'Handle');
    h1 = h1b{1};
    
    h2a = find_system([model,'Bus_',num2str(data.breakers.To(ll))]);
    h2b = get_param(h2a,'Handle');
    h2 = h2b{1};
    
    ph1 = get(h1,'Position');
    ph2 = get(h2,'Position');
    
    ppx = abs(ph1(1)-ph2(1));
    ppy = abs(ph1(2)-ph2(2));
    
    mid_point = (max([ph1;ph2]) - min([ph1;ph2]))/2+min([ph1;ph2]);
    
    if flagOLTC
        
        h = add_block('breaker_snt/Tb1ssc',[model,num2str(f_t(1)),'_',num2str(f_t(2))]);
    
        hb = find_system(h,'LookUnderMasks','All','FindAll','on','Name','b2');
        
        hh = find_system(hb,'LookUnderMasks','All','Name','Constant');
                
        set(hh,'Value',num2str(data.breakers.Initial_State(ll)))
        
        
    else
        
        h = add_block('breaker_snt/b1ssc',[model,num2str(f_t(1)),'_',num2str(f_t(2))]);
    
        hh = find_system(h,'LookUnderMasks','All','Name','Constant');
        
        set(hh,'Value',num2str(data.breakers.Initial_State(ll)))
        
    
    end
    
    
    posa = get(h,'Position');
    
    pos = posa - [posa(1) posa(2) posa(1) posa(2)];
    
    mp = [mid_point(1) mid_point(2) mid_point(1) mid_point(2)]-[pos(3)/2 0 pos(3)/2 0]; 
    
    set(h,'Position',pos + mp)
    
    if ppx < ppy
        
        set(h,'Orientation','up') % flip the line
        
        % also flip the buses
        
         set(h1,'Orientation','up')
         set(h2,'Orientation','up')
        
    end
    
    
    % add the lines
    
    
    hp = get(h,'Porthandles');
    hp1 = get(h1,'Porthandles');
    hp2 = get(h2,'Porthandles');
    
    for l = 1:numel(hp.LConn)
        
        % determine which bus the line is closer to, and connect on that
        % basis
        
        if l == 1
           
            Lpp = get(hp.LConn(end),'Position');
            Rpp = get(hp.RConn(end),'Position');
            
            Lpp1 = get(hp1.LConn(end),'Position');
            Lpp2 = get(hp2.LConn(end),'Position');
            
            Rpp1 = get(hp1.LConn(end),'Position');
            Rpp2 = get(hp2.LConn(end),'Position');
            
            
            LL1 = sqrt((Lpp(1) - Lpp1(1))^2 + (Lpp(2) - Lpp1(2))^2);
            LL2 = sqrt((Lpp(1) - Lpp2(1))^2 + (Lpp(2) - Lpp2(2))^2);
            LR1 = sqrt((Lpp(1) - Rpp1(1))^2 + (Lpp(2) - Rpp1(2))^2);
            LR2 = sqrt((Lpp(1) - Rpp2(1))^2 + (Lpp(2) - Rpp2(2))^2);
            
            RL1 = sqrt((Rpp(1) - Lpp1(1))^2 + (Rpp(2) - Lpp1(2))^2);
            RL2 = sqrt((Rpp(1) - Lpp2(1))^2 + (Rpp(2) - Lpp2(2))^2);
            RR1 = sqrt((Rpp(1) - Rpp1(1))^2 + (Rpp(2) - Rpp1(2))^2);
            RR2 = sqrt((Rpp(1) - Rpp2(1))^2 + (Rpp(2) - Rpp2(2))^2);
            
        end
        
        if LL1 <= min([LL2 LR1 LR2])
            
            add_line(mdl,hp.LConn(l),hp1.LConn(l))
            
            % now figure out the right side connectivity
            
            if RL2 <= RR2
            
                add_line(mdl,hp.RConn(l),hp2.LConn(l))
            
            else
            
                add_line(mdl,hp.RConn(l),hp2.LConn(l))
            
            end
            
        elseif LL2 <= min([LL1 LR1 LR2])
            
            add_line(mdl,hp.LConn(l),hp2.LConn(l))
            
            % now figure out the right side connectivity
            
            if RL1 <= RR1
            
                add_line(mdl,hp.RConn(l),hp1.LConn(l))
            
            else
            
                add_line(mdl,hp.RConn(l),hp1.LConn(l))
            
            end
            
        elseif LR1 <= min([LL1 LL2 LR2])
            
            add_line(mdl,hp.LConn(l),hp1.LConn(l))
            
            % now figure out the right side connectivity
            
            if RL2 <= RR2
            
                add_line(mdl,hp.RConn(l),hp2.LConn(l))
            
            else
            
                add_line(mdl,hp.RConn(l),hp2.LConn(l))
            
            end
            
        elseif LR2 <= min([LL1 LL2 LR1])
            
            add_line(mdl,hp.LConn(l),hp2.LConn(l))
            
            % now figure out the right side connectivity
            
            if RL1 <= RR1
            
                add_line(mdl,hp.RConn(l),hp1.LConn(l))
            
            else
            
                add_line(mdl,hp.RConn(l),hp1.LConn(l))
            
            end
            
        end

    end
    
    pause(0.01) % the pause statement is here simply to see the model build visually
        
    
end

