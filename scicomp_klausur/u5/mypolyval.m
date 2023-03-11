function [] = mypolyval(t,v, p)
    
    % p: n x 1
    grad = size(p,1);
    
    x = 0:grad-1;

    b = (t.'.^x);

    b = sum(b,2);

    disp(b);

    plot(t,v);

    hold on

    plot(t,b);

end

