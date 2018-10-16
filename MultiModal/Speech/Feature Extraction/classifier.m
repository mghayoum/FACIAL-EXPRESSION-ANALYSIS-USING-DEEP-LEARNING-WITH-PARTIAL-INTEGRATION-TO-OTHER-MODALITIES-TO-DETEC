%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Multimodal Emotions Analysis
% Version : 2.0
% Date : 04.6.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function imin = classifier(wave, fs)

feature = extraction(wave, fs);
class = load('FMtrainfemale.txt');
dist = zeros(1,3);
for i = 1:3
    dist(i) = disteusq(feature, class(i,:));
end

[distmin, imin] = min(dist);
