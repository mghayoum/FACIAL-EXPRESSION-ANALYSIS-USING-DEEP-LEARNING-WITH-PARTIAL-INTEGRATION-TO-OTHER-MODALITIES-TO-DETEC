%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Facial Expression LSH-PCA-LDA
% Version : 2.0
% Date : 01.2.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ################# Low Dimension Face Space Construction ################
[C,S,L]=princomp(double(face),'econ'); % PCA
EigenRange = [1:20]; % Define Eigenvalues that will be selected
C = C(:,EigenRange);
%% ########################################################################
%% ############# Load Test Data and project on Face Space #################

ProjectedTest = face*C;