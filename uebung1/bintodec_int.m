function[output] = bintodec_int(str)

    str_flipped = fliplr(str);
    %str_flipped = str;

    number = 0;
    counter = 0;

    for i = str_flipped

        number = number + str2double(i)*2^counter; 
        %disp(str2double(i));
        counter = counter + 1;
    end
    output = number;
end

