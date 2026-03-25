function capacitor_placement_ssc(mdl,data)
%
% This function places the capacitors
%
% Copyright (C) 2026, The MathWorks, Inc.
%


bus_no = data.capacitors.Bus_No;

nb = numel(bus_no);

for l = 1 % add only bus 83 as the other capacitors are included in the loads

    % find bus
    
    ha = find_system([mdl,'/Bus_',num2str(bus_no(l))]);
    hb = get_param(ha,'handle');
    h = hb{1};
    
    % determine phase connectivity
    
    idx = ismember(data.buses.Bus_No,bus_no(l));
    
    bp = data.buses{idx,{'A','B','C'}};

    sbp = sum(bp);
    
    % place the capacitor
    
    hc = add_block(['Ycap_snt/',num2str(sbp),'ssc'],[mdl,'/C',num2str(bus_no(l))]);
    
    posa = get(hc,'Position');
    
    pos = posa - [posa(1) posa(2) posa(1) posa(2)];
    
    pp = get(h,'Position');
    
    set(hc,'Position',pos + [pp(1)+50 pp(2)-50 pp(1)+50 pp(2)-50])

    % determine ports
    
    hbp = get(h,'Porthandles');
    hcp = get(hc,'Porthandles');
    
    % connect ports
    
    for lp = 1:numel(hcp.LConn)
        
        add_line(mdl,hbp.LConn(lp),hcp.LConn(lp))
        
    end
    
    
    
end


