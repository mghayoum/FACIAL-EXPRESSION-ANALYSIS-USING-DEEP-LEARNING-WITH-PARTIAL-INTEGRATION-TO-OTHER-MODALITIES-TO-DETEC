%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Multimodal Emotions Analysis
% Version : 2.0
% Date : 04.6.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [waves,fs,num] = readwave(wavpathname, funcpathname)
cd(wavpathname);
files=dir('*.wav');
num = size(files,1);
 for i=1:num
   [Y,fs]=audioread(files(i).name);
   waves(i).x=Y;
 end
 cd(funcpathname);
