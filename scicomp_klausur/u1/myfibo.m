function number = myfibo(n)

    if n < 1
        error("n needs to be greater than 0");
    end

    if floor(n) ~= n % check for integer
        error("n needs to be an integer")
    end

    if n < 3
        number = 1;
    else
        first_number = 1;
        second_number = 1;

        counter = 2;
        while counter ~= n

            counter = counter + 1;

            next_number = first_number + second_number;
            first_number = second_number;
            second_number = next_number;

        end

        number = second_number;
    end
end