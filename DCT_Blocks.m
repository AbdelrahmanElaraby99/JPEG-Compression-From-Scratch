function [blocksDCT] = DCT_Blocks(blocks)
    [bSize,~,blocks_x,blocks_y] = size(blocks);
    blocksDCT = zeros(bSize,bSize,blocks_x,blocks_y);
    
    for i=1:blocks_x
        for j=1:blocks_y
            %Take the DCT of an 8*8 block
            blocksDCT(:,:,i,j) = DCT_2D(blocks(:,:,i,j));
        end
    end
end

