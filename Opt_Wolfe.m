function [alpha] = Opt_Wolfe(xk, dk)
    rho = 0.25; sigma = 0.75;
    alpha = 1; a = 0; b = Inf; 
    while (1)
        if ~(fun(xk+alpha*dk)<=fun(xk)+rho*alpha*gfun(xk)'*dk)
                b = alpha;
                alpha = (alpha+a)/2;
        continue;
        end
        if ~(gfun(xk+alpha*dk)'*dk >= sigma*gfun(xk)'*dk)
                a = alpha;
                alpha = min([2*alpha, (b+alpha)/2]);
        continue;
        end
        break;
    end

end