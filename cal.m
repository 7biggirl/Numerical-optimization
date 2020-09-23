function [f, G, flag] = cal(n)
    global f  G  flag
    for i = 1:n
        syms(['x', num2str(i)]) ;
    end
    syms X
    X = sym('x', [1,n]) ;

    syms r f1 f2
    r = 0 ;  
    for i = 1:29
       f1 = 0 ;  f2 = 0 ;
       for j = 1:n
          if(j~=1)
             f1 = f1 + (j-1) * X(j) * (i/29)^(j-2) ; 
          end
          f2 = f2 + X(j) * (i/29)^(j-1) ;
       end
       r = r + (f1 - f2^2 -1)^2 ; 
    end
    
    r = r + X(1)^2 ;
    r = r + (X(2) - X(1)^2 - 1)^2 ;    
    
    f = r ;
    G = jacobian(r, sym('x', [1,n])) ;
    flag = 1 ;
end

