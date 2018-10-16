%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Symmetry Based Analysis of Facial Expressions Partially Occluded Due to Head Motions
% Version : 1.0
% Date : 01.2.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    pointTracker = vision.PointTracker('MaxBidirectionalError', 3);

    faceDetector = vision.CascadeObjectDetector;
       
    % Detect eyes
    eyeDetector = vision.CascadeObjectDetector('eyepairsmall');
    bboxes1 = step(eyeDetector,videoFrame);
    videoOut1 = insertObjectAnnotation(videoFrame,'rectangle',bboxes1,'Eye');
    figure, imshow(videoOut1), title('Detected eye');
    EC= imcrop(videoOut1,bboxes1);
    hold on; 
   
    % Detect mouth
    mouthDetector = vision.CascadeObjectDetector('Mouth');
    bboxes4 = step(mouthDetector,videoFrame);
    videoOut4 = insertObjectAnnotation(videoFrame,'rectangle',bboxes4,'Mouth');
    figure, imshow(videoOut4), title('Detected Mouth');
    hold on; 
        