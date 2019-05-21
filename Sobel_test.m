clear ALL;
%% Reading files
path = 'Sobel_Assignment/MSRC_ObjCategImageDatabase_v1/';
img1 = '2_1_s.bmp';
img2 = '6_2_s.bmp';
file = fullfile('Sobel_Assignment/4Kimg.jpg');

% file = fullfile(path,img2);
RGB_tree = imread(file);
Gray_tree = double(rgb2gray(RGB_tree))/255;
threshold = 0.8;

%% Filtering in different ways

% [Filtered_img_W,Filtered_img_XW,Filtered_img_YW] = SOBEL_WIKI(Gray_tree);
% [Filtered_img,Filtered_img_X,Filtered_img_Y] = SOBEL_ANTO(Gray_tree);
% [Filtered_img_O,Filtered_img_XO,Filtered_img_YO] = SOBEL_ANTO_OPTIM(Gray_tree);
% [Filtered_img_O2,Filtered_img_XO2,Filtered_img_YO2] = SOBEL_ANTO_OPTIM_ver2(Gray_tree);
% [Filtered_img_M,Filtered_img_XM,Filtered_img_YM] = SOBEL_MATLAB(Gray_tree);

%% Measuring times

time_wiki = @() SOBEL_WIKI(Gray_tree);
time_anto = @() SOBEL_ANTO(Gray_tree);
time_anto_OPTIM = @() SOBEL_ANTO_OPTIM(Gray_tree);
time_anto_OPTIM_ver2 = @() SOBEL_ANTO_OPTIM_ver2(Gray_tree);
time_mat = @() SOBEL_MATLAB(Gray_tree);


fprintf('Wiki Conv: %f sec\n', timeit(time_wiki))
fprintf('Smart Conv: %f sec\n', timeit(time_anto))
fprintf('Optim Conv: %f sec\n', timeit(time_anto_OPTIM))
fprintf('Optim Conv ver2: %f sec\n', timeit(time_anto_OPTIM_ver2))
fprintf('Matlab Conv: %f sec\n', timeit(time_mat))

%% Dispay results

disp('Differences ...');
fprintf('Matlab vs Wiki : X: %f, Y: %f\n',sum(sum(abs(Filtered_img_YM - Filtered_img_YW)))...
,sum(sum(abs(Filtered_img_XM - Filtered_img_XW))))


fprintf('Matlab vs Smart: X: %f, Y: %f\n',sum(sum(abs(Filtered_img_YM - Filtered_img_Y)))...
,sum(sum(abs(Filtered_img_XM - Filtered_img_X))))

fprintf('Matlab vs Optim : X: %f, Y: %f\n',sum(sum(abs(Filtered_img_YM - Filtered_img_YO)))...
,sum(sum(abs(Filtered_img_XM - Filtered_img_XO))))


fprintf('Matlab vs Optim ver2 : X: %f, Y: %f\n',sum(sum(abs(Filtered_img_YM - Filtered_img_YO2)))...
,sum(sum(abs(Filtered_img_XM - Filtered_img_XO2))))


figure
subplot(2,2,1), imshow(Filtered_img_M)
subplot(2,2,2), imshow(Filtered_img)
subplot(2,2,3), imshow(Filtered_img_O)
subplot(2,2,4), imshow(Filtered_img_O2)

% imbinarize(Filtered_img,threshold)