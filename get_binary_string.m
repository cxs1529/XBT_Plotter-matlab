function stringOfBits = get_binary_string(binfile)
%GET_BINARY_STRING Summary of this function goes here
%   Detailed explanation goes here
    % Open and read binary file
    fin = fopen(binfile,"rb");
    fileContent = fread(fin);
    fclose(fin);

    contentBin = dec2bin(fileContent); % convert decimals to binary
    contentBinCell = cellstr(contentBin); % convert char array to cell array - now can be accessed by contentBinCell(n) returns {'01000011'}
    itemNum = length(contentBinCell); % number of items in cell array
    % Convert each cell to string and concatenate
    stringOfBits = "";
    for n = 1:itemNum
        stringOfBits = stringOfBits + string(contentBinCell(n));
    end
end

