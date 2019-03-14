function estDos = NLM(imageName)
% NLM('imageName') applies a non-local means based filter to the input image
% the function first uses rgb2gray to convert the input image to grayscale 
% then uses im2double to sclae it to [0, 1]
%
% Example
% -----------
% NLM('lena.png')

if ~ischar(imageName)
    error('Input must be a char vector.')
end
if exist(imageName, 'file') == 2
    inputImage = imread(imageName);
    grayImage = rgb2gray(inputImage);
    grayImageDouble = im2double(grayImage);
    [filteredImage, estDos] = imnlmfilt(grayImageDouble);
    montage({grayImageDouble,filteredImage});
    title (['Estimated degree of smoothing, ', 'estDos = ',num2str(estDos)]);
else    
    error('Input file doesn''t exists.')
end
end
