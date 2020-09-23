function [x,f,k] = Conjugate_grad(eps, x0)
    digits(10) ;
    xk = x0 ;  k = 1 ;
    gf = gfun(xk) ;
    judge = norm(gf) ;
    dk = -gf ;

    while(abs(judge) > eps)
        step = Opt_Wolfe(xk, dk)  ;
        
        xk_pre = xk ;
        gf_pre = gf ;
        
        xk = xk + step * dk  ;
        gf = gfun(xk)  ;
        
        dk = -gf + ( norm(gf)^2 / norm(gf_pre)^2 ) * dk   ;
        
        judge = norm(gf)   ;
        k = k+1 ;

    end
    
    x = xk ;
    f = fun(xk) ;

end

