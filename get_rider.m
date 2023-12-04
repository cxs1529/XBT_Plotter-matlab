% function riderName = get_rider(stringOfBits,dataPoints,SSTstartBit,SSTendBit,tempStartBit,riderBlocks)
function rider = get_rider(stringOfBits,dataPoints,b)
%GET_RIDER_INSTITUTION Summary of this function goes here
%   Detailed explanation goes here
rider.name = "name";
rider.email = "email";
rider.institution = "inst";
rider.phone = "phone";

% get temperature blocks info (size, start, end)
SSTstartBit = b("SEA_SURFACE_TEMPERATURE","startBit").(1);
SSTendBit = b("SEA_SURFACE_TEMPERATURE","endBit").(1);
tempStartBit = b("RIDER_NAME","startBit").(1);
blockSize = SSTendBit - SSTstartBit + 1;

% 1- rider name
riderBlocks = get_value(stringOfBits,b("NUMBER_OF_RIDER_BLOCKS","startBit").(1),b("NUMBER_OF_RIDER_BLOCKS","endBit").(1),"number",1,0);
riderNameStartBit = tempStartBit + dataPoints * blockSize; % locate end of temperature bits
riderNameEndBit = riderNameStartBit + riderBlocks * 40 - 1; % subtract 1 to end bit due to MATLAB indexing. 40 bits: 5 chars
rider.name = get_value(stringOfBits,riderNameStartBit,riderNameEndBit,"ascii");


% 2- rider email
riderEmailBlocks = get_value(stringOfBits,b("NUMBER_OF_RIDER_EMAIL_BLOCKS","startBit").(1),b("NUMBER_OF_RIDER_EMAIL_BLOCKS","endBit").(1),"number",1,0);
riderEmailStartBit = riderNameEndBit + 1;
riderEmailEndBit = riderEmailStartBit + riderEmailBlocks * 40 - 1;
rider.email = get_value(stringOfBits,riderEmailStartBit,riderEmailEndBit,"ascii");


% 3- rider institution
riderInstitutionBlocks = get_value(stringOfBits,b("NUMBER_OF_RIDER_INSTITUTION_BLOCKS","startBit").(1),b("NUMBER_OF_RIDER_INSTITUTION_BLOCKS","endBit").(1),"number",1,0);
riderInstitutionStartBit = riderEmailEndBit + 1;
riderInstitutionEndBit = riderInstitutionStartBit + riderInstitutionBlocks * 40 - 1;
rider.institution = get_value(stringOfBits,riderInstitutionStartBit,riderInstitutionEndBit,"ascii");

% 4- rider phone
riderPhoneBlocks = get_value(stringOfBits,b("NUMBER_OF_RIDER_PHONE_BLOCKS","startBit").(1),b("NUMBER_OF_RIDER_PHONE_BLOCKS","endBit").(1),"number",1,0);
riderPhoneStartBit = riderInstitutionEndBit + 1;
riderPhoneEndBit = riderPhoneStartBit + riderPhoneBlocks * 40 - 1;
rider.phone = get_value(stringOfBits,riderPhoneStartBit,riderPhoneEndBit,"ascii");

% fprintf("Name: %s\n Email: %s\n Institution: %s\n Phone: %s\n", riderName, riderEmail, riderInstitution, riderPhone);


end
