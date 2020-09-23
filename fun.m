function [r] = fun(X)
%     f=100*(x(2)-x(1)^2)^2+(1-x(1))^2;
%     r = X(1)^2 + 4*X(2)^2 ;

    global f 
    global flag
    n = length(X) ; 
    if(flag==1)
        r = vpa(subs(f, sym('x', [1,n]) , X')) ;
    end

end

