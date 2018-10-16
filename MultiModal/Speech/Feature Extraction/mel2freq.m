%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Multimodal Emotions Analysis
% Version : 2.0
% Date : 04.6.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function f1 = mel2freq (mel1)
f1 = 700*((10.^(mel1 ./2595)) -1);   % compute frequency from mel value
