clear;
I = imread('test3.png');
uniqLevels = unique(I(:));  

disp(['Number of unique levels = ' int2str( length(uniqLevels) )]);

Nvals = [1 2 4 8];
for i = 1:length(Nvals)
    [thresh, metric] = multithresh(I, Nvals(i) );
    disp(['N = ' int2str(Nvals(i)) '  |  metric = ' num2str(metric)]);
end

seg_Neq8 = imquantize(I,thresh);
uniqLevels = unique( seg_Neq8(:) );
[thresh, metric] = multithresh(seg_Neq8,8);
%[thresh, metric] = multithresh(seg_Neq8,9)
imshow (seg_Neq8(:));