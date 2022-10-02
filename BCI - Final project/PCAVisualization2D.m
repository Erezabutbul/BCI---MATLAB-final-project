function [] = PCAVisualization2D(pc1,pc2,rightHandLabeled,leftHandLabeled,titleForPlot,fontSize,titleFontSize)

figure
scatter(pc1(rightHandLabeled),pc2(rightHandLabeled),'b');
hold on
scatter(pc1(leftHandLabeled),pc2(leftHandLabeled),'r');
legend("Right Hand","Left Hand",'FontSize',fontSize)
title(titleForPlot,'FontSize', titleFontSize, 'FontName', 'David')
xlabel("PC1", 'FontSize',fontSize, 'FontName', 'David')
ylabel("PC2", 'FontSize',fontSize, 'FontName', 'David')
axis equal
enlarge()