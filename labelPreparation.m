function [ finalLabels ] = labelPreperation( inLabels )
%labelPreperation receives the full MNIST 60,000 label entry dataset and
%recreates the dataset to match that of the finalImages function.
%   Inputs: inLabels - The full unedited MNIST labels dataset
%                                                            
%   Output: finalLabels - The new dataset is returned ready to be
%                         processed.


%  Replace repetition with for loops where possible.
labelsZero = inLabels(inLabels == 0);
labelsOne = inLabels(inLabels == 1);
labelsTwo = inLabels(inLabels == 2);
labelsThree = inLabels(inLabels == 3);
labelsFour = inLabels(inLabels == 4);
labelsFive = inLabels(inLabels == 5);
labelsSix = inLabels(inLabels == 6);
labelsSeven = inLabels(inLabels == 7);
labelsEight = inLabels(inLabels == 8);
labelsNine = inLabels(inLabels == 9);

labels_Zero = labelsZero(5275:end, :);
labels_One = labelsOne(6094:end, :);
labels_Two = labelsTwo(5310:end, :);
labels_Three = labelsThree(5483:end, :);
labels_Five = labelsFive(4773:end, :);
labels_Six = labelsSix(5270:end, :);
labels_Seven = labelsSeven(5616:end, :);
labels_Eight = labelsEight(5203:end, :);
labels_Nine = labelsNine(5301:end, :);

finalLabels = vertcat(labels_Zero, labels_One, labels_Two, labels_Three, labelsFour, labels_Five, labels_Six, labels_Seven, labels_Eight, labels_Nine);

end

