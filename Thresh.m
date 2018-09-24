clearvars;
clc;
% 1. Load the data for training
trainImages = loadMNISTImages('train-images.idx3-ubyte');
% 2. Create variables based on matrix size of loaded images
rows = size(trainImages, 1);
cols = size(trainImages, 2);
count = size(trainImages, 3);

% 3. Re-shape matrix of images for filtering
train_images = reshape(trainImages,(rows*cols),count);
