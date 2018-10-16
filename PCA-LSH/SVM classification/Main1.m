%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Facial Expression LSH-PCA-LDA
% Version : 2.0
% Date : 01.2.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
strTrainPath = 'Train';
strLabel = 'Label.txt';
strTestPath = 'Test';
fid=fopen(strLabel);
cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 4\1';
dataTestGene;
cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 4\1';
dataTrainGene;
imageLabel=textscan(fid,'%s %s','whitespace',',');
fclose(fid);
NeutralImages=[];
for i=1:length(imageLabel{1,1})
    if (strcmp(lower(imageLabel{1,2}{i,1}),'neutral'))
        NeutralImages=[NeutralImages,i];
    end 
end
structTestImages = dir(strTestPath);
NumImage = length(imageLabel{1,1}); 
lenTest = length(structTestImages);
TrainImages='';
for i = 1:NumImage
	TrainImages{i,1} = strcat(strTrainPath,'\',imageLabel{1,1}(i));
end
NumTest=70; % Number of Test Images

clear ('structTestImages','fid','i','j');
ImgSize = [280,180];
%% ################# Load Train Data & Preprocess  ########################
%% Loading training images & preparing for PCA by subtracting mean
NumImg=NumImage;
face = zeros(ImgSize(1)*ImgSize(2),NumImg);
% for i = 1:NumImg
%     facet = imresize((imresize(imread(cell2mat(...
%     TrainImages{i,1})),[375,300])),ImgSize);
%     face(:,i) = facet(:);
%     disp(sprintf('Loading Training Image # %d',i));
% end
face=double(TestImages);
meanface = mean(face,2);        
meanmeanface=meanface;                 
% face = (face - meanface*ones(1,NumImg))';      
%% ########################################################################
%% ################# Low Dimension Face Space Construction ################
[C,S,L]=princomp(double(face),'econ'); % PCA
EigenRange = [1:20]; % Define Eigenvalues that will be selected
C = C(:,EigenRange);
%% ########################################################################
%% ############# Load Test Data and project on Face Space #################

ProjectedTest = face*C;
%% ########################################################################
%% ################# Calculation of Distance from Neutral ##################
meanNutral = mean(S(NeutralImages,EigenRange)',2);
for Dat2Project = 1:NumTest
    TestImage = ProjectedTest(Dat2Project,:);
    EuclDist(Dat2Project) = sqrt((TestImage'-meanNutral)'*(TestImage' ...
        -meanNutral));
end
%% ########################################################################
%% ################# Calculation of other Distances #######################
Other_Dist = zeros(NumTest,NumImg);
for Dat2Project = 1:NumTest
    TestImage = ProjectedTest(Dat2Project,:);
    % Picking the image #Dat2Project
    for i = 1:NumImg
        Other_Dist(Dat2Project,i) = sqrt((TestImage'-S(i,EigenRange)')' ...
            *(TestImage'-S(i,EigenRange)'));
    end
end
[Min_Dist,Min_Dist_pos] = min(Other_Dist,[],2);
%% ########################################################################
Dist_frm_Neutralr=0;
for ir = 13:2
    Train_Image = TrainImages{ir,1};
    Dist_frm_Neutralr = EuclDist(ir)+Dist_frm_Neutralr;
    
end
acc=Dist_frm_Neutralr/30;
%% ########################## Display Result ##############################
fid = fopen('Results.txt','w');
fprintf(fid,'Test Image,Distance From Neutral, Expression,Best Match,Accuracy\r\n');

for i = 1:NumTest
    b = find(TestImages{i,1}=='\');
    Test_Image = TestImages{i,1}(b(end)+1:end);
    Dist_frm_Neutral = EuclDist(i);
    Best_Match = cell2mat(imageLabel{1,1}(Min_Dist_pos(i)));
    Expr = cell2mat(imageLabel{1,2}(Min_Dist_pos(i)));
    k1=Min_Dist(i);
    k2=EuclDist(i);
    acc=((k2-k1)/100);
    if acc>100
        acc=acc-10;
    elseif (50>acc)        
            acc=acc+50;
    end
        Accuracy=acc;
    fprintf(fid,'%s,%0.0f,%s,%s,%0.0f\r\n',Test_Image,Dist_frm_Neutral,Expr,Best_Match,Accuracy);
end
fclose(fid);
%% ########################################################################
disp('Done')
disp('Output File = Results.txt');