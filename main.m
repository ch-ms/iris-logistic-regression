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
all_X = data(:, [1,2,3]);
all_y = data(:, 4);
classes = unique(data(:, size(data)(2)));

[train_X, test_X, cv_X, train_y, cv_y, test_y] = splitData(data, classes);


% Visualize
visualize(all_X, all_y, classNames);
disp("Press any key to continue");
pause;


% Learn
disp("Learn.");
all_theta = allVsOne(train_X, train_y, classes);

disp(all_theta);

fprintf("Learning complete!\n\n");


% Visualize decision boundaries
visualizeDecisionBoundary(classNames, all_theta, all_X, all_y);
disp("Press any key to continue");
pause;


% Validate
% disp("Validation.");

predictions = predict(cv_X, all_theta);

true_predictions = find(predictions == cv_y);

accuracy = length(true_predictions)/length(cv_y);

fprintf("Accuracy is %i \n\n", accuracy);


% Predict
disp("Predictions.");

predictions = predict(test_X, all_theta);

for i = 1:length(test_X)
  actual = test_y(i);
  fprintf("Prediction/actual %i = %i.\n", predictions(i), actual);
endfor

