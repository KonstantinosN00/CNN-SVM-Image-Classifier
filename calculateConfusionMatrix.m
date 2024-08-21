function confusionMat = calculateConfusionMatrix(trueLab, predLab)
    classes = unique(trueLab);
    classNum = size(classes,1); %10
    
    confusionMat = zeros(classNum,classNum);
    % row->predicted value | column->true value
    for i = 1:size(trueLab,1)
        row = predLab(i);
        column = trueLab(i);
        confusionMat(row,column) = confusionMat(row,column)+1;
    end
    
    %PLOTS
    figure('Position', [100 100 800 300]);
    t = uitable(Data = confusionMat,Position =  [0 0 800 300]);
    columnNames = cellstr(num2str((0:9)', '%d'));
    t.ColumnName = columnNames;
    rowNames = cellstr(num2str((0:9)', '%d'));
    t.RowName = rowNames;

    figure;
    plotconfusion(trueLab,predLab);
    
end


