function directoryList = ftp_directories()
%FTP_DIRECTORIES Summary of this function goes here
%   Detailed explanation goes here
% anonymous@ftp.aoml.noaa.gov | anonymous | subdir: /phod/pub/soopdata/XBT/done
% Connect to FTP
host = "ftp.aoml.noaa.gov";
path = "phod/pub/soopdata/XBT/done";

bar = waitbar(0,"Connecting to server...");
server = ftp(host);
waitbar(0.25,bar,"Retrieving "+ path +" folder list");
cd(server, path);
dirObject = dir(server);

waitbar(0.5,bar,"Displaying remote folder list");
directoryList = {dirObject.name};
directoryList = convertCharsToStrings(directoryList);
directoryList = clean_list(directoryList);
directoryList = sort(directoryList,"descend");
disp(directoryList);
close(server);
close(bar);

% files = ftp_binaries("2023");

end




% return directories that are numbers (years)
function cleanList = clean_list(list)
cleanList = [];
count = 1;
for i = 1:length(list)
    test = str2double(list(i)); % returns a number or NaN
    if ~isnan(test)
        cleanList(count) = list(i);
        count = count + 1;
    end
end
end