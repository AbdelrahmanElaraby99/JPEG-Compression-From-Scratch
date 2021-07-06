function [blocks] = IDCT_Blocks(blocksDCT)
    [bSize,~,blocks_x,blocks_y] = size(blocksDCT);
    blocks = zeros(bSize,bSize,blocks_x,blocks_y);
    
    for i=1:blocks_x
        for j=1:blocks_y
            %Take the IDCT of an 8*8 block
            blocks(:,:,i,j) = IDCT_2D(blocksDCT(:,:,i,j));
        end
    end
end

