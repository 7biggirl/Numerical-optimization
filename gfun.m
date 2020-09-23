function gf = gfun(x)
%     gf=[-400*x(1)*(x(2)-x(1)^2)+2*(1-x(1)),200*(x(2)-x(1)^2)]';
%     gf = [2*x(1), 8*x(2)]' ;   

    n = length(x) ; 
    global flag
    global G
    if(flag==1)
        gf = subs(G,sym('x',[1,n]), x')' ;
        gf = vpa(gf) ;
    end

end

