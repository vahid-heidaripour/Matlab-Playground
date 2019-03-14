function mse = FFT(imageName)
% This is a function uses built-in Fast Fourier transform function
% and calculates the mean square error between the original image and the transformed one.
%
% Example:
% -----------
% FFT('lena.png')

if ~ischar(imageName)
    error('Input must be a char vector.')
end
if exist(imageName, 'file') == 2
    inputImage = imread(imageName);
    grayImage = rgb2gray(inputImage);
    grayImageDouble = im2double(grayImage);
    
    fftOut = fft2(grayImageDouble);
    ifftOut = ifft2(fftOut);
    
    mse = immse(grayImageDouble, ifftOut);
else    
    error('Input file doesn''t exists.')
end
end
