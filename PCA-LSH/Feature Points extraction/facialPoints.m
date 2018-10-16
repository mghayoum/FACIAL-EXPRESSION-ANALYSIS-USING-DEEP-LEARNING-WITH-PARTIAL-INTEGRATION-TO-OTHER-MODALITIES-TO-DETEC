%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Symmetry Based Analysis of Facial Expressions Partially Occluded Due to Head Motions
% Version : 1.0
% Date : 01.2.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\Frame capturing';
% read the input image
I = imread('1.jpg');
I = imresize(I, [224,224]);
cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\Facial-Landmarks';
[imgFace, LeftEye, RightEye, Mouth,  LeftEyebrow,  RightEyebrow] = detectFacialRegions(I);

% config landmarks to Eyes and Mouth (4 and 5)
landconf = 4;

% config of landmarks Eyebrows (only 4)
landconfEyebrow = 4;

%% landmarks the eyes
imgLeftEye = (imgFace(LeftEye(1,2):LeftEye(1,2)+LeftEye(1,4),LeftEye(1,1):LeftEye(1,1)+LeftEye(1,3),:));
[landLeftEye, leftEyeCont] = eyesProcessing(imgLeftEye,landconf);

imgRightEye = (imgFace(RightEye(1,2):RightEye(1,2)+RightEye(1,4),RightEye(1,1):RightEye(1,1)+RightEye(1,3),:));
[landRightEye, rightEyeCont] = eyesProcessing(imgRightEye,landconf);

% landmarks the mouth
imgMouth = (imgFace(Mouth(1,2):Mouth(1,2)+Mouth(1,4),Mouth(1,1):Mouth(1,1)+Mouth(1,3),:));
[landMouth, MouthCont] = mouthProcessing(imgMouth,landconf);

% landmarks the nose
% imgNose = (imgFace(Nose(1,2):Nose(1,2)+Nose(1,4),Nose(1,1):Nose(1,1)+Nose(1,3),:));
% [landNose, NoseCont] = noseProcessing(imgNose,landconf);


% landmarks the eyebrows
imgLeftEyebrow = (imgFace(LeftEyebrow(1,2):LeftEyebrow(1,2)+LeftEyebrow(1,4),LeftEyebrow(1,1):LeftEyebrow(1,1)+LeftEyebrow(1,3),:));
[landLeftEyebrow, leftEyebrowCont] = eyebrowsProcessing(imgLeftEyebrow,landconfEyebrow);

imgRightEyebrow = (imgFace(RightEyebrow(1,2):RightEyebrow(1,2)+RightEyebrow(1,4),RightEyebrow(1,1):RightEyebrow(1,1)+RightEyebrow(1,3),:));
[landRightEyebrow, RightEyebrowCont] = eyebrowsProcessing(imgRightEyebrow,landconfEyebrow);

%% shows (eyes, mouth and eyebrows)

imshow(imgFace,'InitialMagnification',50); hold on;
showsLandmarks(landLeftEye,leftEyeCont,LeftEye,landconf);
showsLandmarks(landRightEye,rightEyeCont,RightEye,landconf);
showsLandmarks(landMouth,MouthCont,Mouth,landconf);
showsLandmarks(landLeftEyebrow,leftEyebrowCont,LeftEyebrow,landconfEyebrow);
showsLandmarks(landRightEyebrow,RightEyebrowCont,RightEyebrow,landconfEyebrow);
% showsLandmarks(landNose,NoseCont,Nose,landconf);