function [] = ableitung2()

    img = imread("cameraman.png");
    img = cast(img, "double");

    % horizontal second derivative

    derivative_x = zeros(size(img));


    for i = 1:size(img,1)
        for j = 2:size(img,2)-1

            derivative_x(i,j) = (img(i,j+1)+img(i,j-1)-2*img(i,j));

        end

    end

    derivative_x_min = min(min(derivative_x(:,1:size(derivative_x,2)-1)));
    derivative_x_max = max(max(derivative_x(:,1:size(derivative_x,2)-1)));

    derivative_x(:,1) = 0;
    derivative_x(:,size(img,2)) = 0;

    derivative_x_scaled = (derivative_x - derivative_x_min) / derivative_x_max;

    % vertical second derivative

    derivative_y = zeros(size(img));


    for j = 1:size(img,2)
        for i = 2:size(img,1)-1

            derivative_y(i,j) = (img(i+1,j)+img(i-1,j)-2*img(i,j));


        end

    end

    derivative_y_min = min(min(derivative_y(:,1:size(derivative_y,2)-1)));
    derivative_y_max = max(max(derivative_y(:,1:size(derivative_y,2)-1)));

    derivative_y(1,:) = 0;
    derivative_y(size(img,1),:) = 0;

    derivative_y_scaled = (derivative_y - derivative_y_min) / derivative_y_max;

    % calculate length of derivative vector

    derivative = sqrt(derivative_y_scaled.^2 + derivative_x_scaled.^2);

    imshow(derivative);

end

