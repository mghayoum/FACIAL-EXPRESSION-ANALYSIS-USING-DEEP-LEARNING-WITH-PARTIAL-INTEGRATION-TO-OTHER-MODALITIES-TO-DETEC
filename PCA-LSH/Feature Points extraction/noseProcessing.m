%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Symmetry Based Analysis of Facial Expressions Partially Occluded Due to Head Motions
% Version : 1.0
% Date : 01.2.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [V, CONT] = noseProcessing(imgNose, landcont)
%  This function is to detect the mouth


% applying Gaussian filter
filtroGaussian= fspecial('gaussian',[5 5],2);
Ig = imfilter(imgNose,filtroGaussian,'same');
    
% resizing the image
resizenose = 3;
linhas = floor(length(Ig(:,1,1))*resizenose);
colunas =  floor(length(Ig(1,:,1))*resizenose);
pic = imresize(Ig,[linhas,colunas],'bilinear');

% separating the image components (HSV)
hsv = rgb2hsv(pic); 
[h,s,v] = rgb2hsv(pic);
   
% Erode Hue
se = strel('disk',5);  
erodedHue = imerode(h,se);
    
% Dilate Hue
se = strel('disk',8);
dilatedErodedHue = imdilate(erodedHue,se);

% convert image to binary
bw = im2bw(dilatedErodedHue,graythresh(dilatedErodedHue));
    
% finding and selecting blob
cc = bwconncomp(bw);
stats = regionprops(cc,'Area');
idx = find([stats.Area] == max([stats.Area]));
BW6 = ismember(labelmatrix(cc), idx);
   
cannyNose = edge(BW6,'canny',0.4);
 
[V CONT] = detectLandmarks(cannyNose, resizenose,landcont);

end