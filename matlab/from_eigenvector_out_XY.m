function [Ymn Xmn Tmn Smn]= from_eigenvector_out_XY(v_1column)
  Ndim=length(v_1column);
      Ymn=[]; Xmn=[];
      Tmn=zeros(Ndim); Smn=zeros(Ndim);
    for m=1:Ndim-1
        for n=m+1:Ndim 
             vm=v_1column(m);
             vn=v_1column(n);
             
             area_m_n = abs(vm)*abs(vn)*pi*sin(angle(vm)-angle(vn)); % Eq 1
             Ymn=[Ymn; area_m_n];
             Tmn(m,n) = area_m_n;
             Tmn(n,m) = -area_m_n;
        end 
    end
    
    for m=1:Ndim
        for n=m:Ndim 
             vm=v_1column(m);
             vn=v_1column(n);
            brea_m_n = abs(vm)*abs(vn)*pi*cos(angle(vm)-angle(vn)); % Eq 1
             Xmn=[Xmn; brea_m_n];
             Smn(m,n) = brea_m_n; 
             Smn(n,m) = brea_m_n; 
        end 
    end 
    
end