function importanceVector = pageRank(linkMatrix, alpha)

    linkMatrixSize = size(linkMatrix)
    rows = linkMatrixSize(1);
    cols = linkMatrixSize(2);

    initialVector = zeros(rows, 1) + 1/rows;
    eArray = ones(1, cols);
    uArray = ones(rows, 1) / rows;

%     Commenting this will result in sinks having the full weights of the
%     graph (A)
    for i = 1:cols
        if sum(linkMatrix(:,i)) == 0
            linkMatrix(:,i) = zeros(rows, 1) + 1/rows;
        end;
    end;

%     Commenting this will result in cycles having the full weights of the
%     graph (B)
    stochasticMatrix = alpha*linkMatrix + (1-alpha)*uArray*eArray;

    iterates = 1
    while iterates < 100
%         Uncommenting this will result in cycles having the full weights
%         of the graph (B)
%         initialVector = linkMatrix*initialVector;
        initialVector = stochasticMatrix*initialVector;
        iterates = iterates + 1;
    importanceVector = initialVector;
    end;