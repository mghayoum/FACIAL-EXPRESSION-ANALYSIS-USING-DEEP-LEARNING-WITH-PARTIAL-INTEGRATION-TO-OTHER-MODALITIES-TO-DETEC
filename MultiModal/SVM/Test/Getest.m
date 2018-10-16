% facialFramesExtraction;
imagesSt=[];
% cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\Database\jaffe\Sadness\Test'
imagefiles = dir('*.jpg');      
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   currentimage = imread(currentfilename);
   currentimage = imresize(currentimage,[256 256]);
   imagesSt= [imagesSt ;currentimage];
end
testdata=imagesSt(:,:,1);