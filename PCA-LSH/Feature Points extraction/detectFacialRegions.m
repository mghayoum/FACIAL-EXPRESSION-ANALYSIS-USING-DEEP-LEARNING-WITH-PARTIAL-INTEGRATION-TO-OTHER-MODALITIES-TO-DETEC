%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Symmetry Based Analysis of Facial Expressions Partially Occluded Due to Head Motions
% Version : 1.0
% Date : 01.2.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function  [imgFace, LeftEye, RightEye, Mouth,  LeftEyebrow,  RightEyebrow] = detectFacialRegions(I)
%  This function is to find the facial regions (eyes, mouth and eyebrows)


%To detect Face
 FDetect = vision.CascadeObjectDetector;
 Face = step(FDetect,I);
 imgFace = (I(Face(1,2):Face(1,2)+Face(1,4),Face(1,1):Face(1,1)+Face(1,3),:));

 %To detect Left Eye
 EyeDetect = vision.CascadeObjectDetector('LeftEye');
 Eye=step(EyeDetect,imgFace);
 LeftEye  = Eye(1,:);
 
 %To detect Right Eye
 EyeDetect = vision.CascadeObjectDetector('RightEye');
 Eye=step(EyeDetect,imgFace);
 RightEye = Eye(2,:);
 
%To detect Mouth
 MouthDetect = vision.CascadeObjectDetector('Mouth','MergeThreshold',16);
 findMouth=step(MouthDetect,imgFace);
 orderMouth= sortrows(findMouth,2);
 posMouth = size(findMouth,1);
 Mouth = orderMouth(posMouth,:);

 %To detect Nose
% NoseDetect = vision.CascadeObjectDetector('Nose','MergeThreshold',16);
% findNose=step(NoseDetect,imgFace);
%  orderNose= sortrows(findNose,2);
%  posNose = size(findNose,1);
% Nose = orderNose(posNose,:);
 
 
%To detect Left Eyebrow
 LeftEyebrow   = LeftEye;
 LeftEyebrow(4) = (LeftEyebrow(4)/2)-4;
 LeftEyebrow(3) = LeftEyebrow(3);
 LeftEyebrow(4) = uint8(LeftEyebrow(4));
 LeftEyebrow(3) = uint8(LeftEyebrow(3));

%To detect Right Eyebrow
 RightEyebrow  = RightEye;
 RightEyebrow(4) =  (RightEyebrow(4)/2);
 RightEyebrow(3) = RightEyebrow(3);
 RightEyebrow(4) = uint8(RightEyebrow(4));
 RightEyebrow(3) = uint8(RightEyebrow(3));

end