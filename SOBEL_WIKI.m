function [Filtered_img,Filtered_X,Filtered_Y] = SOBEL_WIKI(Gray_img)
%% Defining Kernels
Gx=[-1 0 1; -2 0 2; -1 0 1];
Gy=[-1 -2 -1; 0 0 0; 1 2 1];
Gx = flip(fliplr(Gx));
Gy = flip(fliplr(Gy));

%% Pre-allocating arrays
rows = size(Gray_img,1)-2;
columns = size(Gray_img,2)-2;
Filtered_img = zeros(rows,columns);
Filtered_X = zeros(rows,columns);
Filtered_Y = zeros(rows,columns);

%% Applying convolution on each sliding window
for i=1:rows
    for j=1:columns
        currentWindow = Gray_img(i:i+2,j:j+2);
        S1=sum(sum(Gx.*currentWindow));
        S2=sum(sum(Gy.*currentWindow));

        Filtered_img(i,j)=sqrt(S1.^2+S2.^2);
        Filtered_X(i,j)=S1;
        Filtered_Y(i,j)=S2;
    end 
end 

end 