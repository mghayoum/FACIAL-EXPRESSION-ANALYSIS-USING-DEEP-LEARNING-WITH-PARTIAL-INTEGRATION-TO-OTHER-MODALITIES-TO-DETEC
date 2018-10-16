%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Multimodal Emotions Analysis
% Version : 2.0
% Date : 04.6.2017
% Author : Mehdi Ghayoumi
%Input
% waves: frame
% fs:    Sampling Frequency
% num:   Speech Signal in each Frame
% 
% Output
% features: Average value for each emotion in all the sentences
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [FMtrain]=train()

FrameLen = floor(20*(fs/1000));%Frame 20ms
%Read wav file

funcpathname = 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 6\Speech\Data';
disp('Reading files for Happiness');

[Happiness,fs,num1] = readwave('D:\emotion recogntion0\Happiness\malefemale', funcpathname);
disp('Reading files for angry');

[angry,fs,num2] = readwave('D:\emotion recogntion0\angry\malefemale', funcpathname);
disp('Reading files for fear');

[fear,fs,num3] = readwave('D:\emotion recogntion0\fear\malefemale', funcpathname);
disp('Reading files for sadness');

[sadness,fs,num4] = readwave('D:\emotion recogntion0\sadness\malefemale', funcpathname);
disp('Reading files for surprise');

[surprise,fs,num4] = readwave('D:\emotion recogntion0\surprise\malefemale', funcpathname);
disp('Reading files for disgust');

[disgust,fs,num4] = readwave('D:\emotion recogntion0\disgust\malefemale', funcpathname);
FMtrain = zeros(6, 19);

disp('Features for Happiness');
FMtrain(1,:) = extraction(Happiness,fs,num1);

disp('Features for angry');
FMtrain(2,:) = extraction(angry,fs,num2);

disp('Features for fear');
FMtrain(3,:) = extraction(fear,fs,num3);

disp('Features for sadness');
FMtrain(4,:) = extraction(sadness,fs,num4);

disp('Features for surprise');
FMtrain(5,:) = extraction(surprise,fs,num5);

disp('Features for disgust');
FMtrain(6,:) = extraction(disgust,fs,num6);

% Store the emotion vectors in ‘FMtrain.txt’
dlmwrite('FMtrain.txt', FMtrain);

