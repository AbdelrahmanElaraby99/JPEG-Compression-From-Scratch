function [block_1D] = RunLengthDecoder(runLengthSequence)
    [~, L] = size(runLengthSequence); %getting the length of the sequence
    
    block_1D = []; %placeholder for the output
    flag = 0; %a flag
    for i=1:L
        if runLengthSequence(i) == 0
            %if the bit is zero, then the next element is the number of
            %following zeros, use it to loop on all of them.
            for j=1:runLengthSequence(i+1)
                block_1D = [block_1D 0]; %append to the output.
            end
             %set the flag to not append the next element in the original
             %array to the output (negelect the integer of zeros counting)
            flag = 1;
        elseif flag == 1
            flag = 0; %reset the flag
            continue;
        else
            %append the normal non-zero integers
            block_1D = [block_1D runLengthSequence(i)];
        end
    end
end

