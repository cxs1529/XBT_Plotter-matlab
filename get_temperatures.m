function temperatureArray = get_temperatures(stringOfBits,dataPoints,startBit)
%GET_TEMPERATURES Summary of this function goes here
%   Detailed explanation goes here
    temperatureArray = zeros(dataPoints,1); % initialize and allocate data for faster processing
    count = 1;
    for bitPos = startBit:12:(startBit+(dataPoints-1)*12)
        tempValue = get_value(stringOfBits,bitPos,bitPos+11,"number",100,-400);        
        temperatureArray(count) = tempValue;
        count = count + 1 ;
    end
end

