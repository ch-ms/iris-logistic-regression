function [J, grad] = costFunction(theta, X, y)

  m = length(y);

  hypo = sigmoid(X * theta);

  J = 1/m * sum( (-y .* log(hypo)) - (1 - y) .* log(1 - hypo));
  grad = 1/m * sum( (hypo - y) .* X );
  grad = grad';

end