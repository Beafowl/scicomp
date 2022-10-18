% Aufgabe 3 Plottwist

function[] = plottwist()

    goldenRatio = (1 + sqrt(5))/2;
    goldenRatioVector = ones(20) * goldenRatio;
    x = 1:20;
    emptyVector = zeros(20);


    for i = x

        fibQuotient = fib2(i+1)/fib2(i);
        emptyVector(i) = fibQuotient;

    end

    plot(x, goldenRatioVector);
    hold on
    plot(x, emptyVector);
end
