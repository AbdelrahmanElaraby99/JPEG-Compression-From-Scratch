function [blocks] = DivideToBlocks(img,bSize)
    %preprocessing on the image to convert it to grayscale and double.
    img = rgb2gray(img);
    imgd = double(img);
    %calculating the number of X and Y blocks after dividing the image to
    %[bSize x bSize] blocks.
    [img_x,img_y] = size(imgd);
    loopX = floor(img_x/bSize);
    loopY = floor(img_y/bSize);
    
    %initializing a 4D array, that will contain all the blocks of the image.
    blocks = zeros(bSize,bSize,loopX,loopY);
    for i=1:loopX
        for j=1:loopY
            %Take an 8x8 section of the image
            blocks(:,:,i,j) = imgd((bSize*(i-1))+1 : bSize*i,  (bSize*(j-1))+1 : bSize*j);
        end
    end

end

