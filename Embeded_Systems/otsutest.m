clear;
I = imread('Test2.png');
I = histeq(I);

IDX = otsu(I,3);
%IDX2 = imcomplement(IDX);
% final = otsu(IDX,3);
final = zeros(size(IDX));
nonlungseed = zeros(size(IDX));
nonlungseed(IDX == 3) = 1;
final(nonlungseed==1) = 255;
subplot(2,2,2)
imshow(uint8(final)), axis image off
title(['n = ' int2str(3)],'FontWeight','bold')

% LB = 0;
% UB = 255;
% %IDX = bwareaopen(IDX, 255, 4);
% %IDX = xor(bwareaopen(IDX,LB),  bwareaopen(IDX,UB));
% L = superpixels(I,100);
% %IDX2= boundarymask(I);
% final = imoverlay(I, IDX2,'cyan');
% final1 = I - final;
% mask =  cast(final1, class(I));
% final2 = I .* mask;
% imshow((IDX2),'InitialMagnification', 67);




% for n = 2:3
%     IDX = otsu(I,n);
%     I = imcomplement(I);
%     subplot(2,2,n)
%     imagesc(IDX), axis image off
%     title(['n = ' int2str(n)],'FontWeight','bold')
% end
colormap(gray)
   
