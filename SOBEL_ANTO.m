function [Filtered_img,Filtered_X,Filtered_Y] = SOBEL_ANTO(Gray_img)
%% Pre-allocating arrays
rows = size(Gray_img,1)-2;
columns = size(Gray_img,2)-2;
Filtered_X = zeros(rows,columns);
Filtered_Y = zeros(rows,columns);

%% Applying convolution on each window avoiding useless operations
% (like multiplication by 0 or by 1)
for i=1:rows
    for j=1:columns
        img = Gray_img(i:i+2,j:j+2);
        x_gradient = -img(3,3) +  img(3,1)...
                    - 2*img(2,3) + 2*img(2,1) ...
                    - img(1,3) + img(1,1);
        y_gradient = -img(3,3) -  2*img(3,2)...
                    - img(3,1) + img(1,3)...
                    + 2*img(1,2) + img(1,1);

        Filtered_X(i,j) = x_gradient;
        Filtered_Y(i,j) = y_gradient;
    end 
end 

%% Taking the modulus
Filtered_img = sqrt((Filtered_X.^2) + (Filtered_Y.^2));
end

