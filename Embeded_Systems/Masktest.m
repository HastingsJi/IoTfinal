clear;
I = imread('Test2.png');
I1 = double(I);
disp('original image size: ');
disp(size(I1));

kernel = [0, -1, 0; -1, 4, -1; 0, -1, 0]/ 4;
sharpenedImage = conv2(double(I), kernel, 'same');
sharpenedImage = conv2(I1, kernel);
sharpenedImage = uint8(sharpenedImage);
subplot(2,3,1), imshow (sharpenedImage);
title('Sharpened Image');

mask1 = [1 0 0; 0 1 0; 0 0 1];
colormap(mask1);
subplot(2,3,2),imshow(sharpenedImage,mask1);
title('colormap');
%normalizedImage = uint8(255 * mat2gray(sharpenedImage));

rgbImage = I;
[rows columns numberOfColorBands] = size(rgbImage);

% Display the original gray scale image.
subplot(2, 3, 3);
imshow(I, []);
title('image');

% Get red, green, and blue channels.
redChannel = rgbImage;
greenChannel = rgbImage;
blueChannel = rgbImage;

% Threshold each color channel to get pixels darker than 40.
maskr = rgbImage > 170;
maskg = rgbImage > 255;
maskb = rgbImage > 255;


% Apply the mask
redChannel(maskr) = 255;
greenChannel(maskg) = 0;
blueChannel(maskb) = 0;

% Recombine into RGB image.
rgbImage = cat(3, redChannel, greenChannel, blueChannel);

% Display
subplot(2, 3, 4);
imshow(rgbImage, []);
title('test');
