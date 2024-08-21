clc;
clear;

trainImagesURL = 'http://yann.lecun.com/exdb/mnist/train-images-idx3-ubyte.gz';
trainLabelsURL = 'http://yann.lecun.com/exdb/mnist/train-labels-idx1-ubyte.gz';
testImagesURL = 'http://yann.lecun.com/exdb/mnist/t10k-images-idx3-ubyte.gz';
testLabelsURL = 'http://yann.lecun.com/exdb/mnist/t10k-labels-idx1-ubyte.gz';


saveFolder = 'C:\Users\Konstantinos\Downloads';

websave(fullfile(saveFolder,'train-images-idx3-ubyte.gz'),trainImagesURL);
websave(fullfile(saveFolder,'train-labels-idx1-ubyte.gz'),trainLabelsURL);
websave(fullfile(saveFolder,'t10k-images-idx3-ubyte.gz'),testImagesURL);
websave(fullfile(saveFolder,'t10k-labels-idx1-ubyte.gz'), testLabelsURL);

