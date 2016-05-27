function [] = loadData ()

  fileName = "./irisData.mat";

  if (exist(fileName, "file") == 0)

    fid = fopen("./data.csv");

    catIds = {};
    nextId = 1;

    % Skip header
    fgets(fid);

    while (! feof(fid) )
      line = fgets(fid);
      rawData = strsplit(line, ',', "collapsedelimiters", false);

      if (exist("irisData", "var") == 0)
        irisData = zeros(0, size(rawData)(1));
      endif

      data = [];

      for i = 1:6

        if (i == 6)

          if (isfield(catIds, rawData{i}) == 0)
            catIds = setfield(catIds, rawData{i}, nextId);
            nextId += 1;
          endif

          data = [data, getfield(catIds, rawData{i})];

        else
          data = [data, str2num(rawData{i})];
        endif

      endfor

      irisData = [irisData; data];
    endwhile

    % Extract class names
    clNames = fieldnames(catIds);
    classNames = cell(length(clNames), 1);

    for i = 1:length(clNames)
      id = getfield(catIds, clNames{i});
      classNames{id} = clNames{i};
    endfor

    save -binary irisData.mat irisData classNames;

    fprintf("Processed %i entries, %i classes.\n\n", length(irisData), length(classNames));

  else

    fprintf("File already exists, skip file processing.\n\n");

  endif



end