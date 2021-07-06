function [img] = CombineBlocks(blocks)
    [bSize,~,blocks_x,blocks_y] = size(blocks);%getting the dimensions
    img = zeros(bSize*blocks_x, bSize*blocks_y);%placeholder for the output image.
    
    for i=1:blocks_x
        for j=1:blocks_y
            %Take a block, put it in its place in the image
            img((bSize*(i-1))+1 : bSize*i,  (bSize*(j-1))+1 : bSize*j) = blocks(:,:,i,j);
        end
    end
end

