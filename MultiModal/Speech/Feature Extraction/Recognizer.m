 close all; clc; clear all;
funcpathname = 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 6\Speech\Feature Extraction';
[waves,fs,num] = readwave('D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 6\Speech\Data\Train', funcpathname);%% Make prediction
 
feature = zeros(1,5);
FrameLen = floor(20*(fs/1000));%Frame 20ms
FrameInc = floor(10*(fs/1000));%??10ms
%Hamming
W = hamming(FrameLen);
trainData=[];
testData=[];
for i=1:length (waves)
%Get the voiced part using End-Point Detection
wavesc=waves.x;
[y, feature(1,1),feature(1,2),feature(1,3),feature(1,4)] = vad(wavesc,fs,W,FrameInc);
[feature(1,5)] = getpitch(y, fs);
trainData=[trainData; feature];
% [feature(1,6),feature(1,7)] = formants(y,fs,W(1),FrameInc);
end    


[wavest,fst,numt] = readwave('D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 6\Speech\Data\Test', funcpathname);%% Make prediction
featuret = zeros(1,5);
FrameLent = floor(20*(fst/1000));%Frame 20ms
FrameInct = floor(10*(fst/1000));%??10ms
%Hamming
Wt = hamming(FrameLent);
%Get the voiced part using End-Point Detection
for i=1:length (wavest)
wavestc=wavest.x;
[yt, featuret(1,1),featuret(1,2),featuret(1,3),featuret(1,4)] = vad(wavestc,fst,Wt,FrameInct);
[featuret(1,5)] = getpitch(yt, fst);
testData=[testData; featuret];
end
 
   tr_labels=[6,5,5,7,2,3,4,1,1,1,1];
     te_lables=[5,1];
[svm_modeln,Correctness2] = svm_classifier(trainData, tr_labels');
save('trainedModeln', 'svm_modeln');


prediction = predict(svm_modeln, testData);

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




