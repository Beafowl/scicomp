function [y_val] = mypolyval(p, t)

    % load function
    % optionally we can use p and x as arguments of the function
    load('Messdaten.mat', 'v');

    plot(t,v);

    % implement polyval(p,x)

    % calculate x^3 + x^2 ... for every value of t
    pows = t.^(fliplr(0:size(p,2)-1)');

    % vector multiplication to get the y values
    y_val = p * pows;
end