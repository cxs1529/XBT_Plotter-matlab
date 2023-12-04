function agencyName = get_agency(agencyNumber)
%AGENCY takes an integer representing the agency owner and returns the
%complete name
%   Detailed explanation goes here
agencyName = "name";

switch agencyNumber
    case 36001
        agencyName = "Australia, Bureau of Meteorology (BoM)";
    case 36002
        agencyName = "Australia, Joint Australian Facility for Ocean Observing Systems (JAFOOS)";
    case 36003
        agencyName = "Australia, the Commonwealth Scientific and Industrial Research Organisation (CSIRO)";
    case 124001
        agencyName = "Canada, Marine Environmental Data Service (MEDS)";
    case 124002
        agencyName = "Canada, Institute of Ocean Sciences (IOS)";
    case 156001
        agencyName = "China, The State Oceanic Administration";
    case 156002
        agencyName = "China, Second Institute of Oceanography, State Oceanic Administration";
    case 156003
        agencyName = "China, Institute of Ocean Technology";
    case 250001
        agencyName = "France, Institut de Recherche pour le Developpement (IRD)";
    case 250002
        agencyName = "France, Institut Francais de Recherche pour l'Exploitation de la mer (IFREMER)";
    case 276001
        agencyName = "Germany, Bundesamt fuer Seeschiffahrt und Hydrographie (BSH)";
    case 276002
        agencyName = "Germany, Institut fuer Meereskunde, Kiel";
    case 356001
        agencyName = "India, National Institute of Oceanography (NIO)";
    case 356002
        agencyName = "India, National Institute for Ocean Technology (NIOT)";
    case 356003
        agencyName = "India, National Centre for Ocean Information Service";
    case 392001
        agencyName = "Japan, Japan Meteorological Agency (JMA)";
    case 392002
        agencyName = "Japan, Frontier Observational Research System for Global Change";
    case 392003
        agencyName = "Japan, Japan Marine Science and Technology Centre (JAMSTEC)";
    case 410001
        agencyName = "Republic of Korea, Seoul National University";
    case 410002
        agencyName = "Republic of Korea, Korea Ocean Research and Development Institute  (KORDI)";
    case 410003
        agencyName = "Republic of Korea, Meteorological Research Institute";
    case 540001
        agencyName = "New Caledonia, Institut de Recherche pour le Developpement (IRD)";
    case 554001
        agencyName = "New Zealand, National Institute of Water and Atmospheric Research (NIWA)";
    case 643001
        agencyName = "Russian Federation, State Oceanographic Institute of Roshydromet";
    case 643002
        agencyName = "Russian Federation, Federal Service for Hydrometeorology and Environmental Monitoring";
    case 724001
        agencyName = "Spain, Instituto Espanol de Oceanografia";
    case 826001
        agencyName = "United Kingdom, Hydrographic Office";
    case 826002
        agencyName = "United Kingdom, Southampton Oceanography Centre (SOC)";
    case 840001
        agencyName = "USA, NOAA Atlantic Oceanographic and Meteorological Laboratories (AOML)";
    case 840002
        agencyName = "USA, NOAA Pacific Marine Environmental Laboratories (PMEL)";
    case 840003
        agencyName = "USA, Scripps Institution of Oceanography (SIO)";
    case 840004
        agencyName = "USA, Woods Hole Oceanographic Institution (WHOI)";
    case 840005
        agencyName = "USA, University of Washington";
    case 840006
        agencyName = "USA, Naval Oceanographic Office";
    case 1048575
        agencyName = "Missing value";
    otherwise
        agencyName = "unknown";

end
