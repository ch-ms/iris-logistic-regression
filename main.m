%
% Предсказания для iris-dataset
%

% Load dataset
loadData();

load ./irisData.mat;


% Split dataset
data = irisData;
data = data(:, [2, 4, 6]);
data = [ones(size(data)(1), 1), data];
classes = unique(data(:, size(data)(2)));

[train_X, test_X, cv_X, train_y, cv_y, test_y] = splitData(data, classes);


% Visualize
% visualize(train_X, train_y, classNames);
% disp("Press any key to continue");
% pause;


% Learn
disp("Learn.");
all_theta = allVsOne(train_X, train_y, classes);

disp(all_theta);

fprintf("Learning complete!\n\n");


% Visualize decision boundaries
visualizeDecisionBoundary(classNames, all_theta, data(:, [1,2,3]), data(:, 4));
disp("Press any key to continue");
pause;


% Validate
% disp("Validation.");

% predictions = find(round(sigmoid(cv_X * theta)) == cv_y);

% accuracy = length(predictions)/length(cv_y);

% fprintf("Accuracy is %i \n\n", accuracy);


% Predict
% disp("Predictions.");

% for i = 1:length(test_X)
%  prediction = round(sigmoid(test_X(i, :) * theta));
%  actual = test_y(i);
%  % fprintf("Prediction/actual %i = %i.\n", prediction, actual);
% endfor
