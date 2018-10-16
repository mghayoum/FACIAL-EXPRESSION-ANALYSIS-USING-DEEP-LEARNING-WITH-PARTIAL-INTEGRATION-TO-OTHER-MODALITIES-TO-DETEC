
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Multimodal Emotions Analysis
% Version : 2.0
% Date : 04.6.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [avgF0] = getpitch(y, fs)

% get the number of samples
ns = length(y);

% error checking on the signal level, remove the DC bias
mu = mean(y);
y = y - mu;

% use a 20msec segment, choose a segment every 10msec Frame Length: 20ms, Frame Shift: 10ms
fRate = floor(20*fs/1000);
updRate = floor(10*fs/1000);
nFrames=fix((length(y)-fRate+updRate)/updRate);

% the pitch contour is then a 1 x nFrames vector 1*nFrames
f0 = zeros(1, nFrames);
f01 = zeros(1, nFrames);

% get the pitch from each segmented frame 
k = 1;
avgF0 = 0;
m = 1;
for i=1:nFrames
    xseg = y(k:k+fRate-1);
    f01(i) = pitchacorr(fRate, fs, xseg);
    
 % do some median filtering, less affected by noise 
    if i>2 & nFrames>3
        z = f01(i-2:i);
        md = median(z);
        f0(i-2) = md;
        if md > 0
            avgF0 = avgF0 + md;
            m = m + 1;
        end
    elseif nFrames<=3
        f0(i) = a;
        avgF0 = avgF0 + a;
        m = m + 1;
end
    k = k + updRate;
end
t = 1:nFrames;
t = 20 * t;
if m==1
avgF0 = 0;
else
avgF0 = avgF0/(m-1);
end

