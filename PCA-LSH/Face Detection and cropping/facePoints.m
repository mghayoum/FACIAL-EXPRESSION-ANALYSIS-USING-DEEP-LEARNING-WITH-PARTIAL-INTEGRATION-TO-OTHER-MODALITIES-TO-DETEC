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
start(video);

videoResolution = get(video, 'VideoResolution');
imgWidth  = videoResolution(1);
imgHeight = videoResolution(2);
numBands  = get(video, 'NumberOfBands');
gui = image(zeros(imgHeight, imgWidth, numBands));
preview(video, gui);
videoFrame = getsnapshot(video);
imwrite(videoFrame,['D:' int2str(i), '.jpg']);
frameSize = size(videoFrame);

% Create the video player object.
videoPlayer = vision.VideoPlayer('Position', [100 100 [frameSize(2), frameSize(1)]+30]);
    % Get the next frame.
    videoFrame = getsnapshot(video);
    videoFrameGray = rgb2gray(videoFrame);
%     frameCount = frameCount + 1;
faceDetector = vision.CascadeObjectDetector;
    bbox = step(faceDetector, videoFrame);
%     videoOut = insertObjectAnnotation(videoFrame,'rectangle',bbox,'Face');
    figure, imshow(videoFrame), title('Detected face');
if ~isempty(bbox)
            % Find corner points inside the detected region.
            points = detectMinEigenFeatures(videoFrameGray, 'ROI', bbox(1, :));

            % Re-initialize the point tracker.
            xyPoints = points.Location;
            numPts = size(xyPoints,1);
            release(pointTracker);
            initialize(pointTracker, xyPoints, videoFrameGray);

            % Save a copy of the points.
            oldPoints = xyPoints;
         
            bboxPoints = bbox2points(bbox(1, :));

            % format required by insertShape.
            bboxPolygon = reshape(bboxPoints', 1, []);

            % Display a bounding box around the detected face.
            videoFrame = insertShape(videoFrame, 'Polygon', bboxPolygon, 'LineWidth', 3);
              x=bbox(:,1);
              y=bbox(:,2);
              w=bbox(:,3);
              h=bbox(:,4);
              A=[x+(w/2),y];
              B=[x,y+(h/2)];
              C=[x+(w/2),y+h];
              D=[x+w,y+(h/2)];
              E=[A ;B ;C ;D];
            % Display detected corners.
            videoFrame = insertMarker(videoFrame, E, '+', 'Color', 'red');
            figure, imshow(videoFrame), title('Detected face');
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
            videoFrame = insertShape(videoFrame, 'Polygon', bboxPolygon, 'LineWidth', 3);

            % Display tracked points.
            videoFrame = insertMarker(videoFrame, visiblePoints, '+', 'Color', 'white');

            % Reset the points.
            oldPoints = visiblePoints;
            setPoints(pointTracker, oldPoints);
end