function [binariesByDate, callSigns] = filter_binaries_by_date(startDate,endDate, serv)
%FILTER_BINARIES Takes Start and End dates, returns list of binaries
% Use before filter_binaries_by_date.m

startYear = startDate.Year;
endYear = endDate.Year;
% Connect to server
% host = "ftp.aoml.noaa.gov";
% path = "phod/pub/soopdata/XBT/done/";
host = serv.host;
path = serv.directory;
user = serv.user;
pass = serv.pass;

bar = waitbar(0,"Connecting to server...");
server = ftp(host,user,pass);
waitbar(0.25,bar,"Browsing remote binary list");
cd(server,path); % go to dir

% Browse folders from startYear to endYear
fullList = [];
fullYearList = [];
for i = startYear:endYear
    cd(server,string(i)); % go to new dir
    dirObject = dir(server, "*.bin"); % filter only ending in .bin
    binaries = {dirObject.name};
    binaries = convertCharsToStrings(binaries);
    fullList = [fullList binaries]; % append to existing list
    directories = get_folder(string(i), length(fullList)); % create a list of same dimension as fullList to store directories
    fullYearList = [fullYearList directories]; % list with corresponding directories as fullList to use same index
    cd(server,".."); % go back one dir
end

close(server);
% print_list(fullList);
listLength = length(fullList);
waitbar(0.75,bar, string(listLength) + " binary files found in the range of dates selected");
pause(0.5);
% Filter files by date
binariesByDate = [""];
count = 1;
for j = 1:listLength
    % Filter only files that start with "done"
    if startsWith(fullList(j),"done")
        stringDate = split(fullList(j),"_"); % split by _
        stringDate = stringDate(4); % take 4th element 20230120200200
        stringDate = char(stringDate); % convert to char to access substrings
        stringYear = stringDate(1:4);
        stringMonth = stringDate(5:6);
        stringDay = stringDate(7:8);
        fileDate = datetime(str2num(stringYear),str2num(stringMonth),str2num(stringDay));
    %     disp(fileDate);
        test = and(fileDate <= endDate , fileDate >= startDate);
    %     disp(test);
        if test
            binariesByDate(count) = fullYearList(j) + ";" + fullList(j); % store directory;filename in the date range
            count = count + 1 ;
        end
    end

end

% Retrieve list of callsigns from file list (only files starting with "done"
callSigns = get_callSigns(binariesByDate); % summarized list

% print_list(callSigns);
% print_list(binariesByDate);
waitbar(1,bar, "Done");
pause(0.3);
close(bar);

end % Function end

function folderList = get_folder(dir, num)
    folderList = [""];
    for i = 1:num
        folderList(i) = dir;
    end

end

function callSignList = get_callSigns(binaryList)
    callSignList = [""];
    count = 1;
    for i = 1:length(binaryList)
        a = split(binaryList(i),"_"); % split by _
        cs = a(3); % take 3rd element which is callsign
        if ~ismember(cs,callSignList)
            callSignList(count) = cs; % assing to tmp array only if it's not there already
            count = count + 1;
        end
    end        
end

% print a list of items in a column
function print_list(list)
    for i = 1:length(list)
        disp(list(i));
    end
end