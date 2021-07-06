function [block] = IDCT_2D(blockDCT)
    [bSize,~] = size(blockDCT);%getting the size of the input block.

    %creating the bases in a 4D array, those will be correlated with the
    %image to find the DCT of it.
    base = zeros(bSize,bSize,bSize,bSize);
    for u=0:bSize-1
        for v=0:bSize-1
            for x=0:bSize-1
                for y=0:bSize-1
                    base(x+1,y+1,u+1,v+1) = cos(((2*x+1)*u*pi)/(bSize*2))*cos(((2*y+1)*v*pi)/(bSize*2));
                end
            end
        end
    end

    block = zeros(bSize,bSize);%the placeholder for the output, the IDCT.

    %Performing IDCT, by summing the contribution of each base*its weight
    for u=0:bSize-1
        for v=0:bSize-1
            block = block + blockDCT(u+1,v+1)*base(:,:,u+1,v+1);
        end
    end
end