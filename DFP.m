function [x,f,k] = DFP(eps, x0)
    digits(10) ;
    H= eye(length(x0))   ;
    xk_pre = x0 ;
    gf_pre = gfun(x0)  ;
    dk = -H * gf_pre   ;
    step = Opt_Wolfe(x0, dk)   ;
    xk = xk_pre + step * dk   ;
    gf = gfun(xk)   ;
    k = 0;
    
    judge = abs(norm(gf))   ;
    while(judge > eps)
        delta = xk - xk_pre   ;
        gamma = gf - gf_pre   ;
        H = H + (delta * delta')/(delta' * gamma) - (H * gamma * gamma' * H)/(gamma' * H * gamma)   ;
        dk = -H * gf   ;
        step = Opt_Wolfe(xk, dk)   ;
        xk_pre = xk   ;
        xk = xk_pre + step * dk   ;
        
        gf_pre = gfun(xk_pre)  ;
        gf = gfun(xk)   ;
        
        judge = abs(norm(gf))     ;
        k = k+1 ;
%         x = xk   ;
%         f = fun(xk)   ;

    end 
    x = xk   ;
    f = fun(xk)   ;

end

