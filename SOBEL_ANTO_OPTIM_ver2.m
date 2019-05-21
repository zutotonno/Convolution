function [Filtered_img,Filtered_X,Filtered_Y] = SOBEL_ANTO_OPTIM_ver2(Gray_img)
%% Defining Kernels
Kernel_X=[-1 0 1; -2 0 2; -1 0 1];
Kernel_X=Kernel_X(:);
Kernel_X = flip(Kernel_X);

Kernel_Y=[-1 -2 -1; 0 0 0; 1 2 1];
Kernel_Y=Kernel_Y(:);
Kernel_Y = flip(Kernel_Y);

%% Pre-allocating arrays
sizeIMG = size(Gray_img);

sizeIMGFilterd = [sizeIMG(1)-2 sizeIMG(2)-2];

%% Using built-in
Gray_reshaped = im2col(Gray_img,[3 3],'sliding')';

%% Applying convolution with a dot-product
Filtered_X = Gray_reshaped*Kernel_X;
Filtered_Y = Gray_reshaped*Kernel_Y;

%% Reshaping to 2D matrix
Filtered_X = reshape(Filtered_X,sizeIMGFilterd(1),sizeIMGFilterd(2));
Filtered_Y = reshape(Filtered_Y,sizeIMGFilterd(1),sizeIMGFilterd(2));

%% Taking the modulus
Filtered_img = sqrt((Filtered_X.^2) + (Filtered_Y.^2));

end

