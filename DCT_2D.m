function [blockDCT] = DCT_2D(block)
    [bSize,~] = size(block); %getting the size of the input block.
    
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
    
    blockDCT = zeros(bSize,bSize); %the placeholder for the output, the DCT.
    %Performing DCT
    for u=0:bSize-1
        for v=0:bSize-1
            %element wise multiplication of the image with each
            %base function, then summing them. (correlating)
            groupOut = sum(block.*base(:,:,u+1,v+1), "All");

            %conditions for scaling the DCT coefficients
            if u==0 && v == 0
                scaleUV = (1/bSize^2); % = (1/64)when bSize is 8
            elseif (u==0 && v ~= 0)||(u~=0 && v == 0)
                scaleUV = (1/(bSize*4)); % = (1/32)when bSize is 8
            else
                scaleUV = (1/(bSize*2));% = (1/16)when bSize is 8
            end
            groupOut = groupOut*(scaleUV); %apply sclaing
            %add the output to the final DCT output in its correct place
            blockDCT(u+1,v+1)=groupOut;
        end
    end
end