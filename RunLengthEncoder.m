function [runLengthSequence] = RunLengthEncoder(block_1D)
    [~,L] = size(block_1D); %getting the length of the sequence
    runLengthSequence = [];%placeholder for the output
    sumZ = 0; %a variable to sum the number of zeros in it
    %looping over the 1D sequence
    for i=1:L
        if block_1D(i) == 0
            %if the element found to be a zero, then add 1 to the zero count
            sumZ = sumZ+1;
            %if this was the last element in the array, add 0 and the count
            %of zeros to the output.
            if (i == L)
                runLengthSequence = [runLengthSequence 0 sumZ];
            end
        elseif sumZ ~= 0
            %if the element isn't zero, but the count of zeros contains a
            %non-zero value, then thats the end of the zero chunk, add the
            %0 symbol and the sumZ and the current element (element isn't zero)
            runLengthSequence = [runLengthSequence 0 sumZ block_1D(i)];
            sumZ = 0;
        else
            %if non-zero element and the last element isn't zero too,
            %append the elemnts normally to the output.
            runLengthSequence = [runLengthSequence block_1D(i)];
        end
    end
end

