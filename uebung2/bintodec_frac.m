function[output] = bintodec_frac(str)

    str_flipped = str;

    number = 0;
    counter = -1;

    for i = str_flipped

        number = number + str2double(i)*2^counter; 
        counter = counter - 1;
    end
    output = number;
end

