function [] = visualizeDecisionBoundary(classNames, all_theta, X, y)

  visualize(X, y, classNames);
  plot_x = [min(X(:, 2)), max(X(:, 2))];

  color = {"red", "green", "blue"};

  hold on;

  for i = 1:size(all_theta)(1)
    theta = all_theta(i, :);
    plot_y = (-1./theta(3)) .* (theta(2).*plot_x + theta(1));
    plot(plot_x, plot_y, "color", color{i});
  endfor

  hold off;

end