function recorder = get_recorder(recorderNumber)
%GET_RECORDER Takes the recorder number and returns model and sampling
%frequency
%   Detailed explanation goes here
recorder.name = "name";
recorder.freq = 10.0;

switch recorderNumber
    case 1
        recorder.freq = 10.0;
        recorder.name = "Sippican Strip Chart Recorder";
    case 2
        recorder.freq = 10.0;
        recorder.name = "Sippican MK2A/SSQ-61";  
    case 3
        recorder.freq = 10.0;
        recorder.name = "Sippican MK-9";
    case 4
        recorder.freq = 10.0;
        recorder.name = "Sippican AN/BHQ-7/MK8";
    case 5
        recorder.freq = 10.0;
        recorder.name = "Sippican MK-12";
    case 6
        recorder.freq = 10.0;
        recorder.name = "Sippican MK-21";       
    case 10
        recorder.freq = 10.0;
        recorder.name = "Sparton SOC BT/SV Processor Model 10";
    case 11
        recorder.freq = 10.0;
        recorder.name = "Lockheed-Sanders Model QL5005";
    case 20
        recorder.freq = 10.0;
        recorder.name = "ARGOS XBT-ST";      
    case 21
        recorder.freq = 10.0;
        recorder.name = "CLS-ARGOS/Protecno XBT-ST Model-1";
    case 22
        recorder.freq = 10.0;
        recorder.name = "CLS-ARGOS/Protecno XBT-ST Model-2";
    case 30
        recorder.freq = 10.0;
        recorder.name = "Bathy Systems SA-810";
    case 31
        recorder.freq = 10.0;
        recorder.name = "Scripps Metrobyte Controller";
    case 32
        recorder.freq = 10.0;
        recorder.name = "Murayama Denki Z-60-16 III";
    case 33
        recorder.freq = 10.0;
        recorder.name = "Murayama Denki Z-60-16 II";
    case 34
        recorder.freq = 10.0;
        recorder.name = "Protecno ETSM2";
    case 35
        recorder.freq = 10.0;
        recorder.name = "Nautilus Marine Service NMS-XBT";
    case 40
        recorder.freq = 10.0;
        recorder.name = "TSK MK-2A";
    case 41
        recorder.freq = 10.0;
        recorder.name = "TSK MK-2S";
    case 42
        recorder.freq = 10.0;
        recorder.name = "SK MK-30";
    case 43
        recorder.freq = 10.0;
        recorder.name = "TSK MK-30N";
    case 45
        recorder.freq = 10.0;
        recorder.name = "TSK MK-100";
    case 46
        recorder.freq = 10.0;
        recorder.name = "TSK MK-130";
    case 48
        recorder.freq = 10.0;
        recorder.name = "TSK AXBT Receiver MK-300";
    case 50
        recorder.freq = 10.0;
        recorder.name = "JMA ASTOS";
    case 60
        recorder.freq = 10.0;
        recorder.name = "ARGOS Communications, Sampling on up transit";
    case 61
        recorder.freq = 10.0;
        recorder.name = "ARGOS Communications, Sampling on down transit";
    case 62
        recorder.freq = 10.0;
        recorder.name = "Orbcomm Communications, Sampling on up transit";
    case 63
        recorder.freq = 10.0;
        recorder.name = "Orbcomm Communications, Sampling on down transit";
    case 70
        recorder.freq = 10.0;
        recorder.name = "CSIRO Devil-1";
    case 71
        recorder.freq = 10.0;
        recorder.name = "CSIRO Devil-2";
    case 99
        recorder.freq = 10.0;
        recorder.name = "Unknown";
    otherwise
        recorder.freq = 10.0;
        recorder.name = "unknown";

end

