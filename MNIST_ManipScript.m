clearvars;
clc;
% 1. Load the data for training
trainImages = loadMNISTImages('train-images.idx3-ubyte');
trainLabels = loadMNISTLabels('train-labels.idx1-ubyte');

% 6. Build a set of PC Models
pc_set = nc_trainPCModels(trainImages, trainLabels, 0.95, 99.0);

% 7. Equalise distribution
trainImages = imagePreparation(trainImages, trainLabels);
trainLabels = labelPreparation(trainLabels);

% 8. Encode the Images based on the pc_set
[finalTrainedImages, finalLabels] = nc_encodePCModels(pc_set, trainImages, trainLabels, 86.0);

% 4. Apply filters
[counts,x] = imhist(finalTrainedImages, 16);
threshold = otsuthresh(counts);
trainImagesBin = imbinarize(finalTrainedImages, threshold);
trainImagesGauss = imgaussfilt(finalTrainedImages, 0.8);
trainImagesSobel = edge(finalTrainedImages, 'sobel');

% 9. Do all of the above for the test images
testImages = loadMNISTImages('t10k-images.idx3-ubyte');
testLabels = loadMNISTLabels('t10k-labels.idx1-ubyte');

finalTestImages = nc_encodePCModels(pc_set,testImages);

% 10. Save the images out to a csv file ready for import to Weka.
saveMNIST_csvfile('DalesTraining.csv', finalTrainedImages, finalLabels);
saveMNIST_csvfile('DalesTrainingBin.csv', trainImagesBin, finalLabels);
saveMNIST_csvfile('DalesTrainingGauss.csv', trainImagesGauss, finalLabels);
saveMNIST_csvfile('DalesTrainingSobel.csv', trainImagesSobel, finalLabels);
saveMNIST_csvfile('DalesTesting.csv', finalTestImages, testLabels);


% 11. Combine CSV files for use in Weka
combine_csvfiles('DalesTraining.csv', 'DalesTesting.csv', 'finalTestData.csv');
combine_csvfiles('DalesTrainingBin.csv', 'DalesTesting.csv', 'finalTestDataBin.csv');
combine_csvfiles('DalesTrainingGauss.csv', 'DalesTesting.csv', 'finalTestDataGauss.csv');
combine_csvfiles('DalesTrainingSobel.csv', 'DalesTesting.csv', 'finalTestDataSobel.csv');