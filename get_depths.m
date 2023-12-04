function depthArray = get_depths(dataPoints, probe, recorder)
%GET_DEPTHS Takes the number of samples and returns the depths
% Coef A,B based on instrument type (int) DeepBlue=52
% SamplingFrequency based on recorder type (int) MK21=6
%     A = 6.691;
%     B = -2.25;
%     samplingFrequency = 10;
    A = probe.coefA;
    B = probe.coefB;
    samplingFrequency = recorder.freq;

    depthArray = zeros(dataPoints,1);
    count = 1;
    
    for n = 1:dataPoints
        time = n/samplingFrequency;
        depthValue = A * time + 0.001 * B * time * time;
        depthArray(count) = depthValue;
        count = count + 1;
    end
end
