%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Multimodal Emotions Analysis
% Version : 2.0
% Date : 04.6.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;clc;
% cd  'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 6\Speech\Feature Extraction';
funcpathname = 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 6\Speech\Feature Extraction';
[waves,fs,num] = readwave('D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 6\Speech\Data', funcpathname);
count = zeros(1,3);
for i = 1:num
    emotion = classifier(waves(i).x, fs);
        switch emotion
        case 1,
            count(1) = count(1) + 1;
        case 2,
            count(2) = count(2) + 1;
        case 3,
            count(3) = count(3) + 1;
        case 4,
            count(4) = count(4) + 1;
        case 5,
            count(5) = count(5) + 1;
        case 6,
            count(6) = count(6) + 1;  
    end
end
disp('   ??Happ   ??Ang   ??Sadd  ??Diss ??Fea  ??Surp ');
disp(count);

