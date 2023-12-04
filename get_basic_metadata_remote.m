function basicMetadata = get_basic_metadata_remote(binaryList, serv, localpath)
%GET_BASIC_METADATA takes a remote folder path and a list of binary file names and returns basic metadata
%useful for plotting and selection
% Run ftp_binaries to obtain binaryList
% directory = "2023";
listSize = length(binaryList);
% localDir = "XBTplotter_downloads"; % save downloaded files here
localDir = localpath + "/XBTplotter_downloads";

% create folder to download binaries
if ~exist(localDir,"dir")
    mkdir(localDir);
end

% Check what's in the local dir already
localFiles = dir(localDir);
localFiles = {localFiles.name};


% open connection with ftp
% host = "ftp.aoml.noaa.gov";
% path = "phod/pub/soopdata/XBT/done/";
host = serv.host;
user = serv.user;
pass = serv.pass;
path = serv.directory;

bar = waitbar(0,"Connecting to server...");
server = ftp(host,user,pass);
waitbar(0.25,bar,"Starting binary file downloads");
% cd(server,"/"); % go to Home dir
% cd(server,path); % set to xbt binaries directory

% download each file to the local dir
previousDir = "-1";

for i = 1:listSize
    startTime = posixtime(datetime('now'));
    status = 0.75 * i/listSize;
    tmp = split(binaryList(i),";");
    directory = tmp(1);
    fileName = tmp(2);
    % Check if file is already in local dir
    test = ismember(fileName,localFiles);
    if sum(test)==0
        if previousDir ~= directory
%             if i ~= 1
%                 cd(server,"/"); % go to Home dir
%             end
            cd(server,"/"); % go to Home dir
            cd(server,path + "/" + directory); % only move to directory if it changed. Saves time
            previousDir = directory; % set current dir as previous dir
        end
        if i == 1
            time = "";
        else
            x = dtime * (listSize-i+1);
            strx = sprintf("%.2f",x);
            time = "  -> " + strx + " minutes remaining";
        end
        waitbar(status, bar, "Downloading file " + string(i) + "/" + string(listSize) + time);
        mget(server,fileName,localDir);
        endTime = posixtime(datetime('now'));
        dtime = (endTime - startTime)/60.0; % minutes each file
    end
%     localFiles = dir(localDir); % list local files
%     localFiles = {localFiles.name};
%     test = ismember(localFiles,fileName);
%     if sum(test)==0
%         mget(server,fileName,localDir);
%     end
%     if ~exist( fullfile(localDir,fileName),"file") % download if it's not in local dir yet
%         mget(server,fileName,localDir);
%     end
end
waitbar(1,bar,"Download finished");
pause(0.3);
close(bar);

% close ftp connection
close(server);

% get variables ready to store as array and then table
% sz = [4 3];
% varTypes = ["double","datetime","string"];
% varNames = ["Temperature","Time","Station"];
% temps = table('Size',sz,'VariableTypes',varTypes,'VariableNames',varNames)
% initialized and preallocate values to table
tableSize = [listSize 10];
varNames = ["Index", "CallSign", "Ship", "Line", "Num", "DateTime", "Latitude", "Longitude", "FileName", "ID"];
varTypes = ["double", "string", "string", "string", "double", "datetime", "double", "double", "string", "string"];
basicMetadata = table('Size', tableSize, 'VariableTypes', varTypes, 'VariableNames', varNames);
% assign array to table as basicMetadata.Index = arr(:)
% assign value by index to table basicMetadata.Index(i) = i
% Open each file and decode basic Metadata for Mapping
for i = 1:listSize
    basicMetadata.Index(i) = i;
    % process file
    tmp = split(binaryList(i),";"); % list comes as dir;file
    fileName = tmp(2);
    file = fullfile( localDir, fileName);
    stringOfBits = get_binary_string(file); % Get contents of file as a string with the binary contents
    newMessageType = get_value(stringOfBits,78,87,"number",1,0); % Use to define start,end bits
    b = bitRange(newMessageType,"dataRanges.csv");
    callSign = get_value(stringOfBits,b("WMO_ID","startBit").(1),b("WMO_ID","endBit").(1),'ascii');
    latitude = get_value(stringOfBits,b("LATITUDE","startBit").(1),b("LATITUDE","endBit").(1),"number",1E5,-9E6);   
    longitude = get_value(stringOfBits,b("LONGITUDE","startBit").(1),b("LONGITUDE","endBit").(1),"number",1E5,-18E6);  
    basicMetadata.ID(i) = string(latitude) + ";" + string(longitude); % used to search the file when clicking on the map
    soopLine = get_value(stringOfBits,b("SOOP_LINE","startBit").(1),b("SOOP_LINE","endBit").(1),"ascii");  
    sequenceNumber = get_value(stringOfBits,b("SEQUENCE_NUMBER","startBit").(1),b("SEQUENCE_NUMBER","endBit").(1),"number",1,0);
    year = get_value(stringOfBits,b("YEAR","startBit").(1),b("YEAR","endBit").(1),"number",1,0);    
    month = get_value(stringOfBits,b("MONTH","startBit").(1),b("MONTH","endBit").(1),"number",1,0);    
    day = get_value(stringOfBits,b("DAY","startBit").(1),b("DAY","endBit").(1),"number",1,0);   
    hour = get_value(stringOfBits,b("HOUR","startBit").(1),b("HOUR","endBit").(1),"number",1,0);    
    minute = get_value(stringOfBits,b("MINUTE","startBit").(1),b("MINUTE","endBit").(1),"number",1,0);    
    shipName = get_value(stringOfBits,b("SHIP_NAME","startBit").(1),b("SHIP_NAME","endBit").(1),"ascii");
    % store data in table ["Index", "CallSign", "Ship", "Line", "Num", "DateTime", "Latitude", "Longitude", "FileName"];
    basicMetadata.CallSign(i) = callSign;
    basicMetadata.Ship(i) = shipName;
    basicMetadata.Line(i) = soopLine;
    basicMetadata.Num(i) = sequenceNumber;
    basicMetadata.DateTime(i) = datetime(year,month,day,hour,minute,0);
    basicMetadata.Latitude(i) = latitude;
    basicMetadata.Longitude(i) = longitude;
    basicMetadata.FileName(i) = binaryList(i);
    
%     disp(basicMetadata);
end

% k = basicMetadata(ismember(basicMetadata.Index,2),'Latitude') returns the
% Latitude of the index 2
