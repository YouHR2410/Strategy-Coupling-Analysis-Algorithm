payoff_matrix=[0 0 0 0.25;1 0 0 0;0 1 0 0;0 0 1 0]

syms x1 x2 x3 x4    real
           Payoff_vector_field_F = payoff_matrix *[x1 x2 x3 x4 ]';
            mean_U = [x1 x2 x3 x4 ] * Payoff_vector_field_F;
            V_Eq_0 = [x1 x2 x3 x4 ]'.*(Payoff_vector_field_F - mean_U);
            Jac_x = jacobian(V_Eq_0); 
            S=solve(V_Eq_0);%%vpasolve->sovle;ghy_7-22
            A=eval([S.x1 S.x2 S.x3 S.x4]);
 
                s3=prod(A,2);
                id = find(s3>0);
            if size(id,1)==1 
                    x1=A(id,1);x2=A(id,2);x3=A(id,3);x4=A(id,4);
                    Jac_NE = eval(Jac_x) 
            end 
            
            [v d] =eig(Jac_NE)
            
            [Ymn Xmn Tmn Smn]= from_eigenvector_out_XY(v(:,3))
