function [Filtered_img,Filtered_X,Filtered_Y] = SOBEL_ANTO_OPTIM(Gray_img)
%% Defining Kernels and flipping them to make convolution 
Kernel_X=[-1 0 1; -2 0 2; -1 0 1];
Kernel_X=Kernel_X(:);
Kernel_X = flip(Kernel_X);

Kernel_Y=[-1 -2 -1; 0 0 0; 1 2 1];
Kernel_Y = Kernel_Y(:);
Kernel_Y = flip(Kernel_Y);

%% Pre-allocating arrays
sizeIMG = size(Gray_img);
Gray_reshaped = zeros((sizeIMG(1)-2) *(sizeIMG(2)-2),9);
sizeIMGFilterd = [sizeIMG(1)-2 sizeIMG(2)-2];

%% Sliding over image to create a rearranged 2D matrix with each row a different image window
k=1;
for i=1:(sizeIMGFilterd(2))
    for j=1:(sizeIMGFilterd(1))
        Gray_reshaped(k,:) = reshape(Gray_img(j:j+2,i:i+2),1,[]);
        k=k+1;
    end
end

%% Applying convolution with a dot-product
Filtered_X = Gray_reshaped*Kernel_X;
Filtered_Y = Gray_reshaped*Kernel_Y;

%% Reshaping to 2D matrix
Filtered_X = reshape(Filtered_X,sizeIMGFilterd(1),sizeIMGFilterd(2));
Filtered_Y = reshape(Filtered_Y,sizeIMGFilterd(1),sizeIMGFilterd(2));

%% Taking the modulus
Filtered_img = sqrt((Filtered_X.^2) + (Filtered_Y.^2));

end

