function [] = FeatureScoresVisualization(idx,scores,titleOfPlot,fontSize,titleFontSize,numOfFeatures,featureTable)

figureHandle = figure;
bar(scores(idx))
xlabel('Predictor rank',FontSize=fontSize)
ylabel('Predictor importance score',FontSize=fontSize)
ax = gca(figureHandle);
ax.XAxis.FontSize = fontSize - 5;
ax.XTick = 1:numOfFeatures;
ax.XTickLabel = featureTable.Properties.VariableNames(idx);
xtickangle(25)
title(titleOfPlot,FontSize=titleFontSize)
enlarge()