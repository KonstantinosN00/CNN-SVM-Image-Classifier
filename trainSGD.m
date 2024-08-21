clear;
clc;
testIm = loadMNISTImages("data/t10k-images.idx3-ubyte");
testLab= loadMNISTLabels("data/t10k-labels.idx1-ubyte");
trainIm = loadMNISTImages("data/train-images.idx3-ubyte");
trainLab= loadMNISTLabels("data/train-labels.idx1-ubyte");

% number of train images
numTrain = size(trainIm, 4);



layers = [
    imageInputLayer([28 28 1])
    convolution2dLayer(3, 6, Padding = 0, Stride = 1)
    reluLayer()
    batchNormalizationLayer()
    averagePooling2dLayer(2, Stride = 2)
    convolution2dLayer(3, 16, Padding = 0, Stride = 1)
    reluLayer()
    batchNormalizationLayer()
    averagePooling2dLayer(2, Stride = 2)
    fullyConnectedLayer(120)
    reluLayer()
    fullyConnectedLayer(84)
    reluLayer()
    fullyConnectedLayer(10)
    softmaxLayer()
    classificationLayer()
];


options = trainingOptions('sgdm', ... 
    Momentum = 0,...
    InitialLearnRate = 0.01,...
    LearnRateSchedule = 'piecewise',...
    LearnRateDropFactor = 0.2,...
    LearnRateDropPeriod = 10,...
    MaxEpochs = 20, ... 
    MiniBatchSize = 64, ... 
    ValidationData = {testIm,testLab}, ...
    ValidationFrequency =  floor(numTrain/64), ... 
    Plots = 'training-progress');
    

net = trainNetwork(trainIm, trainLab, layers, options);
save("trainedNN.mat","net");


