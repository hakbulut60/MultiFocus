function [y] = FitnessFunction(mn, A, B, ax, ay)
    % The variables 'm' and 'n' represent the block sizes in the horizontal and vertical directions, respectively.
    % 'mn(1)' corresponds to the horizontal block size, and 'mn(2)' corresponds to the vertical block size.
    m = floor(mn(1));
    n = floor(mn(2));
    
    % Compute the number of blocks along the horizontal (fmx) and vertical (fmy) dimensions.
    % If the image dimensions are not perfectly divisible by the block size, one additional block is added.
    if mod(ax, m) == 0
        fmx = floor(ax / m);  % Number of blocks in the horizontal direction
    else
        fmx = floor(ax / m) + 1;
    end

    if mod(ay, n) == 0
        fmy = floor(ay / n);  % Number of blocks in the vertical direction
    else
        fmy = floor(ay / n) + 1;
    end
    
    % Initialize an empty matrix 'fus' for the fusion result with dimensions of the input image.
    fus = zeros(ax, ay);
    
    % Iterate through the image in blocks along both horizontal and vertical directions
    for i = 1:m:ax
        for j = 1:n:ay
            basi = i;   % Starting index for the horizontal direction
            basj = j;   % Starting index for the vertical direction
            
            % Compute the block indices for the current block.
            ii = floor(i / m) + 1;
            jj = floor(j / n) + 1;
            
            % Determine the boundaries of the block, ensuring it does not exceed the image dimensions.
            if i + m - 1 <= ax && j + n - 1 <= ay
                biti = i + m - 1;
                bitj = j + n - 1;
            end

            if i + m - 1 <= ax && j + n - 1 > ay
                biti = i + m - 1;
                bitj = ay;
            end

            if i + m - 1 > ax && j + n - 1 <= ay
                biti = ax;
                bitj = j + n - 1;
            end

            if i + m - 1 > ax && j + n - 1 > ay
                biti = ax;
                bitj = ay;
            end
            
            % Extract the corresponding blocks from images A and B.
            BA = A(basi:biti, basj:bitj);
            BB = B(basi:biti, basj:bitj);
            
            % Calculate the 'SF' (Structure F-measure) for both blocks to assess the quality.
            v1 = fmeasure(BA, 'SF');  % Structure F-measure for block from image A
            v2 = fmeasure(BB, 'SF');  % Structure F-measure for block from image B
     
            % Select the block with the higher quality (higher F-measure value).
            % The selected block is added to the fusion result.
            if (v1 >= v2)
                fus(basi:biti, basj:bitj) = BA;  % Choose the block from image A
            else
                fus(basi:biti, basj:bitj) = BB;  % Choose the block from image B
            end
        end
    end
    
    % Compute the variance of the fusion result. The variance serves as a measure of image sharpness and quality.
    % A higher variance indicates greater image detail and sharpness.
    y = -var(fus(:));  % Return the negative variance as the fitness value (higher variance means better quality).
end
