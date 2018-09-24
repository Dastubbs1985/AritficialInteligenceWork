clearvars;
clc;
% 1. Load the data for training
trainImages = loadMNISTImages('train-images.idx3-ubyte');

train_images = reshape(trainImages,(size(trainImages,1)*size(trainImages,2)),size(trainImages,3));

trainImagesBin = imbinarize(train_images);

[a,b,c] = size(trainImages);
[r,c] = size(trainImagesBin);
% nlay  = 3;
out   = permute(reshape(trainImagesBin,[r/a,r/b,c]),[2,1,3]);