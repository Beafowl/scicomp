function [] = verify()

    quotiens = [];

    for x = 2:11

        fib_n = myfibo(x-1);
        fib_n_plus = myfibo(x);

        q = fib_n_plus/fib_n;

        quotiens(end + 1) = q;

    end

    %x = 2:11;

    plot(quotiens,"--o");

    hold on

    golden = zeros(length(2:11), 1) + 1.618;
    plot(golden);

end

