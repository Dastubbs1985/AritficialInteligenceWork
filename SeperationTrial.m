clearvars;

trainImages = loadMNISTImages('train-images.idx3-ubyte');
trainLabels = loadMNISTLabels('train-labels.idx1-ubyte');
percent = 50;
prop = 0.95;
labelSet = unique(trainLabels);
models = cell(length(labelSet),1);
for i=1:length(labelSet)
   theseLabels = find(trainLabels==labelSet(i));
   numUse = floor(percent*length(theseLabels)/100);   
   theseImages = trainImages(:,:,theseLabels(1:numUse));
   thisData = reshape(theseImages, size(theseImages, 1) * size(theseImages, 2), size(theseImages, 3))';
   models{i} = nc_genpc(thisData,prop);
   models{i}.label = labelSet(i);
   disp(models{i});
end

% % imagesZero = trainImages(:,:,trainLabels == 0); % 667 Needed
% % labelsZero = trainLabels(trainLabels == 0);
% % imagesOne = trainImages(:,:,trainLabels == 1); % 667 Needed
% % labelsOne = trainLabels(trainLabels == 1);
% % imagesTwo = trainImages(:,:,trainLabels == 2); % 667 Needed
% % labelsTwo = trainLabels(trainLabels == 2);
% % imagesThree = trainImages(:,:,trainLabels == 3); % 667 Needed
% % labelsThree = trainLabels(trainLabels == 3);
% % imagesFour = trainImages(:,:,trainLabels == 4); % All Needed
% % labelsFour = trainLabels(trainLabels == 4);
% % imagesFive = trainImages(:,:,trainLabels == 5); % 667 Needed
% % labelsFive = trainLabels(trainLabels == 5);
% % imagesSix = trainImages(:,:,trainLabels == 6); % 667 Needed
% % labelsSix = trainLabels(trainLabels == 6);
% % imagesSeven = trainImages(:,:,trainLabels == 7); % 667 Needed
% % labelsSeven = trainLabels(trainLabels == 7);
% % imagesEight = trainImages(:,:,trainLabels == 8); % 667 Needed
% % labelsEight = trainLabels(trainLabels == 8);
% % imagesNine = trainImages(:,:,trainLabels == 9); % 667 Needed
% % labelsNine = trainLabels(trainLabels == 9);
% 
% train_images = reshape(trainImages,(size(trainImages,1)*size(trainImages,2)),size(trainImages,3));
% images_Zero = reshape(imagesZero,(size(imagesZero,1)*size(imagesZero,2)),size(imagesZero,3));
% images_One = reshape(imagesOne,(size(imagesOne,1)*size(imagesOne,2)),size(imagesOne,3));
% images_Two = reshape(imagesTwo,(size(imagesTwo,1)*size(imagesTwo,2)),size(imagesTwo,3));
% images_Three = reshape(imagesThree,(size(imagesThree,1)*size(imagesThree,2)),size(imagesThree,3));
% images_Four = reshape(imagesFour,(size(imagesFour,1)*size(imagesFour,2)),size(imagesFour,3));
% images_Five = reshape(imagesFive,(size(imagesFive,1)*size(imagesFive,2)),size(imagesFive,3));
% images_Six = reshape(imagesSix,(size(imagesSix,1)*size(imagesSix,2)),size(imagesSix,3));
% images_Seven = reshape(imagesSeven,(size(imagesSeven,1)*size(imagesSeven,2)),size(imagesSeven,3));
% images_Eight = reshape(imagesEight,(size(imagesEight,1)*size(imagesEight,2)),size(imagesEight,3));
% images_Nine = reshape(imagesNine,(size(imagesNine,1)*size(imagesNine,2)),size(imagesNine,3));
% 
% images_Zero = images_Zero(:, 5275:end); % 5257
% images_One = images_One(:, 6094:end); % 6076
% images_Two = images_Two(:, 5310:end); % 5292
% images_Three = images_Three(:, 5483:end); % 5465
% images_Five = images_Five(:, 4773:end); % 4754
% images_Six = images_Six(:, 5270:end); % 5252
% images_Seven = images_Seven(:, 5616:end); % 5599
% images_Eight = images_Eight(:, 5203:end); % 5185
% images_Nine = images_Nine(:, 5301:end); % 5283
% 
% labels_Zero = labelsZero(5257:end, :);
% labels_One = labelsOne(6076:end, :);
% labels_Two = labelsTwo(5292:end, :);
% labels_Three = labelsThree(5465:end, :);
% labels_Five = labelsFive(4755:end, :);
% labels_Six = labelsSix(5252:end, :);
% labels_Seven = labelsSeven(5599:end, :);
% labels_Eight = labelsEight(5185:end, :);
% labels_Nine = labelsNine(5283:end, :);
% 
% finalImages = horzcat(images_Zero, images_One, images_Two, images_Three, images_Four, images_Five, images_Six, images_Seven, images_Eight, images_Nine);
% finalLabels = vertcat(labels_Zero, labels_One, labels_Two, labels_Three, labelsFour, labels_Five, labels_Six, labels_Seven, labels_Eight, labels_Nine);
% % figure;
% display_network(finalImages(:,1:11845)); title('Final');
% figure;
% display_network(images_Zero(:,1:667)); title('Zeros');
% figure;
% display_network(images_One(:,1:6742)); title('Ones');
% figure;
% display_network(images_Two(:,1:5958)); title('Twos');
% figure;
% display_network(images_Three(:,1:6131)); title('Threes');
% figure;
% display_network(images_Four(:,1:5842)); title('Fours');
% figure;
% display_network(images_Five(:,1:5421)); title('Fives');
% figure;
% display_network(images_Six(:,1:5918)); title('Sixes');
% figure;
% display_network(images_Seven(:,1:6265)); title('Sevens');
% figure;
% display_network(images_Eight(:,1:5851)); title('Eights');
% figure;
% display_network(images_Nine(:,1:5949)); title('Nines');
