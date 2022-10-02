function [StotalR3 ,StotalR4 ,StotalL3 ,StotalL4] = generateSPEC(rightHandLebeled, ...
    leftHandLebeled,C4,C3,nTrialsRight,nTrialsLeft,sizeOfWindowSPEC,nOverLapSPEC,samplingRate,f,dataBase)

% doc
% Extracting and presenting spectogram for each class (L, R) 
% and each electrode (C4,C3)
% the calculation is done for each trial and being avg at the end

[StotalR3 ] = specHelper(rightHandLebeled,C3,sizeOfWindowSPEC,nOverLapSPEC,nTrialsRight,'all',samplingRate,f,dataBase);
[StotalR4 ] = specHelper(rightHandLebeled,C4,sizeOfWindowSPEC,nOverLapSPEC,nTrialsRight,'all',samplingRate,f,dataBase);
[StotalL3 ] = specHelper(leftHandLebeled,C3,sizeOfWindowSPEC,nOverLapSPEC,nTrialsLeft,'all',samplingRate,f,dataBase);
[StotalL4 ] = specHelper(leftHandLebeled,C4,sizeOfWindowSPEC,nOverLapSPEC,nTrialsLeft,'all',samplingRate,f,dataBase);


