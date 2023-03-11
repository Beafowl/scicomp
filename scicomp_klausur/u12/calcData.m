function [m, C] = calcData(filepath)
    
    % statistical values are two dimensional,
    % safe them in a tuple (??)

    M = csvread(filepath);

    m1 = [mean(M(:,1)) mean(M(:,2))]; 
    m2 = [mean(M(:,3)) mean(M(:,4))]; 

    v1 = [var(M(:,1)) var(M(:,2))];
    v2 = [var(M(:,3)) var(M(:,4))]; 

    cov()

    disp(M);
end

