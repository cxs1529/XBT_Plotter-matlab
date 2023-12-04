function gx = map_plotter(basicMetadata,mapPanel, profilePanel, localDir, metadataPanel, mapType, filePathEditField)

%MAP_PLOTTER Summary of this function goes here
%   Detailed explanation goes here
% basicMetadata["Index", "CallSign", "Ship", "Line", "Num", "DateTime", "Latitude", "Longitude", "FileName", "ID"]
tableLength = length(basicMetadata.Index(:));


% Delete previous geoaxe so there's no overlapping
% If previously created, ax is Children of mapPanel
try
    delete(mapPanel.Children);
catch
    % do nothing
end

% color palette for callsigns red r green g blue b cyan c magenta m yellow
% y
% red = callsignColors(1,:)
% callsignColors = [[1 0 0]; [0 1 0] ;[0 0 1] ;[0 1 1] ;[1 0 1]; [1 1 0]];
colors = ["r" "g" "b" "c" "m" "y"];
previousCS = "-1";
mark = 'r*';
j = 1; % color counter

gx = geoaxes(mapPanel);
geobasemap(gx,mapType.Value);
hold(gx,'on'); % plot all in same map

for i = 1:tableLength
    CS = basicMetadata.CallSign(i);
    test = CS ~= previousCS;
    if test % start with red
        if j > 6 % reset counter and start over from red
            j = 1;
        end
        mark = colors(j) + "*"; % change color if callsign changed
        j = j + 1;
    end
    geoplot(gx,basicMetadata.Latitude(i),basicMetadata.Longitude(i), mark, 'ButtonDownFcn',{@lineCallback, basicMetadata, localDir, profilePanel, metadataPanel, filePathEditField});
    previousCS = CS; % set current callsign as previous for next loop test
end
hold(gx,'off');


end


function lineCallback(src,~, basicMetadata, localDir, profilePanel, metadataPanel, filePathEditField)


    % ~ is the type of event (left click) not used here
    a = get(src);
    src.Color = 'black';
%     if src.Color == [1 0 0] % if red make it black
%         src.Color = 'black';
%     else
%         src.Color = 'red'; % if black make it red again
%     end

%     disp(a.Color);
    clickedID = string(a.LatitudeData) + ";" + string(a.LongitudeData); % ID used to search filename based on lat;lon
%     disp(clickedID);
    file = basicMetadata(ismember(basicMetadata.ID, clickedID),'FileName'); % returns single column table with the fileName as dir;file
%     disp(file);  
    tmp = split(file.FileName(1),";"); % dir;file
    if length(tmp) == 2
        file = tmp(2); % binaryList for remote files as dir;fileName
        % plot profile and display metadata when clicking in map item
        profile_plotter(file, fullfile(localDir,"XBTplotter_downloads"), profilePanel, metadataPanel, filePathEditField);
    else
        file = tmp(1); % binaryList for local files as fileName
        profile_plotter(file, "", profilePanel, metadataPanel, filePathEditField);
    end

    


end