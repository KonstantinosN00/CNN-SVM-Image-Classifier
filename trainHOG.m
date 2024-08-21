clc;
clear;


trainIm = loadMNISTImages("data/train-images.idx3-ubyte");
trainLab= loadMNISTLabels("data/train-labels.idx1-ubyte");
testIm = loadMNISTImages("data/t10k-images.idx3-ubyte");
testLab= loadMNISTLabels("data/t10k-labels.idx1-ubyte");
trainNum = size(trainIm,4);


% HOG features of training data
hogFeatures = zeros(trainNum,324);
for i = 1:trainNum
    img = trainIm(:,:,:,i);
    hogFeature = extractHOGFeatures(img,CellSize = [7 7],BlockSize= [2 2]);
    hogFeatures(i,:) = hogFeature;
end
disp("HOG features of trainIms extracted");

% SVM training
svmClassifier = fitcecoc(hogFeatures, trainLab);
save("trainedSVM.mat", "svmClassifier");

