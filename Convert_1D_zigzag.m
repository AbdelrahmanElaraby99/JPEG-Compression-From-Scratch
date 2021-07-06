function [block_1D] = Convert_1D_zigzag(block)
    [bSize,~] = size(block); %getting the dimensions
    numofDiag = bSize+bSize-1; %the number of diagonals = length+width-1
    diags  = cell(1,numofDiag); %initializing a cell array to store in it the diagonal values.
    %loop inside the block normally, row by row.
    for i=0:bSize-1
        for j=0:bSize-1
            %this "sumIndex" yields a unique value for each diagonal so can
            %be used to place each element in a certian diagonal array.
            sumIndex = i+j; 
            
            %see if the sumIndex of the element is even or odd, to make the
            %zigag shape, the diagonals toggle this property, so I can use
            %it to decide whether to append the element to the beginning or
            %the end of the diagonal array.
            if mod(sumIndex,2) == 0
                diags{1,sumIndex+1} = [block(i+1,j+1) diags{1,sumIndex+1}];
            else
                diags{1,sumIndex+1} = [diags{1,sumIndex+1} block(i+1,j+1)];
            end
        end
    end
    
    %putting all the diagonal arrays' elements in one big array, that's the
    %needed output!
    block_1D = [];
    for i=1:numofDiag
        block_1D = [block_1D diags{1,i}];
    end
end

