%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Symmetry Based Analysis of Facial Expressions Partially Occluded Due to Head Motions
% Version : 1.0
% Date : 01.2.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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