%% Horizontal Edge Detection
img = imread('test2.png');
% fimg = medfilt2(img);
img2 = uint8(imfilter(img,fspecial('sobel')) + img);
img3 = uint8(imfilter(img2,fspecial('sobel')) + img2);
img4 = uint8(imfilter(img3,fspecial('sobel')) + img3);
img5 = uint8(imfilter(img4,fspecial('sobel')) + img4);


BW = edge(img5,'Sobel','horizontal');

fimg2 = medfilt2(img5);

figure
imshow(BW);

figure
imshow(fimg2)

%% Median blocks
% all images are 1024x1024

medblocks = zeros(size(8,8));

for i = 1:8
    for j = 1:8
        medblocks(i,j) = median(median(img(i*128-127:i*128,j*128-127:j*128)));
    end
end







