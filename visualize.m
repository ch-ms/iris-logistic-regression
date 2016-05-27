function [] = visualize(X, y, classNames)
  graph_x = X(:, 2);
  graph_y = X(:, 3);

  clf reset;
  scatter(graph_x, graph_y, 13, y, "filled");

  xlabel("Sepal length Cm");
  ylabel("Petal length Cm");
end
