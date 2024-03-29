%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% (1) Reads : F_3bands.tif
% (2) Crops the 3 band image
% (3) Samples images for testing into 256x256 image files
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;
fetchme = dir('F_3bands*.tif');
k = 6; % vary number
img = imread(fetchme(k).name);
file_name = fetchme(k).name;
% imshow(img);
img = img(425:680,:,:);
get_size = [256 256];

%compute upper bound in X and Y direction
upperlimit_Y = ceil(size(img,1)/get_size(1));
upperlimit_X = ceil(size(img,2)/get_size(2));

img_new = zeros(upperlimit_Y*get_size(1), upperlimit_X*get_size(2), size(img,3));
img_new(1:size(img,1), 1:size(img,2),:) = mat2gray(img);

for i=1:upperlimit_Y
    for j=1:upperlimit_X
        
        Y_start_idx = (i-1)*get_size(1) + 1;
        Y_end_idx = Y_start_idx - 1 + get_size(1);
        
        X_start_idx = (j-1)*get_size(2) + 1;
        X_end_idx = X_start_idx - 1 + get_size(2);
        
        test = img_new(Y_start_idx:Y_end_idx, X_start_idx:X_end_idx,:);
        
        name = file_name(10:(end-4));   
        name_test = "finalfigure_test_" + name + "_Y" + i + "_X " + j + ".tif";
        
        imwrite(test,name_test);
    end
end