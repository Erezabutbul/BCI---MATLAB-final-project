function [featuresMatrix] = featureExtractor(typeOfClassifier,numberOfTrials, ...
    numOfFeatures,starTimeVARC3,starTimeVARC4,startTimeFreq18,samplingRate, ...
    totalTrialTime,startTimeFreq10,endTimefreq10C4, ...
    startTimeHighCloud,endTimeHighCloud, ...
    startTimeSpectralEntropy, ...
    startTimeApproxEntropyC3,startTimeApproxEntropyC4, ...
    endTimeApproxEntropyC3,endTimeApproxEntropyC4, ...
    startTimeImagination,startTimePSfeature, ...
    nOverLapPwelch,sizeOfPwelchVec,...
    sizeOfWindowPwelch,C3,C4,dataBase)
% doc
% Extract features from the data
% dependent on the typeOfClassifier: 
% compact - 3 features
% extended - 18 features
[freq18C3,freq18C4] = freq18(C3 ,C4 ,startTimeFreq18 ,totalTrialTime,samplingRate ,dataBase);
[VARC3,VARC4] = VarianceFeature(C3 ,C4 ,starTimeVARC3 ,starTimeVARC4 ,totalTrialTime,dataBase);


%% COMPACT VERSION

if (strcmp(typeOfClassifier,"compact"))
    featuresMatrix = zeros(numberOfTrials, numOfFeatures);
    featuresMatrix(:, 1) = freq18C4;
    featuresMatrix(:, 2) = VARC3;
    featuresMatrix(:, 3) = VARC4;

%% LARGE VERSION
else
    featuresMatrix = zeros(numberOfTrials, numOfFeatures);

    [highCloudC3,highCloudC4] = highCloud(0, 0,startTimeHighCloud,endTimeHighCloud,samplingRate,C3, C4,dataBase);
    [freq10C3,freq10C4] = freq10(0, 0, startTimeFreq10,totalTrialTime,endTimefreq10C4,samplingRate,C3, C4, dataBase);
    [SEC3,SEC4] = spectralEntropy(0,0 ,startTimeSpectralEntropy,totalTrialTime,samplingRate ,C3,C4,numberOfTrials,dataBase);
    [approximateEntropyC3,approximateEntropyC4] = approximateEntropyFeature(0,0,startTimeApproxEntropyC3,startTimeApproxEntropyC4,endTimeApproxEntropyC3,endTimeApproxEntropyC4,C3,C4,numberOfTrials,dataBase);
    [PSstdC3,PSstdC4,PSmeanC3,PSmeanC4] = PSfeature(0,0,startTimeImagination,totalTrialTime,C3,C4,sizeOfWindowPwelch,nOverLapPwelch,numberOfTrials,startTimePSfeature,samplingRate,sizeOfPwelchVec,dataBase);
    [wvdC3,wvdC4] = wvdFeature(C3 ,C4 ,startTimeFreq18 ,totalTrialTime ,samplingRate ,numberOfTrials ,dataBase);

    featuresMatrix(:, 1) = VARC3;
    featuresMatrix(:, 2) = VARC4;
    featuresMatrix(:, 3) = freq18C3;
    featuresMatrix(:, 4) = freq18C4;
    featuresMatrix(:, 5) = highCloudC3;
    featuresMatrix(:, 6) = highCloudC4;
    featuresMatrix(:, 7) = freq10C3;
    featuresMatrix(:, 8) = freq10C4;
    featuresMatrix(:, 9) = SEC3;
    featuresMatrix(:, 10) = SEC4;
    featuresMatrix(:, 11) = approximateEntropyC3;
    featuresMatrix(:, 12) = approximateEntropyC4;
    featuresMatrix(:, 13) = PSstdC3;
    featuresMatrix(:, 14) = PSstdC4;
    featuresMatrix(:, 15) = PSmeanC3;
    featuresMatrix(:, 16) = PSmeanC4;
    featuresMatrix(:, 17) = wvdC3;
    featuresMatrix(:, 18) = wvdC4;
end