close all;
clear all;
clc
% Read
I=imread('Test2.png'); 
% display 
figure(1),imshow(I);

%histogram
hst = imhist(I);
Lhst = length(hst);
n_p = sum(hst(:));


%Probability distribution function
pdf = hst / n_p;
sigma = zeros(1,Lhst);
% Calculate probability of object/background class
for index = 1 : Lhst
    p_obj = sum(pdf(1:index));
    p_back = 1 - p_obj;
    m_o = sum((0:index-1)'.*pdf(1:index)) / p_obj;
    m_b = sum((index:Lhst-1)'.*pdf(index+1:Lhst)) / p_back;
    sigma(index) = p_obj*p_back*((m_b - m_o)^2);    
end

%max variance
[max_s_b imgout] = max(sigma);
%imgout = imgout - 1; 
out = I >= imgout;
imshow(out)
figure(2), imhist(I);
