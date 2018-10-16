%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Multimodal Emotions Analysis
% Version : 2.0
% Date : 04.6.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function feature = extraction(wave, fs)
feature = zeros(1,7);
FrameLen = floor(20*(fs/1000));%Frame 20ms
FrameInc = floor(10*(fs/1000));%??10ms
%Hamming
W = hamming(FrameLen);
%Get the voiced part using End-Point Detection
[y, feature(1,1),feature(1,2),feature(1,3),feature(1,4)] = vad(wave,fs,W,FrameInc);
[feature(1,5)] = getpitch(y, fs);
[feature(1,62),feature(1,7)] = formants(y,fs,W,FrameInc);
% [feature(1,4),feature(1,5),feature(1,6),feature(1,7),feature(1,8),feature(1,9),feature(1,10),feature(1,11),feature(1,12),feature(1,13),feature(1,14),feature(1,15)] = mfcc(y,fs);

