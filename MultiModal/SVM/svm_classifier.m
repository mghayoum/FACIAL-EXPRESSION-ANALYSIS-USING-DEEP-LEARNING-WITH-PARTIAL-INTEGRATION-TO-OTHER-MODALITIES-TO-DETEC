
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Symmetry Based Analysis of Facial Expressions Partially Occluded Due to Head Motions
% Version : 1.0
% Date : 01.2.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [CMdl,Correctness2] = svm_classifier(tr_images, tr_labels)

% rng(1); % For reproducibility


% Train an ECOC model using SVM binary classifiers 
t = templateSVM('Standardize', 1);
Mdl = fitcecoc(tr_images, tr_labels, 'Learners', t);
CVMdl = crossval(Mdl);
loss = kfoldLoss(CVMdl);
% fprintf('Percentage Correct Classification   : %f%%\n', 100*(1-loss));
Correctness2=100*(1-loss);
CMdl = CVMdl.Trained{3};           % Extract trained, compact classifier
