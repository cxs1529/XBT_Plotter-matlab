function binaryList = ftp_binaries(directory)
%FTP_BINARIES Summary of this function goes here
%   Detailed explanation goes here
% anonymous@ftp.aoml.noaa.gov | anonymous | subdir: /phod/pub/soopdata/XBT/done
% directory = "2023"
% Connect to FTP
host = "ftp.aoml.noaa.gov";
path = "phod/pub/soopdata/XBT/done/" + directory;

bar = waitbar(0,"Connecting to server...");
server = ftp(host);
waitbar(0.25,bar,"Retrieving "+ path +" binary list");

cd(server,path);
dirObject = dir(server, "*.bin");
close(server);


waitbar(0.5,bar,"Displaying remote folder list");

binaryList = {dirObject.name};
binaryList = convertCharsToStrings(binaryList);
binaryList = sort(binaryList,"descend"); % list of binary files in the remote folder
disp(binaryList);

callSigns = get_callSigns(binaryList); % summarized list of all the callsigns in the folder
disp(callSigns);

filterID = "DGZL";
filteredBinaries = filter_callsigns(binaryList,filterID);
filteredBinaries = sort(filteredBinaries,"ascend"); % list of binary files containing the callsign as the name
binaryList = filteredBinaries; %  remove after test
print_list(filteredBinaries);

close(bar);


end

% returns a non repeted list with callsigns in the directory
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

% returns a list with the binary files containing the callsign in the name
function fileList = filter_callsigns(binaryList,filterID)
    fileList = [""];
    count = 1;
    for i = 1:length(binaryList)
        test = contains(binaryList(i),filterID); % callSign is in filename? true/false
        if test
            fileList(count) = binaryList(i);
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