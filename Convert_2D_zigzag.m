function [block] = Convert_2D_zigzag(block_1D)
    [~,numOfElements] = size(block_1D); %getting the number of elements
    L = sqrt(numOfElements); %size of the block
    
    di = []; %num of diagnoal elements in each diagonal list
    %The pattern is for example:[1 2 3 2 1] if the block size L=3
    
    %Filling the di array with the pattern mentioned, will be used later.
    for i=1:L
        di = [di i];
    end
    for i=L-1:-1:1
        di = [di i];
    end
    
    [~,numDiags] = size(di); %getting the number of diagonals. 
    diagonaLists = cell(1,numDiags); %making the diagonal arrays. 
    a = 1; %will be used for looping over the 1D_block
    for i=1:numDiags %loop over each diagonal
        for j=1:di(i) %loop over the elements of each diagonal
            if mod(di(i)-1,2) == 0 %even or odd? to reverse the made zigzag.
                diagonaLists{1,i} = [block_1D(a) diagonaLists{1,i}];
                a = a+1;
            else
                diagonaLists{1,i} = [diagonaLists{1,i} block_1D(a)];
                a = a+1;
            end
        end
    end

    block = zeros(L,L);%paceholder fot the restored 2D block
    %loop over the places of the 2D block, put in it an element for the
    %correct diagonal list (using the sumIndex to know which list)
    for i=0:L-1
        for j=0:L-1
            sumIndex = i+j;
            temp = diagonaLists{1,sumIndex+1}; %the list containing the needed element
            block(i+1,j+1) = temp(1,1); %assign it to the first element from that set
            diagonaLists{1,sumIndex+1} = temp(1,2:end);%remove the first element from its diagonal array.
        end
    end
end

