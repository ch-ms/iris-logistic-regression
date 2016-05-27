function predictions = predict(X, all_theta)

  predictions = sigmoid(X * all_theta');
  [val, class_prediction] = max(predictions');
  predictions = class_prediction';

end