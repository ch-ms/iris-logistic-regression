function all_theta = allVsOne(X, y, classes)

  num_classes = length(classes);
  all_theta = zeros(num_classes, size(X)(2));

  for i = 1:num_classes
    c_class = classes(i);
    [theta, cost] = learn(X, y == c_class);
    all_theta(i, :) = theta;
  endfor

end

