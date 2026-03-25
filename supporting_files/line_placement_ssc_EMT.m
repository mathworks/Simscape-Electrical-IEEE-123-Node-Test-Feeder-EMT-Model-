function line_placement_ssc_EMT(model,data)
%
% This function places the lines and connects them to the buses
%
% Copyright 2018 The MathWorks, Inc.
%


from_to = data.OLTC{:,{'From','To'}};

loc = data.OLTC{:,{'Controlled_Bus'}};

% place the lines

nld = numel(data.lines.From);

for ll = 1:nld
    
    % phase connectivity
    
    pca = data.lines(ll,{'A','B','C'}); 
    
    pc = pca{1,:};
    
    % determine if from to matches an OLTC placement
    
    f_t = sort([data.lines.From(ll) data.lines.To(ll)]);
    
    ii = sum(ismember(from_to,[data.lines.From(ll) data.lines.To(ll)]),2) == 2;

    flagOLTC = 0;
    flagFlip = 1;
    
    if sum(ii)>0 % set flag to pick up line segment with OLTC
        
        flagOLTC = 1;
        
        if find(from_to(ii,:)==loc(ii))==2
            
            flagFlip = 0;
            
        end
        
    end
    
    nf = num2str(f_t(1));
    nt = num2str(f_t(2));
    
    h1a = find_system([model,'/Bus_',nf]);
    h1b = get_param(h1a,'Handle');
    h1 = h1b{1};
    
    h2a = find_system([model,'/Bus_',nt]);
    h2b = get_param(h2a,'Handle');
    h2 = h2b{1};
    
    ph1 = get(h1,'Position');
    ph2 = get(h2,'Position');
    
    ppx = abs(ph1(1)-ph2(1));
    ppy = abs(ph1(2)-ph2(2));
    
    mid_point = (max([ph1;ph2]) - min([ph1;ph2]))/2+min([ph1;ph2]);
    
    if flagOLTC
    
        h = add_block(['line_choices_snt/T',num2str(sum(pc)),'sscT'],[model,'/',nf,'_',nt]);
    
    else
        
        h = add_block(['line_choices_snt/',num2str(sum(pc)),'sscT'],[model,'/',nf,'_',nt]);
        
    end
        
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   set line properties

 set(h,'config',num2str(data.lines.Config_No(ll)));
 set(h,'length',num2str(data.lines.Length_ft(ll)));
 
 set(h,'from_bus',num2str(data.lines.From(ll)));
 set(h,'to_bus',num2str(data.lines.To(ll)));

 
 hD = find_system(h,'FindAll','on','LookUnderMasks','all','RegExp','on','Name','Pi-Section Line');
 
 nc = num2str(data.lines.Config_No(ll));
 nl = num2str(num2str(data.lines.Length_ft(ll)));
 
 set(hD,'Resistance',['lineData.R_',nc]);
 set(hD,'Inductance',['lineData.L_',nc]);
 set(hD,'Capacitance',['lineData.C_',nc]);
 set(hD,'Length',[nl,'*ft2km']);
 
 hI = find_system(h,'LookUnderMasks','all','RegExp','on','Name','Iabc');
% hPS = find_system(h,'LookUnderMasks','all','RegExp','on','Name','Mux');

 no = get(h,'Name');
 
 %set(hI,'GotoTag',['Iabc_',no]);
 
% hp = get(hPS,'PortHandles');
% set(hp.Outport,'DataLogging','off');
set(hI,'GotoTag',['Iabc_',no]);

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
 
    posa = get(h,'Position');
    
    pos = posa - [posa(1) posa(2) posa(1) posa(2)];
    
    mp = [mid_point(1) mid_point(2) mid_point(1) mid_point(2)]-[pos(3)/2 0 pos(3)/2 0]; 
    
    set(h,'Position',pos + mp)
    
    set(h,'Name',[nf,'_',nt])
    
    if ppx < ppy
        
        set(h,'Orientation','up') % flip the line
          
    end
    
    % add the lines
    
    
    hp = get(h,'Porthandles');
    hp1 = get(h1,'Porthandles');
    hp2 = get(h2,'Porthandles');
    
    lhp = numel(hp.LConn);
    lhp1 = numel(hp1.LConn);
    lhp2 = numel(hp2.LConn);
    
    if lhp < lhp1
        
        il1 = find(pc);
       
        il1(il1 > lhp1) = il1(il1 > lhp1) - 1;
        
    else
        
        il1 = 1:lhp1;
        
    end
    
    if lhp < lhp2
        
        il2 = find(pc);
       
        il2(il2 > lhp2) = il2(il2 > lhp2) - 1;
        
    else
        
        il2 = 1:lhp2;
        
    end
    
    % determine which side of the line is closest to which bus
    
    Lpp = get(hp.LConn(1),'Position');
    
    Lpp1 = get(hp1.LConn(1),'Position');
    Lpp2 = get(hp2.LConn(1),'Position');
  
    LL1 = sqrt((Lpp(1) - Lpp1(1))^2 + (Lpp(2) - Lpp1(2))^2);
    LL2 = sqrt((Lpp(1) - Lpp2(1))^2 + (Lpp(2) - Lpp2(2))^2);
      
    [~,idx]=min([LL1 LL2]);
    
        if idx == 2  % flip the branch the other way so that current flows positive from the lowest bus number,
            % but take account of OLTC lines and their connection profile
            
            if strcmp(get(h,'Orientation'),'right')
                
                set(h,'Orientation','left');
                
            elseif strcmp(get(h,'Orientation'),'left')
                
                set(h,'Orientation','right');
                
            elseif strcmp(get(h,'Orientation'),'up')
                
                set(h,'Orientation','down');
                
            elseif strcmp(get(h,'Orientation'),'down')
                
                set(h,'Orientation','up');
                
            end
            
        end
        
        
        if ~flagFlip  % flip the branch the other way so that current flows positive from the lowest bus number,
            % but take account of OLTC lines and their connection profile
            
            if strcmp(get(h,'Orientation'),'right')
                
                set(h,'Orientation','left');
                
            elseif strcmp(get(h,'Orientation'),'left')
                
                set(h,'Orientation','right');
                
            elseif strcmp(get(h,'Orientation'),'up')
                
                set(h,'Orientation','down');
                
            elseif strcmp(get(h,'Orientation'),'down')
                
                set(h,'Orientation','up');
                
            end
            
        end
       
        
        if (numel(hp.LConn) == numel(hp1.LConn))
            
            %flip the bus
            set(h1,'Orientation',get(h,'Orientation'))
            
        end
        
        if (numel(hp.LConn) == numel(hp2.LConn))
            
            %flip the bus
            set(h2,'Orientation',get(h,'Orientation'))
            
        end
        
        
        
    for l = 1:numel(hp.LConn)
        
       if flagFlip
            
            add_line(model,hp.LConn(l),hp1.LConn(il1(l)));
            
            add_line(model,hp.RConn(l),hp2.LConn(il2(l)));
            
       else
            
            add_line(model,hp.RConn(l),hp1.LConn(il1(l)));
            
            add_line(model,hp.LConn(l),hp2.LConn(il2(l)));
            
            
        end
        
    end
    
    pause(0.01) % pause for visual reasons
    
end
    
    
end

