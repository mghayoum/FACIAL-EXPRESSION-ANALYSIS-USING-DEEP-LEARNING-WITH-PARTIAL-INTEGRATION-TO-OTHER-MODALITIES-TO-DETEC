%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Symmetry Based Analysis of Facial Expressions Partially Occluded Due to Head Motions
% Version : 1.0
% Date : 01.6.2017
% Author : Mehdi Ghayoumi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
clc;

while (1==1)
    choice=menu('Symmetry Based Analysis of Facial Expressions ',...
                'Video Frame Extraction',...
                'Facial Segments',...               
                'Parameterization',...
                'Gabor Feature',...
                'LSH',...
                'CNN',...
                'SVM',...
                'Weighted Fusion of Ranked Scores',...                
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
    cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\Ratios'
    ration;
    end
     
    if (choice == 4)
    cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\Gabor Filter'
    GFT;
    end
    
    if (choice == 5)
    cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\LSH'
    lsh;
    end
    
    if (choice == 6)
    cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\CNN\1'
    CNN_image;
    end
    
     if (choice == 7)
     cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\SVM'
     svm;
     end
     
     if (choice == 8)
     cd 'D:\MATLAB\R2016b\bin\Final Dissertation\Chapter 5\Results'
     Rocognotion2;
     end
     
     if (choice == 9)
     clear choice 
     return;
end 
end