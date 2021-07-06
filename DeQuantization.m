function [blocksDCT] = DeQuantization(Q_blocksDCT,table_n,Qtable)
    [bSize,~,blocks_x,blocks_y] = size(Q_blocksDCT);%getting the dimensions
    blocksDCT = zeros(bSize,bSize,blocks_x,blocks_y);%placeholder fot the output
    
    %the 2 offered Quantization tables, the user can input any other table
    %in "Qtable" varible and set table_n = -1 to use it.
    table_1 = [1 1 1 1 1 2 2 4;
               1 1 1 1 1 2 2 4;
               1 1 1 1 2 2 2 4;
               1 1 1 1 2 2 4 8;
               1 1 2 2 2 2 4 8;
               2 2 2 2 2 4 8 8;
               2 2 2 4 4 8 8 16;
               4 4 4 4 8 8 16 16];
    table_2 = [1 2 4 8 16 32 64 128;
               2 4 4 8 16 32 64 128;
               4 4 8 16 32 64 128 128;
               8 8 16 32 64 128 128 256;
               16 16 32 64 128 128 256 256;
               32 32 64 128 128 256 256 256;
               64 64 128 128 256 256 256 256;
               128 128 128 256 256 256 256 256];
    
    for i=1:blocks_x
        for j=1:blocks_y
            %For each block, Multiply by the choosen quantization table.
            if table_n == 1
                blocksDCT(:,:,i,j) = (Q_blocksDCT(:,:,i,j).*table_1);
            elseif table_n == 2
                blocksDCT(:,:,i,j) = (Q_blocksDCT(:,:,i,j).*table_2);
            elseif table_n == -1
                blocksDCT(:,:,i,j) = (Q_blocksDCT(:,:,i,j).*Qtable);
            else
                disp("You should enter 1 or 2 or (-1 and a Qtable) as an argument");
            end
        end
    end
end

