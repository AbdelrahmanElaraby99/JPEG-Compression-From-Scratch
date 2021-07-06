function [Q_blocksDCT] = Quantization(blocksDCT,table_n,Qtable)
    [bSize,~,blocks_x,blocks_y] = size(blocksDCT); %getting the dimensions
    Q_blocksDCT = zeros(bSize,bSize,blocks_x,blocks_y);%placeholder fot the output
    
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
            %Apply the choosen quantization table to each block.
            if table_n == 1
                Q_blocksDCT(:,:,i,j) = fix(blocksDCT(:,:,i,j)./table_1);
            elseif table_n == 2
                Q_blocksDCT(:,:,i,j) = fix(blocksDCT(:,:,i,j)./table_2);
            elseif table_n == -1
                Q_blocksDCT(:,:,i,j) = fix(blocksDCT(:,:,i,j)./Qtable);
            else
                disp("You should enter 1 or 2 or (-1 and a Qtable) as an argument");
            end
        end
    end
end

