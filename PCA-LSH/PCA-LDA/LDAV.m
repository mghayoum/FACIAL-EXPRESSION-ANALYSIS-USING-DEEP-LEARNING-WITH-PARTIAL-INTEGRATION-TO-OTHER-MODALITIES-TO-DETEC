%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Facial Expression LSH-PCA-LDA
% Version : 2.0
% Date : 01.2.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ################# Low Dimension Face Space Construction ################
function ProjectedTest=LDAV(X,i) 
[C,S,L]=MdlLinear = fitcdiscr(meas,species); % PCA
EigenRange = [1:i]; % Define Eigenvalues that will be selected
C = C(:,EigenRange);
%% ########################################################################
%% ############# Load Test Data and project on Face Space #################

ProjectedTest = data*C;