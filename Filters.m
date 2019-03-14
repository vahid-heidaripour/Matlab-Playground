function output = Filters(imageName)
% This function implemented in order to show the difference 
% between bilateral filter vs. low-pass filter
%
% Example:
% -----------
% Filters('lena.png')
% the left picture in output is low-pass applied to original image
% and the right one is with bilateral filter

if ~ischar(imageName)
    error('Input must be a char vector.')
end
if exist(imageName, 'file') == 2
    inputImage = imread(imageName);
    grayImage = rgb2gray(inputImage);
    grayImageDouble = im2double(grayImage);
    bilatImage = imbilatfilt(grayImageDouble);
    
    filter = ones(3,3) / 9;
    lowBlurredImage = filter2(filter, grayImageDouble, 'same');
    
    montage({lowBlurredImage, bilatImage});
    title (['low pass vs. bilateral']);
else    
    error('Input file doesn''t exists.')
end
end
