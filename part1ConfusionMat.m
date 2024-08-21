clc;
clear;

testIm = loadMNISTImages("data/t10k-images.idx3-ubyte");
testLab= loadMNISTLabels("data/t10k-labels.idx1-ubyte");

file = load('trainedNN.mat');
net = file.net;

predLabels = classify(net,testIm);


confusionMatrix = calculateConfusionMatrix(testLab,predLabels);


