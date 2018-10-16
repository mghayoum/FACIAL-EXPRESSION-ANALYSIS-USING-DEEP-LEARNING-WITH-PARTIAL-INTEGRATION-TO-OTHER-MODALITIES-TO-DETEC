%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Symmetry Based Analysis of Facial Expressions Partially Occluded Due to Head Motions
% Version : 1.0
% Date : 01.2.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% load databses
cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\Database\SVM';
dataTrainGene;
% cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\Frame capturing\Train'
% Getrain;
train_x=traindata';
% train_x=reshape(train_x,65536,140);
train_y=trainlable;
tr_labels=train_y';
cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\Database\SVM';
dataTestGene;
% cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\Frame capturing\Test'
% Getest;
test_x=testdata';
% test_x=reshape(test_x,65536,70);
test_y=testlable;
cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\SVM';
% normalization
train_x = double(train_x')/255;
test_x = double(test_x)/255;
train_y = (double(train_y))';
test_y = double(test_y);



%% Preprocessing the data

    inputs_train = train_x;
    inputs_test = test_x;
%     save('gabor_features', 'inputs_train', 'inputs_test', 'tr_labels');



%% Make prediction
     
     [svm_modeln,Correctness2] = svm_classifier(inputs_train, tr_labels);
     save('trainedModeln', 'svm_modeln');

prediction = predict(svm_modeln, inputs_test');

%% Print results

% Fill in the test labels with 0 if necessary
% if (length(prediction) < 70)
%   prediction = [prediction; zeros(70-length(prediction), 1)];
% end
sa=0;su=0;ha=0;di=0;fe=0;an=0;ne=0;
for i=1:length(prediction)
    if(prediction(i)==1)
        an=an+1;
    elseif(prediction(i)==2)
        ha=ha+1;
    elseif(prediction(i)==3)
        fe=fe+1;
    elseif(prediction(i)==4)
        di=di+1;
    elseif(prediction(i)==5)
        sa=sa+1;
    elseif(prediction(i)==6)
        su=su+1;
    elseif(prediction(i)==7)
        ne=ne+1;
    end
end
    ou1=round((an/70)*100);
    fprintf('anger is %d   percentage.\n',ou1);
    ou2=round((ha/70)*100);
    fprintf('happiness is %d  percentage.\n',ou2);
    ou3=round((fe/70)*100);
    fprintf('fear is %d  percentage.\n',ou3);
    ou4=round((di/70)*100);
    fprintf('disgust is %d  percentage.\n',ou4);
    ou5=round((sa/70)*100);
    fprintf('sadness is %d  percentage.\n',ou5);
    ou6=round((su/70)*100);
    fprintf('surprise is %d  percentage.\n',ou6);
    ou7=round((ne/70)*100);
    fprintf('neutral is %d  percentage.\n',ou7);
% Save results to file
fid = fopen('svm_prediction.csv', 'w');
fprintf(fid,'Id,Prediction\n');
for i=1:length(prediction)
    fprintf(fid, '%d,%d\n', i, prediction(i));
end
fclose(fid);