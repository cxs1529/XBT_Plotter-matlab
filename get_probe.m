function probe = get_probe(probeNumber)
%GET_PROBE Takes the instrument number and returns name, coefA, coefB and maxDepth
%   Detailed explanation goes here
probe.coefA = 1.0;
probe.coefB = 1.0;
probe.maxDepth = 1;
probe.name = "name";

switch probeNumber
    case 1
        probe.coefA = 6.472;
        probe.coefB = -2.16;
        probe.maxDepth = 460;
        probe.name = "Sippican T-4";
    case 2
        probe.coefA = 6.691;
        probe.coefB = -2.25;
        probe.maxDepth = 460;
        probe.name = "Sippican T-4";
    case 11
        probe.coefA = 6.828;
        probe.coefB = -1.82;
        probe.maxDepth = 1830;
        probe.name = "Sippican T-5";
    case 21
        probe.coefA = 6.390;
        probe.coefB = -1.82;
        probe.maxDepth = 1000;
        probe.name =  "Sippican Fast Deep";
    case 31
        probe.coefA = 6.472;
        probe.coefB = -2.16;
        probe.maxDepth = 460;
        probe.name =  "Sippican T-6";
    case 32
        probe.coefA = 6.691;
        probe.coefB = -2.25;
        probe.maxDepth = 460;
        probe.name =  "Sippican T-6";
    case 41
        probe.coefA = 6.472;
        probe.coefB = -2.16;
        probe.maxDepth = 760;
        probe.name =  "Sippican T-7";
    case 42
        probe.coefA = 6.691;
        probe.coefB = -2.25;
        probe.maxDepth = 760;
        probe.name =  "Sippican T-7";
    case 51
        probe.coefA = 6.472;
        probe.coefB = -2.16;
        probe.maxDepth = 760;
        probe.name =  "Sippican Deep Blue";
    case 52
        probe.coefA = 6.691;
        probe.coefB = -2.25;
        probe.maxDepth = 760;
        probe.name =  "Sippican Deep Blue";        
    case 61
        probe.coefA = 6.301;
        probe.coefB = -2.16;
        probe.maxDepth = 200;
        probe.name =  "Sippican T-10";    
    case 71
        probe.coefA = 1.779;
        probe.coefB = -0.255;
        probe.maxDepth = 460;
        probe.name =  "Sippican T-11";        
    case 81
        probe.coefA = 1.52;
        probe.coefB = 0.0;
        probe.maxDepth = 460;
        probe.name =  "Sippican AXBT";
    case 201
        probe.coefA = 6.472;
        probe.coefB = -2.16;
        probe.maxDepth = 460;
        probe.name =  "TSK T-4";
    case 202
        probe.coefA = 6.691;
        probe.coefB = -2.25;
        probe.maxDepth = 460;
        probe.name =  "TSK T-4";
    case 211
        probe.coefA = 6.472;
        probe.coefB = -2.16;
        probe.maxDepth = 460;
        probe.name =  "TSK T-6";
    case 212
        probe.coefA = 6.691;
        probe.coefB = -2.25;
        probe.maxDepth = 460;
        probe.name =  "TSK T-6";
    case 221
        probe.coefA = 6.472;
        probe.coefB = -2.16;
        probe.maxDepth = 760;
        probe.name =  "TSK T-7";
    case 222
        probe.coefA = 6.691;
        probe.coefB = -2.25;
        probe.maxDepth = 760;
        probe.name =  "TSK T-7";
    case 231
        probe.coefA = 6.828;
        probe.coefB = -1.82;
        probe.maxDepth = 1830;
        probe.name =  "TSK T-5";
    case 241
        probe.coefA = 6.301;
        probe.coefB = -2.16;
        probe.maxDepth = 200;
        probe.name =  "TSK T-10";
    case 251
        probe.coefA = 6.472;
        probe.coefB = -2.16;
        probe.maxDepth = 760;
        probe.name =  "TSK Deep Blue";
    case 252
        probe.coefA = 6.691;
        probe.coefB = -2.25;
        probe.maxDepth = 760;
        probe.name =  "TSK Deep Blue";
    case 261
        probe.coefA = -1;
        probe.coefB = -1;
        probe.maxDepth = 4000;
        probe.name =  "TSK AXBT";
    case 401
        probe.coefA = 6.301;
        probe.coefB = -2.16;
        probe.maxDepth = 4000;
        probe.name =  "Sparton XBT-1";
    case 411
        probe.coefA = 5.861;
        probe.coefB = -0.0904;
        probe.maxDepth = 4000;
        probe.name =  "Sparton XBT-3";        
    case 421
        probe.coefA = 6.472;
        probe.coefB = -2.16;
        probe.maxDepth = 4000;
        probe.name =  "Sparton XBT-4";  
    case 431
        probe.coefA = 6.828;
        probe.coefB = -1.82;
        probe.maxDepth = 4000;
        probe.name =  "Sparton XBT-5";       
    case 441
        probe.coefA = 6.828;
        probe.coefB = -1.82;
        probe.maxDepth = 4000;
        probe.name =  "Sparton XBT-5DB";      
    case 451
        probe.coefA = 6.472;
        probe.coefB = -2.16;
        probe.maxDepth = 4000;
        probe.name =  "Sparton XBT-6";      
    case 461
        probe.coefA = 6.472;
        probe.coefB = -2.16;
        probe.maxDepth = 4000;
        probe.name =  "Sparton XBT-7"; 
    case 462
        probe.coefA = 6.705;
        probe.coefB = -2.28;
        probe.maxDepth = 4000;
        probe.name =  "Sparton XBT-7"; 
    case 471
        probe.coefA = 6.472;
        probe.coefB = -2.16;
        probe.maxDepth = 4000;
        probe.name =  "Sparton XBT-7DB";      
    case 481
        probe.coefA = 6.301;
        probe.coefB = -2.16;
        probe.maxDepth = 4000;
        probe.name =  "Sparton XBT-10";  
    case 491
        probe.coefA = 6.472;
        probe.coefB = -2.16;
        probe.maxDepth = 4000;
        probe.name =  "Sparton XBT-20";  
    case 501
        probe.coefA = 6.472;
        probe.coefB = -2.16;
        probe.maxDepth = 4000;
        probe.name =  "Sparton XBT-20DB";     
    case 510
        probe.coefA = 1.524;
        probe.coefB = 0.0;
        probe.maxDepth = 4000;
        probe.name =  "Sparton 536 AXBT-7";   
    case 900
        probe.coefA = 9.727;
        probe.coefB = -0.0000473;
        probe.maxDepth = 2000;
        probe.name =  "Sippican T-12 (LMP5-T1)";         
    otherwise
        probe.coefA = -99;
        probe.coefB = -99;
        probe.maxDepth = -99;
        probe.name =  "unknown";

end
