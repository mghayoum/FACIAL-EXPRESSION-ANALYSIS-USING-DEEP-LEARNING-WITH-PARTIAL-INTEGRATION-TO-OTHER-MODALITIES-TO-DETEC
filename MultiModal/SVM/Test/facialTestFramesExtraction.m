%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Symmetry Based Analysis of Facial Expressions Partially Occluded Due to Head Motions
% Version : 1.0
% Date : 01.2.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Get a frame for frame-size information
% Start up the video.
faceDetector = vision.CascadeObjectDetector();

% Capture one frame to get its size.
video = videoinput('winvideo'); 
video.ReturnedColorspace = 'rgb';
figure(1)
start(video);
for i=1:2
videoResolution = get(video, 'VideoResolution');
imgWidth  = videoResolution(1);
imgHeight = videoResolution(2);
numBands  = get(video, 'NumberOfBands');
gui = image(zeros(imgHeight, imgWidth, numBands));
preview(video, gui);
videoFrame = getsnapshot(video);
imwrite(videoFrame,['D:' int2str(i), '.jpg']);
frameSize = size(videoFrame);

% Clean up.

% release(pointTracker);
end
 clear cam;