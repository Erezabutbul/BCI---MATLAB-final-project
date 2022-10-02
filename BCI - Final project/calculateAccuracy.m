function [accuracy] = calculateAccuracy(handLabeledVec, indTestTrials, ...
    classifyOutput)

    % doc
    % calculate the accuracy of the current test
    testGroup = handLabeledVec(indTestTrials);
    correctPredictionsVec = find(testGroup == classifyOutput);
    correct = size(correctPredictionsVec, 1);
    accuracy = (correct / size(testGroup, 1));
