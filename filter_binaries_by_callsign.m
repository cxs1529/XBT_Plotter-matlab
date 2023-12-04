function binariesByCallsign = filter_binaries_by_callsign(binaryList,callsignList)
%FILTER_BINARIES_BY_CALLSIGN Summary of this function goes here
% Run filter_binaries_by_date(startDate,endDate) first
% binariesByDate contain this format: remoteDir;fileName -> 2023;done_20230110-1925_DGWF2_20230110235800_N04_XBT.bin
binariesByCallsign = filter_callsigns(binaryList,callsignList);
% filteredBinaries = sort(filteredBinaries,"ascend"); % list of binary files containing the callsign as the name
% print_list(binariesByCallsign);

end



% returns a list with the binary files containing the callsign in the name
function fileList = filter_callsigns(binaryList,callsignList)
    fileList = [""];
    count = 1;
    for n = 1:length(callsignList)
        callsign = callsignList(n);
        for i = 1:length(binaryList)
            test = contains(binaryList(i),callsign); % callSign is in filename? true/false
            if test
                fileList(count) = binaryList(i);
                count = count + 1;
            end
        end
    end

end


% print a list of items in a column
function print_list(list)
    for i = 1:length(list)
        disp(list(i));
    end
end
