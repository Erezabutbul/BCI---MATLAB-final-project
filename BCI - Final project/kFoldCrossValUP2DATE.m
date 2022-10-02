function [meanOfAccuracy,stdOfAccuracy] = ...
    kFoldCrossValUP2DATE(featuresMatrix, numberOfTrials, test_set_size,...
        indicationVec)

    % doc
    % preform k-Fold Cross Validation on a model
    % make sure you use k >= 10

    accuraciesOfModel = zeros(1,floor(numberOfTrials/test_set_size));
    randVec = randperm(numberOfTrials);
    j = 1;
    for i = 1:test_set_size:numberOfTrials
        if( i+test_set_size <= numberOfTrials)
            testIndeces = randVec(i:i+test_set_size-1);
            trainIndeces = setdiff(randVec,randVec(i:i+test_set_size-1),'stable');
            classifyOutput = classify(featuresMatrix(testIndeces,:),featuresMatrix(trainIndeces,:),indicationVec(trainIndeces));
            accuracy = calculateAccuracy(indicationVec, testIndeces, classifyOutput);
            accuraciesOfModel(j) = accuracy;
            j = j+1;
        end
    end

stdOfAccuracy = std(accuraciesOfModel);
meanOfAccuracy = mean(accuraciesOfModel);


