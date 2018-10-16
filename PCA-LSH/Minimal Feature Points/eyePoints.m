%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Symmetry Based Analysis of Facial Expressions Partially Occluded Due to Head Motions
% Version : 1.0
% Date : 01.2.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Get a frame for frame-size information
% Start up the video.
% Create the face detector object.
faceDetector = vision.CascadeObjectDetector();

% Create the point tracker object.
pointTracker = vision.PointTracker('MaxBidirectionalError', 3);

% Capture one frame to get its size.
% video = videoinput('winvideo'); 
video.ReturnedColorspace = 'rgb';
figure(1)
% start(video);

videoResolution = get(video, 'VideoResolution');
imgWidth  = videoResolution(1);
imgHeight = videoResolution(2);
numBands  = get(video, 'NumberOfBands');
gui = image(zeros(imgHeight, imgWidth, numBands));
preview(video, gui);
videoFrame = getsnapshot(video);
% imwrite(videoFrame,['D:' int2str(i), '.jpg']);
frameSize = size(videoFrame);

% Create the video player object.

% Get the next frame.
videoFrame = getsnapshot(video);
videoFrameGray = rgb2gray(videoFrame);
% frameCount = frameCount + 1;
eyeDetector = vision.CascadeObjectDetector('eyepairsmall');
bboxes1 = step(eyeDetector,videoFrame);
% videoOut1 = insertObjectAnnotation(videoFrame,'rectangle',bboxes1,'Eye');

EC= imcrop(videoFrame,bboxes1);

    if ~isempty(bboxes1)
            % Find corner points inside the detected region.
            points = detectMinEigenFeatures(videoFrameGray, 'ROI', bboxes1(1, :));

            % Re-initialize the point tracker.
            xyPoints = points.Location;
            numPts = size(xyPoints,1);
            release(pointTracker);
            initialize(pointTracker, xyPoints, videoFrameGray);

            % Save a copy of the points.
            oldPoints = xyPoints;
         
            bboxPoints = bbox2points(bboxes1(1, :));

            % format required by insertShape.
            bboxPolygon = reshape(bboxPoints', 1, []);

            % Display a bounding box around the detected face.
%             videoFrame = insertShape(videoFrame, 'Polygon', bboxPolygon, 'LineWidth', 1);
              xe=bboxes1(:,1);
              ye=bboxes1(:,2);
              we=bboxes1(:,3);
              he=bboxes1(:,4);
              AE=[xe+(3*we/4),ye];
              BE=[xe+(3*we/5),ye+(he/2)];
              CE=[xe+(3*we/4),ye+he];
              DE=[xe+we,ye+(he/2)];
              EE=[AE ;BE ;CE ;DE];
              de1=[AE; CE];
              dise1 = pdist(de1,'euclidean');
              de2=[BE;DE];
              dise2 = pdist(de2,'euclidean');
            % Display detected corners.
            videoOut1 = insertMarker(videoFrame, EE, '+', 'Color', 'red');
            figure, plot(AE,CE), plot(BE,DE), imshow(videoOut1), title('Detected eye');
%              rectangle('Position',bboxPolygon(:,1:4))
else
        % Tracking mode.
        [xyPoints, isFound] = step(pointTracker, videoFrameGray);
        visiblePoints = xyPoints(isFound, :);
        oldInliers = oldPoints(isFound, :);
        numPts = size(visiblePoints, 1);
            % Estimate the geometric transformation between the old points
            % and the new points.
            [xform, oldInliers, visiblePoints] = estimateGeometricTransform(...
                oldInliers, visiblePoints, 'similarity', 'MaxDistance', 4);

            % Apply the transformation to the bounding box.
            bboxPoints = transformPointsForward(xform, bboxPoints);

            % Convert the box corners into the [x1 y1 x2 y2 x3 y3 x4 y4]
            % format required by insertShape.
            bboxPolygon = reshape(bboxPoints', 1, []);

            % Display a bounding box around the face being tracked.
            videoOut1 = insertShape(videoOut1, 'Polygon', bboxPolygon, 'LineWidth', 3);

            % Display tracked points.
             videoOut1 = insertMarker(videoOut1, visiblePoints, '+', 'Color', 'white');
            figure, imshow(videoOut1), title('Detected eye');
            % Reset the points.
            oldPoints = visiblePoints;
            setPoints(pointTracker, oldPoints);
        end