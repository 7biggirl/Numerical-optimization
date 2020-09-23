function [x,f,k] = opt_steepest(eps,x0)
    digits(10) ;
    [gf] = gfun(x0) ;
    xk = x0 ;  k = 0;
    judge = abs(norm(gf))   ;
    while( judge > eps)
        dk = -gf ;
        step = Opt_Wolfe(xk, dk)  ;
        xk = xk + step * dk    ;
        [gf] = gfun(xk)   ;
        k = k+1 ;
%         f = fun(xk)   ;
        judge = abs(norm(gf))  ;
    end
    x = vpa(xk) ;
    f = vpa(fun(xk)) ;
end

