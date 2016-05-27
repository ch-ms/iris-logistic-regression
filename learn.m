function [theta, cost] = learn(X, y)

  opts = optimset('GradObj', 'on', 'MaxIter', 400);

  init_theta = randn(length(X(1,:)), 1);

  [theta, cost] = fminunc(@(t)(costFunction(t, X, y)), init_theta, opts);

end