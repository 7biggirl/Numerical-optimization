function y = cal_min(X)
    r = 0 ;  
    n = length(X) ; 
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
    
    y = r ;
    
end

