function value = get_value(StringOfBits, startBit, endBit,type,scale,offset)
%GET_VALUE value = get_value(StringOfBits, startBit,
%endBit,type,scale,offset) returns the value as a number or ascii according
%to type ("ascii","number")
%   Detailed explanation goes here
    charOfBits = char(StringOfBits);
%     disp(charOfBits);
    charOfBitsChunk = charOfBits(startBit+1:endBit+1);
    if type == "number"
        % function to get number
        value = get_number(charOfBitsChunk,scale,offset);
        % function to get ascii
    elseif type == "ascii"
        value = get_ascii(charOfBitsChunk);
        value = deblank(value);
    else
        value = "-999";
    end
end


% Takes a decimal representation of a binary chunk and returns the value
function number = get_number(charBit,scale,offset)
    strBit = string(charBit);
    decimalChunk = bin2dec(strBit);
    number = (decimalChunk + offset)/scale;
end

% Takes a decimal representation of a binary chunk and returns the string
function ascii = get_ascii(charBit)
    decArray = bin2dec(reshape(charBit,8,[]).'); % converts every 8 bits to decimal
    charArray = char(decArray);
    strArray = string(charArray);
    arrLength = length(strArray);
    
    % concatenate symbols
    ascii = "";
    for n = 1:arrLength
        ascii = ascii + strArray(n);
    end
    ascii = strtrim(ascii);
end