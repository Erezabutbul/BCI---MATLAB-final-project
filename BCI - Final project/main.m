
clear all,close all,clc

load("motor_imagery_train_data.mat")

% In our experement the data dimensions are:
% first dimension : number of trials
% second dimension : time samples: 6 sec of trial (128 Hz)
% third dimension : the channels
dataBase = P_C_S;


%@ parameters

% Data related
C3 = 1;
C4 = 2;
typeHandLabeled = 3;
samplingRate = dataBase.samplingfrequency; % sampling rate of data
totalTrialTime = size(dataBase.data,2); % total time of each trial
startTimeImagination = 384; % the time that the subject starts motor imagination
numberOfTrials = size(dataBase.data,1);
numberOfFreq = 129;
SecondDuration = 128;

% Extracting ideces of activity in each class
rightHandLabeled = find(dataBase.attribute(4,:) > 0); % given indeces labed as right
leftHandLabeled = find(dataBase.attribute(3,:) > 0); % given indeces labed as left
nTrialsRight = size(rightHandLabeled,2); % In our experement 64
nTrialsLeft = size(leftHandLabeled,2); % In our experement 64

% classifier related parameters
nOfTestsForModel = 30;
accuraciesOfModel = zeros(1,nOfTestsForModel);
stdsOfModel = zeros(1,nOfTestsForModel);
accuraciesOfOTHERModel = zeros(1,nOfTestsForModel);
f = (1:0.1:40);
% typeOfClassifier doc:
% you can spot the difference between choosing 2 different classifiers
% made by choosing 2 different features from the data:
% if typeOfClassifier = extended; 
% the classifier will extract 16 different featurs
% else typeOfClassifier = compact;(by default) 
% the classifier will extract the best 3 featurs
typeOfClassifier = "extended";
k = 10; % K-Fold value - choose 10 and above to have validated values


% Pwelch parameters
nWindows = 12;
sizeOfWindowPwelch = 150;
sizeOfPwelchVec = 391;
nOverLapPwelch = 70;

% Spectogram parameters
sizeOfWindowSPEC = 128;
nOverLapSPEC = 110;

% Times for features
starTimeVARC3 = 512;
starTimeVARC4 = 555;
startTimeFreq18 = 660;
startTimeFreq10 = 652;
startTimeHighCloud = 630;
startTimePSfeature = 590;
startTimeSpectralEntropy = 256;
startTimeApproxEntropyC3 = 500;
startTimeApproxEntropyC4 = 400;
endTimeApproxEntropyC3 = 700;
endTimeApproxEntropyC4 = 750;
endTimefreq10C4 = 740;
endTimeHighCloud = 730;


% Font
fontSize = 20;
titleFontSize = fontSize * 2;

% plot options
nOfsamplesToShow = 20; % first plot number of subplots
handToShow = "right"; % to present left hand representation on PART 1
pcaZscore = "on"; % 


if(strcmp(typeOfClassifier,"extended"))
    numOfFeatures = 18;
else % compact model
    numOfFeatures = 3;
end


% randomazing 20 trials that were labeled as right hand
random_vec_right = randi([1 nTrialsRight],1,nOfsamplesToShow,'uint8');
random_vec_left = randi([1 nTrialsRight],1,nOfsamplesToShow,'uint8');
trail_right_toPlot = rightHandLabeled(random_vec_right);
trail_left_toPlot = leftHandLabeled(random_vec_left);

% ploting 20 subplot for each class
% the parameter: handToShow
% will determain which hand will be shown
% if(strcmp(handToShow,"right"))
%     plot_visualization(trail_right_toPlot,C3,C4,dataBase,"Right hand motor imagination - C3,C4",fontSize,titleFontSize)
% else
%     plot_visualization(trail_left_toPlot,C3,C4,dataBase,"Left hand motor imagination - C3,C4",fontSize,titleFontSize)
% end

%% Generate power spectra for each trail separately

% [PSRC3,PSRC4,PSLC3,PSLC4] = generatePwelch(rightHandLabeled,leftHandLabeled, ...
%     startTimeImagination,totalTrialTime,C3,C4,samplingRate, ...
%     sizeOfWindowPwelch,nOverLapPwelch,nTrialsRight,nTrialsLeft,sizeOfPwelchVec,f,fontSize,titleFontSize,dataBase);
% 
% 
% %% Calculating the spectograms for all trials
% [StotalR3 ,StotalR4 ,StotalL3 ,StotalL4] = generateSPEC(rightHandLabeled, ...
%     leftHandLabeled,C4,C3,nTrialsRight,nTrialsLeft,sizeOfWindowSPEC,nOverLapSPEC,samplingRate,f,dataBase);
% 
% % Spectrogram visualization
% SpectrogramVisualization(StotalR3,StotalL3,StotalR4,StotalL4,nTrialsRight,nTrialsLeft,fontSize,titleFontSize);







%% feature extraction - COMPACT VERSION


% extended featuresMatrix - 16 predictors
% compact featuresMatrix - 3 predictors
featuresMatrix = featureExtractor(typeOfClassifier,numberOfTrials, ...
    numOfFeatures,starTimeVARC3,starTimeVARC4,startTimeFreq18,samplingRate, ...
    totalTrialTime,startTimeFreq10,endTimefreq10C4, ...
    startTimeHighCloud,endTimeHighCloud, ...
    startTimeSpectralEntropy, ...
    startTimeApproxEntropyC3,startTimeApproxEntropyC4, ...
    endTimeApproxEntropyC3,endTimeApproxEntropyC4, ...
    startTimeImagination,startTimePSfeature, ...
    nOverLapPwelch,sizeOfPwelchVec,...
    sizeOfWindowPwelch,C3,C4,dataBase);

% Normalazing score
featuresMatrixNormalized = zscore(featuresMatrix);

if(strcmp(typeOfClassifier,"extended"))
    featureTable = array2table(featuresMatrixNormalized,'VariableNames',{'VARC3','VARC4','freq18C3','freq18C4','highCloudC3','highCloudC4','freq10C3','freq10C4','SEC3','SEC4','approximateEntropyC3','approximateEntropyC4','PSstdC3','PSstdC4','PSmeanC3','PSmeanC4','wvdC3','wvdC4'});
else
    featureTable = array2table(featuresMatrixNormalized,'VariableNames',{'freq18C4','VARC3','VARC4'});
end


% indicationVec: labeled, trial(i) left labeled --> value(i) = 1
indicationVec = indicationvecINIT(numberOfTrials,typeHandLabeled, dataBase);

% adding the indication vec in order to use in classification learner
featureTable.indicate = indicationVec;

%% feature explanation


[idx,scores] = fscchi2(featureTable,indicationVec);
FeatureScoresVisualization(idx,scores,"fscchi2 Feature Scoring function",fontSize,titleFontSize,numOfFeatures,featureTable)


[idx2,scores2] = fscmrmr(featureTable,indicationVec);
FeatureScoresVisualization(idx2,scores2,"fscmrmr Feature Scoring function",fontSize,titleFontSize,numOfFeatures,featureTable)


%% dimensionality reduction on all the features:

[coeff,score,latent,tsquared,explained] = pca(featuresMatrix);

pc1 = score(:,1);
pc2 = score(:,2);
pc3 = score(:,3);

% PCAVisualization2D(pc1,pc2,rightHandLabeled,leftHandLabeled,'2D PCA',fontSize,titleFontSize)

if(strcmp(pcaZscore,"off"))      
    % 3D ploting of the PCA
%     PCAVisualization3D(pc1,pc2,pc3,rightHandLabeled,leftHandLabeled,'3D PCA',fontSize,titleFontSize)

else
    % % Zscore on PCA - for demonstrasion
    % % the first 2 dims have excectly the same information
    [coeff,score,latent,tsquared,explained] = pca(featuresMatrixNormalized);
    
    pc1 = score(:,1);
    pc2 = score(:,2);
    pc3 = score(:,3);     
    % 3D ploting of the PCA
%     PCAVisualization3D(pc1,pc2,pc3,rightHandLabeled,leftHandLabeled,'3D PCA Using zscore',fontSize,titleFontSize)

end
 
 %% Plot histogram of VARC3 , VARC4

% plotVarianceHistograms(rightHandLabeled,leftHandLabeled,starTimeVARC3,starTimeVARC4,totalTrialTime,fontSize,titleFontSize,C3,C4,dataBase)



%% predict using the model

load("motor_imagery_test_data.mat")
testData = data(:,:,1:2);
featuresMatrixOFTEST = featureExtractor("compact",size(testData,1) , ...
    numOfFeatures,starTimeVARC3,starTimeVARC4,startTimeFreq18,samplingRate, ...
    totalTrialTime,startTimeFreq10,endTimefreq10C4, ...
    startTimeHighCloud,endTimeHighCloud, ...
    startTimeSpectralEntropy, ...
    startTimeApproxEntropyC3,startTimeApproxEntropyC4, ...
    endTimeApproxEntropyC3,endTimeApproxEntropyC4, ...
    startTimeImagination,startTimePSfeature, ...
    nOverLapPwelch,sizeOfPwelchVec,...
    sizeOfWindowPwelch,C3,C4,testData);



featuresMatrixOFTEST = zscore(featuresMatrixOFTEST);


%% using other Model (BONUS)

for i = 1 : nOfTestsForModel

    classificationSVM = fitcsvm(...
        featureTable, ...
        indicationVec, ...
        'KernelFunction', 'linear', ...
        'PolynomialOrder', [], ...
        'KernelScale', 'auto', ...
        'BoxConstraint', 1, ...
        'Standardize', true, ...
        'ClassNames', [0; 1]);

    % Perform cross-validation
    partitionedModel = crossval(classificationSVM, 'KFold', 16);
    
    % Compute validation predictions
    [validationPredictions, validationScores] = kfoldPredict(partitionedModel);
    
    % Compute validation accuracy
    validationAccuracy = 1 - kfoldLoss(partitionedModel, 'LossFun', 'ClassifError');
    % Save the accuracy of this model 
    accuraciesOfOTHERModel(i) = validationAccuracy;

end

% what is the % of accuracy of the model
disp("The STD of the SVM model: " + std(accuraciesOfOTHERModel))
disp("The MEAN of the SVM model: " + mean(accuraciesOfOTHERModel))
resultOfSVMModel = predict(classificationSVM,featuresMatrixOFTEST);


    
%% classify
% K-Fold cross validation testing the classifier

for i = 1:nOfTestsForModel
    trialsTestedSigned = zeros(numberOfTrials, 1);
    test_set_size = floor(numberOfTrials / k);
    [meanOfAccuracy,stdOfAccuracy] = ...
        kFoldCrossValUP2DATE(featuresMatrixNormalized, numberOfTrials, test_set_size,...
            indicationVec);
    accuraciesOfModel(i) = meanOfAccuracy;
    stdsOfModel(i) = stdOfAccuracy;
end
disp("The STD of the classifier: "+ mean(stdsOfModel))
disp("The MEAN of the classifier: "+ mean(accuraciesOfModel))



%% testing the classifier
finalTestOutput = classify(featuresMatrixOFTEST, featuresMatrixNormalized, indicationVec);

% showing the differences between SVM and our classifier 
disp("number of agreed between models:   " + size(find(finalTestOutput == resultOfSVMModel),1))

