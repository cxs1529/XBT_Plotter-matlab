function launcherName = get_launcher(launcherNumber)
%XBTLAUNCHER Takes the launcher number and returns the model name
%   Detailed explanation goes here
launcherName = "name";

switch launcherNumber
    case 0
        launcherName = "Unknown";
    case 1
        launcherName = "LM-2A Deck-mounted";
    case 2
        launcherName = "LM-3A Hand-Held";
    case 3
        launcherName = "LM-4A Thru-Hull";
    case 10
        launcherName = "AL-12 TSK Autolauncher (up to 12 Probes)";
    case 20
        launcherName = "SIO XBT Autolauncher (up to 6 probes)";
    case 30
        launcherName = "AOML XBT V6 Autolauncher (up to 6 Deep Blue probes)";
    case 31
        launcherName = "AOML XBT V8.0 Autolauncher (up to 8 Deep Blue probes)";
    case 32
        launcherName = "AOML XBT V8.1 Autolauncher (up to 8 Deep Blue and Fast Deep probes)";
    case 90
        launcherName = "CSIRO Devil Autolauncher";
    case 91
        launcherName = "TURO/CSIRO Quoll Autolauncher";
    case 100
        launcherName = "MFSTEP Autolauncher (Mediterranean)";
    case 255
        launcherName = "Missing";
    otherwise
        launcherName = "unknown";

end

