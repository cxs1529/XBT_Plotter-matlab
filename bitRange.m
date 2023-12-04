function dataRanges = bitRange(messageType, path)
%GET_BIN_RANGES Takes the message type and CSV file path and returns a table with
%Description (index), StartBit and EndBit
%   Detailed explanation goes here
% path = "dataRanges.csv";
data = readtable(path);
index = data.Description;

switch messageType
    case 1
        startBit = data.StartBit1;
        endBit = data.EndBit1;
    case 2
        startBit = data.StartBit2;
        endBit = data.EndBit2;
    case 3
        startBit = data.StartBit3;
        endBit = data.EndBit3;

dataRanges = table(startBit,endBit,'RowNames',index);

end


% data = readtable("tableTest.csv")
% index = data.Description
% startb = data.StartBit
% endb = data.EndBit
% newTable = table(startb,endb,'RowNames',index)
% a = newTable("WMO_ID","startb").(1)