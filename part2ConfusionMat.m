clc;
clear;

testIm = loadMNISTImages("data/t10k-images.idx3-ubyte");
testLab= loadMNISTLabels("data/t10k-labels.idx1-ubyte");
testNum = size(testIm,4);

file = load('trainedSVM.mat');
classifier = file.svmClassifier;


hogFeaturesTest = zeros(testNum,324);
for i = 1:testNum
    img = testIm(:,:,:,i);
    hogFeature = extractHOGFeatures(img,CellSize = [7 7],BlockSize= [2 2]);
    hogFeaturesTest(i,:) = hogFeature;
end
disp("HOG features of testIms extracted");

% Predictions
predLabels = predict(classifier, hogFeaturesTest);
accuracy = sum(predLabels == testLab) / numel(testLab);
disp("Accuracy: " + accuracy);

% Test specific images

%imgPos=10;
%figure;
%imshow(testIm(:,:,:,imgPos));
%disp("Predicted:" + (single(predLabels(imgPos))-1));
%disp("Actual value:" + (single(testLab(imgPos))-1));


confusionMatrix = calculateConfusionMatrix(testLab,predLabels);



