function [] = PCAVisualization3D(pc1,pc2,pc3,rightHandLabeled,leftHandLabeled,titleForPlot,fontSize,titleFontSize)
    figure
    scatter3(pc1(rightHandLabeled),pc2(rightHandLabeled),pc3(rightHandLabeled),'blue')
    hold on
    scatter3(pc1(leftHandLabeled),pc2(leftHandLabeled),pc3(leftHandLabeled),'red')
    axis equal
    legend("Right Hand","Left Hand",'FontSize',fontSize)
    title(titleForPlot,'FontSize', titleFontSize, 'FontName', 'David')
    xlabel('1st Principal Component', 'FontSize',fontSize, 'FontName', 'David')
    ylabel('2nd Principal Component', 'FontSize',fontSize, 'FontName', 'David')
    zlabel('3rd Principal Component', 'FontSize',fontSize, 'FontName', 'David')
    enlarge()