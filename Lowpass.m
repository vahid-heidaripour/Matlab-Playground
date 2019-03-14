function mse = Lowpass(filterSize, sigma, imageName)
% Low pass is a function that takes an image as input 
% and applies the Guassian filter in both special and frequency domain to it.
%
% Example:
% -----------
% Lowpass(5, 2, 'lena.png')

if ~isnumeric(filterSize) | ~ischar(imageName) | ~isnumeric(sigma)
    error('Input types are not valid.')
end
if exist(imageName, 'file') == 2
    inputImage = imread(imageName);
    grayImage = rgb2gray(inputImage);
    grayImageDouble = im2double(grayImage);
    spaceLowpass = imgaussfilt(grayImageDouble, sigma, 'FilterSize', filterSize, 'FilterDomain', 'spatial');
    frequencyLowpass = imgaussfilt(grayImageDouble, sigma, 'FilterSize', filterSize, 'FilterDomain', 'frequency');
    
    montage({grayImageDouble, spaceLowpass, frequencyLowpass});
    title (['Original vs. spacial low-pass and frequency low-pass']);
    
    mse = immse(spaceLowpass, frequencyLowpass);
end 
end

