function [ finalImages ] = imagePreparation(inImages, inLabels)
%imagePreperation receives the full MNIST 60,000 entry image dataset and selects
%an almost 50% split of fours and non-fours and creates a new smaller and
%more evenly distributed dataset.
%   Inputs: inImages - The full unedited MNIST images dataset
%           inLabels - The full unedited MNIST labels dataset
%                                                            
%   Output: finalImages - The new dataset is returned ready to be
%                         processed.

%  Replace repetition with for loops where possible.

imagesZero = inImages(:,:,inLabels == 0);
imagesOne = inImages(:,:,inLabels == 1);
imagesTwo = inImages(:,:,inLabels == 2);
imagesThree = inImages(:,:,inLabels == 3);
imagesFour = inImages(:,:,inLabels == 4);
imagesFive = inImages(:,:,inLabels == 5);
imagesSix = inImages(:,:,inLabels == 6);
imagesSeven = inImages(:,:,inLabels == 7);
imagesEight = inImages(:,:,inLabels == 8);
imagesNine = inImages(:,:,inLabels == 9);

images_Zero = imagesZero(:,:,5275:end);
images_One = imagesOne(:,:,6094:end);
images_Two = imagesTwo(:,:,5310:end);
images_Three = imagesThree(:,:,5483:end);
images_Four = imagesFour(:,:,:);
images_Five = imagesFive(:,:,4773:end);
images_Six = imagesSix(:,:,5270:end);
images_Seven = imagesSeven(:,:,5616:end);
images_Eight = imagesEight(:,:,5203:end);
images_Nine = imagesNine(:,:,5301:end);

finalImages = cat(3, images_Zero, images_One, images_Two, images_Three, images_Four, images_Five, images_Six, images_Seven, images_Eight, images_Nine);
end

