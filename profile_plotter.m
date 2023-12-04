function profile_plotter(file, localDir, profilePanel, metadataPanel, filePathEditField)

% binfile = "DCUJ2_20220412000000_N01_XBT.bin";
% binfile = "DGZL_20230101000200_N01_XBT.bin";
binfile = fullfile(localDir,file); % absolute path to binary file
filePathEditField.Value = binfile; % assign full path to CONFIG - CurrentfilepathEditField to be used in export

% Get contents of file as a string with the binary contents
stringOfBits = get_binary_string(binfile);
% disp(stringOfBits);

% Metadata
newMessageType = get_value(stringOfBits,78,87,"number",1,0); % Use to define start,end bits
% get data bit ranges
b = bitRange(newMessageType,"dataRanges.csv"); % Use bit ranges from table b as: b("WMO_ID","startBit").(1) 

% callSign = get_value(stringOfBits,0,71,'ascii');
callSign = get_value(stringOfBits,b("WMO_ID","startBit").(1),b("WMO_ID","endBit").(1),'ascii');
% latitude = get_value(stringOfBits,88,112,"number",1E5,-9E6);
latitude = get_value(stringOfBits,b("LATITUDE","startBit").(1),b("LATITUDE","endBit").(1),"number",1E5,-9E6);
% longitude = get_value(stringOfBits,113,138,"number",1E5,-18E6);
longitude = get_value(stringOfBits,b("LONGITUDE","startBit").(1),b("LONGITUDE","endBit").(1),"number",1E5,-18E6);
% soopLine = get_value(stringOfBits,139,186,"ascii");
soopLine = get_value(stringOfBits,b("SOOP_LINE","startBit").(1),b("SOOP_LINE","endBit").(1),"ascii");
% transectNumber = get_value(stringOfBits,187,193,"number",1,0);
transectNumber = get_value(stringOfBits,b("TRANSECT_NUMBER","startBit").(1),b("TRANSECT_NUMBER","endBit").(1),"number",1,0);
% sequenceNumber = get_value(stringOfBits,194,209,"number",1,0);
sequenceNumber = get_value(stringOfBits,b("SEQUENCE_NUMBER","startBit").(1),b("SEQUENCE_NUMBER","endBit").(1),"number",1,0);
% year = get_value(stringOfBits,210,221,"number",1,0);
year = get_value(stringOfBits,b("YEAR","startBit").(1),b("YEAR","endBit").(1),"number",1,0);
% month = get_value(stringOfBits,222,225,"number",1,0);
month = get_value(stringOfBits,b("MONTH","startBit").(1),b("MONTH","endBit").(1),"number",1,0);
% day = get_value(stringOfBits,226,231,"number",1,0);
day = get_value(stringOfBits,b("DAY","startBit").(1),b("DAY","endBit").(1),"number",1,0);
% hour = get_value(stringOfBits,232,236,"number",1,0);
hour = get_value(stringOfBits,b("HOUR","startBit").(1),b("HOUR","endBit").(1),"number",1,0);
% minute = get_value(stringOfBits,237,242,"number",1,0);
minute = get_value(stringOfBits,b("MINUTE","startBit").(1),b("MINUTE","endBit").(1),"number",1,0);
% shipName = get_value(stringOfBits,243,482,"ascii");
shipName = get_value(stringOfBits,b("SHIP_NAME","startBit").(1),b("SHIP_NAME","endBit").(1),"ascii");
% seasVersion = get_value(stringOfBits,539,548,"number",1,0);
seasVersion = get_value(stringOfBits,b("SEAS_VERSION","startBit").(1),b("SEAS_VERSION","endBit").(1),"number",1,0);

% probeSerialNumber = get_value(stringOfBits,549,572,"number",1,0);
probeSerialNumber = get_value(stringOfBits,b("PROBE_SERIAL_NUMBER","startBit").(1),b("PROBE_SERIAL_NUMBER","endBit").(1),"number",1,0);
% launchHeight = get_value(stringOfBits,579,591,"number",1E2,0);
launchHeight = get_value(stringOfBits,b("LAUNCH_HEIGHT","startBit").(1),b("LAUNCH_HEIGHT","endBit").(1),"number",1E2,0);
% shipDirection = get_value(stringOfBits,592,600,"number",1,0);
shipDirection = get_value(stringOfBits,b("SHIP_DIRECTION","startBit").(1),b("SHIP_DIRECTION","endBit").(1),"number",1,0);
% shipSpeed = get_value(stringOfBits,601,613,"number",1E2,0) * 1.94384;
shipSpeed = get_value(stringOfBits,b("SHIP_SPEED","startBit").(1),b("SHIP_SPEED","endBit").(1),"number",1E2,0) * 1.94384; % m/s to kt
% instrumentType = get_value(stringOfBits,614,623,"number",1,0);
instrumentType = get_value(stringOfBits,b("INSTRUMENT_TYPE","startBit").(1),b("INSTRUMENT_TYPE","endBit").(1),"number",1,0);
% recorderType = get_value(stringOfBits,624,630,"number",1,0);
recorderType = get_value(stringOfBits,b("RECORDER_TYPE","startBit").(1),b("RECORDER_TYPE","endBit").(1),"number",1,0);
% agencyOwner = get_value(stringOfBits,707,726,"number",1,0);
agencyOwner = get_value(stringOfBits,b("AGENCY_OWNER","startBit").(1),b("AGENCY_OWNER","endBit").(1),"number",1,0);
% xbtLauncherType = get_value(stringOfBits,727,734,"number",1,0);
xbtLauncherType = get_value(stringOfBits,b("XBT_LAUNCHER_TYPE","startBit").(1),b("XBT_LAUNCHER_TYPE","endBit").(1),"number",1,0);
% xbrRecorderSerialNumber = get_value(stringOfBits,735,798,"number",1,0);
% totalWaterDepth = get_value(stringOfBits,693,706,"number",1,0);
totalWaterDepth = get_value(stringOfBits,b("TOTAL_WATER_DEPTH","startBit").(1),b("TOTAL_WATER_DEPTH","endBit").(1),"number",1,0);
% riderName = get_rider_name(stringOfBits,dataPoints,891);

% dataPoints = get_value(stringOfBits,875,890,"number",1,0);
dataPoints = get_value(stringOfBits,b("TIMES_REPLICATED","startBit").(1),b("TIMES_REPLICATED","endBit").(1),"number",1,0);
% Rider info
rider = get_rider(stringOfBits, dataPoints, b); % object rider.name .institution .email . phone

% get relevant data to determine depths
probe = get_probe(instrumentType); % returns name, coefA, coefB, maxDepth
recorder = get_recorder(recorderType); % returns name and freq

% Data values Temperature vs Depth
% temperatureArray = get_temperatures(stringOfBits,dataPoints,891);
temperatureArray = get_temperatures(stringOfBits,dataPoints,b("SEA_SURFACE_TEMPERATURE","startBit").(1));
depthArray = get_depths(dataPoints, probe, recorder);

date_time = datetime(year,month,day,hour,minute,0);

% DISPLAY IN CONSOLE
display = 0;
if display
    fprintf("CallSign: %s | ShipName: %s | Direction: %i | Speed: %.1f  \n", callSign, shipName, shipDirection, shipSpeed);
    fprintf("Line: %s | Transect No.: %i | Seq. No.: %i | Agency: %s (%i)\n", soopLine, transectNumber, sequenceNumber, get_agency(agencyOwner), agencyOwner);
    fprintf("Lat: %.3f | Lon: %.3f | Date-time: %s | Total Water Depth: %i | MsgType: %i\n", latitude, longitude, date_time, totalWaterDepth ,newMessageType);
    fprintf("SEASVersion: %i | Launch Height: %i | Launcher Type: %s (%i)\n", seasVersion, launchHeight, get_launcher(xbtLauncherType), xbtLauncherType);
    fprintf("Probe: %s (%i) | Probe SN: %i | A: %.2f | B: %.2f | MaxDepth: %i \n", probe.name, instrumentType, probeSerialNumber, probe.coefA, probe.coefB, probe.maxDepth );
    fprintf("Recorder type: %s (%i) | Sampling Frequency: %.1f\n", recorder.name, recorderType, recorder.freq );
    fprintf("Institution: %s | Rider: %s | Email: %s | Phone: %s\n", rider.institution, rider.name, rider.email, rider.phone);
end

% PLOT PROFILE
% Delete previous axes so there's no overlapping
% If previously created, ax is Children of profilePanel
try
    delete(profilePanel.Children);
catch
    % do nothing
end
ax = axes(profilePanel);
plot(ax,temperatureArray,-depthArray);
if localDir == ""
    [filepath,name,ext] = fileparts(file);
    titleName = name + ext;  
    title(ax,titleName, 'Interpreter', 'none', FontSize=8 );
else
    titleName = file;
    title(ax,titleName, 'Interpreter', 'none', FontSize=8 );
end
xlabel(ax,"Temperature [" + char(176) +"C]");
ylabel(ax,"Depth [m]");
grid(ax,'on');

% DISPLAY PROFILE METADATA IN TEXT AREA
line1 = sprintf("CallSign     \t\t|  %s\nShipName     \t\t|  %s\nDirection    \t\t|  %i deg\nSpeed        \t\t|  %.1f kt\n", callSign, shipName, shipDirection, shipSpeed);
line2 = sprintf("Line         \t\t|  %s\nTransect No. \t\t|  %i\nSeq. No.     \t\t|  %i\nAgency      \t\t|  %s (%i)\n", soopLine, transectNumber, sequenceNumber, get_agency(agencyOwner), agencyOwner);
line3 = sprintf("Latitude     \t\t|  %.3f deg\nLongitude    \t\t|  %.3f deg\nDate-time    \t\t|  %s\nWater Depth  \t\t|  %i m\nMsgType      \t\t|  %i\n", latitude, longitude, date_time, totalWaterDepth ,newMessageType);
line4 = sprintf("SEASVersion  \t|  %i\nLaunch Height\t\t|  %i m\nLauncher Type\t|  %s (%i)\n", seasVersion, launchHeight, get_launcher(xbtLauncherType), xbtLauncherType);
line5 = sprintf("Probe        \t\t|  %s (%i)\nProbe SN     \t\t|  %i\nCoef. A      \t\t|  %.2f\nCoef. B      \t\t|  %.2f\nMax Depth    \t\t|  %i m\n", probe.name, instrumentType, probeSerialNumber, probe.coefA, probe.coefB, probe.maxDepth );
line6 = sprintf("Recorder Type\t|  %s (%i)\nSampling Freq.\t|  %.1f Hz\n", recorder.name, recorderType, recorder.freq );
line7 = sprintf("Institution  \t\t|  %s\nRider        \t\t|  %s\nEmail        \t\t|  %s\nPhone        \t\t|  %s\n", rider.institution, rider.name, rider.email, rider.phone);
metaText = line1 + line2 + line3 + line4 + line5 + line6 + line7;

metadataPanel.Value = metaText;

% metadataPanel.Value = titleName + newline + "\n----------------------------------------\n" + ... 
%     + newline + metaText + newline + newline + depth_temperature(depthArray,temperatureArray); % export to file

end



% return string with depths temperatures in 2 columns
function text = depth_temperature(d,t)
    text = "Depth[m] Temperature[" + char(176) + "C" + newline;
    len = length(d);

    for i = 1:len
        text = text + string(d) + " " + string(t) + newline;
    end



end