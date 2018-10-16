%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Symmetry Based Analysis of Facial Expressions Partially Occluded Due to Head Motions
% Version : 1.0
% Date : 01.2.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% load databses
cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\Database\SVM';
dataTrainGene;
train_x=traindata;
train_x=reshape(train_x,65536,140);
train_y=trainlable;
tr_labels=train_y';
for i=0:140
end
cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\Database\SVM';
dataTestGene;
test_x=testdata;
test_x=reshape(test_x,65536,70);
test_y=testlable;

% ratiom;
cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\SVM';
% normalization
train_x = double(train_x')/255;
test_x = double(test_x)/255;
train_y = (double(train_y))';
test_y = double(test_y);
% cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\CNN';
% expand to 32*32 
% train_x = expansionData(train_x);
% test_x = expansionData(test_x);
% cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\SVM';
%load labeled_images.mat;
% load public_test_images.mat;
% load hidden_test_images.mat;
% load gabor_features.mat;
% load trainedModel;



%% Preprocessing the data

    inputs_train = train_x;
    inputs_test = test_x;
%     save('gabor_features', 'inputs_train', 'inputs_test', 'tr_labels');



%% Make prediction
     
[svm_modeln,Correctness2] = svm_classifier(inputs_train, tr_labels);
save('trainedModeln', 'svm_modeln');
cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\Results\Test';
test=imread('1.jpg');
test = double(test)/255;
test1=imresize((test(:,:,1)),[256,256]);
test2=reshape(test1,65536,1);
prediction = predict(svm_modeln, (test2'));

%% Print results

% Fill in the test labels with 0 if necessary
% if (length(prediction) < 70)
%   prediction = [prediction; zeros(70-length(prediction), 1)];
% end
hold on
