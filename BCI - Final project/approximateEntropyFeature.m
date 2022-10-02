function [approximateEntropyC3,approximateEntropyC4] = approximateEntropyFeature(rightHandLabeled,leftHandLabeled,startTimeApproxEntropyC3,startTimeApproxEntropyC4,endTimeApproxEntropyC3,endTimeApproxEntropyC4,C3,C4,numberOfTrials,dataBase)


ResultC4 = zeros(1,numberOfTrials);
ResultC3 = zeros(1,numberOfTrials);

for i = 1:numberOfTrials
    if(size(dataBase,2) ~= 1)
        ResultC3(i) = mean(approximateEntropy(dataBase(i, startTimeApproxEntropyC3:endTimeApproxEntropyC3, C3)));
        ResultC4(i) = mean(approximateEntropy(dataBase(i, startTimeApproxEntropyC4:endTimeApproxEntropyC4, C4)));
    else
        ResultC3(i) = mean(approximateEntropy(dataBase.data(i, startTimeApproxEntropyC3:endTimeApproxEntropyC3, C3)));
        ResultC4(i) = mean(approximateEntropy(dataBase.data(i, startTimeApproxEntropyC4:endTimeApproxEntropyC4, C4)));
    end
end
approximateEntropyC3 = ResultC3;
approximateEntropyC4 = ResultC4;









%% in case the user wants to see the feature's histograms

% rC3 = approximateEntropy(dataBase.data(rightHandLabeled, :, C3));
% lC3 = approximateEntropy(dataBase.data(leftHandLabeled, :, C3));
% 
% rC4 = approximateEntropy(dataBase.data(rightHandLabeled, :, C4));
% lC4 = approximateEntropy(dataBase.data(leftHandLabeled, :, C4));
% 
% approximateEntropyC3 = [rC3,lC3];
% approximateEntropyC4 = [rC4,lC4];
% 
% for i = 1:64
%     rC3(i) = approximateEntropy(dataBase.data(rightHandLabeled(i), 500:700, C3));
%     lC3(i) = approximateEntropy(dataBase.data(leftHandLabeled(i), 500:700, C3));
%     
%     rC4(i) = approximateEntropy(dataBase.data(rightHandLabeled(i), 400:750, C4));
%     lC4(i) = approximateEntropy(dataBase.data(leftHandLabeled(i),400:750, C4));
% 
% end
% approximateEntropyC3 = [rC3,lC3];
% approximateEntropyC4 = [rC4,lC4];

% 
% figure
% title("C4 histogram")
% histogram(rC4)
% hold on
% histogram(lC4)
% legend("RightC4","LeftC4")
% 
% 
% figure
% title("C3 title")
% histogram(rC3)
% hold on
% histogram(lC3)
% legend("RightC3","LeftC3")



