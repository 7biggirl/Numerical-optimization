function y = Watson(x)
    y = 0 ;
    for i = 1:31
        y = y + (rx(x,i))^2 ;
    end
end

