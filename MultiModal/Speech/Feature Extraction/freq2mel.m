%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Multimodal Emotions Analysis
% Version : 2.0
% Date : 04.6.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function m1 = freq2mel (f1)
  m1 = 2595 * log10(1 + f1./700);       % compute mel value from frequency f

