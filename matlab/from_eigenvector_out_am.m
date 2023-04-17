function [Lmn Tmn]= from_eigenvector_out_am(v_1column)
  Ndim=length(v_1column);
      Lmn=[];
      Tmn=zeros(Ndim);
    for m=1:Ndim-1
        for n=m+1:Ndim 
             vm=v_1column(m);
             vn=v_1column(n);
             area_m_n = abs(vm)*abs(vn)*pi*sin(angle(vm)-angle(vn));
             Lmn=[Lmn; area_m_n];
             Tmn(m,n) = area_m_n;
             Tmn(n,m) = -area_m_n;
        end 
    end
end
 