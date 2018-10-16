%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Facial Expression LSH-PCA-LDA
% Version : 2.0
% Date : 01.2.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
clc;

while (1==1)
    choice=menu('Facial Expression LSH-PCA-LDA ',...
                'Face detection and cropping',...
                'Facial segments',...
                'LSH image pruning ',...
                'Edge extraction',...
                'Dimension reduction',...
                'Feature point extraction',...
                'Minimal Feature points',...
                'Feature points movement analysis',...
                'Classification with SVM',...
                'Emotion Recognition',... 
                'Exit');
    if (choice ==1)
    cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\Frame capturing';
    facialFramesExtraction;
    end
        
    if (choice == 2) 
        cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\Facial Segments';
        facialSegments;
    end    
    
    if (choice == 3)
        cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\Facial-Landmarks';
        facialPoints;
    end
    
    if (choice == 4)
        
    end
     
    if (choice == 5)
        cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\Gabor Filter'
       GFT;
    end
    if (choice == 6)
   
    end
    if (choice == 7)

    end
     if (choice == 8)

     end
     if (choice == 9)

     end
     if (choice == 10)
     end
     if (choice == 11)
        clear choice choice2
        return;
    end 
end