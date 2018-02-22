-- MANUAL CONTENT CURATION
# Update Org table to set value for 'non-partner' institution
UPDATE `orgs` SET `is_other` = 1 WHERE `name` = "Non Partner Institution";
UPDATE `orgs` SET `links` = '{"org":[]}';

-- ******************************************************************************
-- ******************************************************************************
-- ******************************************************************************

UPDATE `languages` SET `default_language` = 0;
UPDATE `languages` SET `default_language` = 1 WHERE `abbreviation` = 'en_US';

-- ******************************************************************************
-- ******************************************************************************
-- ******************************************************************************

-- Update the Org records 
UPDATE `orgs` SET `name` = 'Alfred P. Sloan Foundation', `abbreviation` = 'Sloan', `org_type` = 2 WHERE `id` = 141;
UPDATE `orgs` SET `name` = 'American University (AU)', `abbreviation` = 'AU', `org_type` = 1 WHERE `id` = 56;
UPDATE `orgs` SET `name` = 'Appalachian State University', `abbreviation` = 'Appalachian State', `org_type` = 1 WHERE `id` = 169;
UPDATE `orgs` SET `name` = 'Arizona State University (ASU)', `abbreviation` = 'ASU', `org_type` = 1 WHERE `id` = 20;
UPDATE `orgs` SET `name` = 'Augusta University', `abbreviation` = 'Augusta', `org_type` = 1 WHERE `id` = 173;
UPDATE `orgs` SET `name` = 'Auraria Library (UCD, MSU Denver, CCD)', `abbreviation` = 'Auraria', `org_type` = 1 WHERE `id` = 224;
UPDATE `orgs` SET `name` = 'Baylor University', `abbreviation` = 'Baylor', `org_type` = 1 WHERE `id` = 102;
UPDATE `orgs` SET `name` = 'Binghamton University', `abbreviation` = 'Binghamton', `org_type` = 1 WHERE `id` = 209;
UPDATE `orgs` SET `name` = 'Boise State University', `abbreviation` = 'Boise State', `org_type` = 1 WHERE `id` = 89;
UPDATE `orgs` SET `name` = 'Boston College (BC)', `abbreviation` = 'BC', `org_type` = 1 WHERE `id` = 163;
UPDATE `orgs` SET `name` = 'Boston University (BU)', `abbreviation` = 'BU', `org_type` = 1 WHERE `id` = 87;
UPDATE `orgs` SET `name` = 'Brandeis University', `abbreviation` = 'Brandeis', `org_type` = 1 WHERE `id` = 97;
UPDATE `orgs` SET `name` = 'Brown University', `abbreviation` = 'Brown', `org_type` = 1 WHERE `id` = 149;
UPDATE `orgs` SET `name` = 'California Institute of Technology', `abbreviation` = 'Caltech', `org_type` = 1 WHERE `id` = 225;
UPDATE `orgs` SET `name` = 'California Polytechnic State University-San Luis Obispo (CalPolySLO)', `abbreviation` = 'CalPolySLO', `org_type` = 1 WHERE `id` = 45;
UPDATE `orgs` SET `name` = 'California State University, Chico (CSU Chico)', `abbreviation` = 'CSU Chico', `org_type` = 1 WHERE `id` = 41;
UPDATE `orgs` SET `name` = 'California State University, Fresno (CSU Fresno)', `abbreviation` = 'CSU Fresno', `org_type` = 1 WHERE `id` = 30;
UPDATE `orgs` SET `name` = 'California State University, Fullerton (CSU Fullerton)', `abbreviation` = 'CSU Fullerton', `org_type` = 1 WHERE `id` = 219;
UPDATE `orgs` SET `name` = 'California State University, Los Angeles (CSULA)', `abbreviation` = 'CSULA', `org_type` = 1 WHERE `id` = 29;
UPDATE `orgs` SET `name` = 'California State University, Northridge (CSUN)', `abbreviation` = 'CSUN', `org_type` = 1 WHERE `id` = 221;
UPDATE `orgs` SET `name` = 'California State University, Office of the Chancellor (CSU)', `abbreviation` = 'CSU', `org_type` = 1 WHERE `id` = 27;
UPDATE `orgs` SET `name` = 'California State University, San Marcos (CSUSM)', `abbreviation` = 'CSUSM', `org_type` = 1 WHERE `id` = 61;
UPDATE `orgs` SET `name` = 'Carleton College', `abbreviation` = 'Carleton', `org_type` = 1 WHERE `id` = 161;
UPDATE `orgs` SET `name` = 'Carnegie Mellon University (CMU)', `abbreviation` = 'CMU', `org_type` = 1 WHERE `id` = 84;
UPDATE `orgs` SET `name` = 'Case Western Reserve University (CWRU)', `abbreviation` = 'CWRU', `org_type` = 1 WHERE `id` = 144;
UPDATE `orgs` SET `name` = 'City University of New York (CUNY)', `abbreviation` = 'CUNY', `org_type` = 1 WHERE `id` = 204;
UPDATE `orgs` SET `name` = 'Clemson University', `abbreviation` = 'Clemson', `org_type` = 1 WHERE `id` = 54;
UPDATE `orgs` SET `name` = 'College of William and Mary', `abbreviation` = 'William and Mary', `org_type` = 1 WHERE `id` = 165;
UPDATE `orgs` SET `name` = 'Colorado School of Mines (CSM)', `abbreviation` = 'CSM', `org_type` = 1 WHERE `id` = 199;
UPDATE `orgs` SET `name` = 'Columbia University', `abbreviation` = 'Columbia', `org_type` = 1 WHERE `id` = 113;
UPDATE `orgs` SET `name` = 'Cornell University', `abbreviation` = 'Cornell', `org_type` = 1 WHERE `id` = 77;
UPDATE `orgs` SET `name` = 'Dartmouth College', `abbreviation` = 'Dartmouth', `org_type` = 1 WHERE `id` = 107;
UPDATE `orgs` SET `name` = 'Data Observation Network for Earth (DataONE)', `abbreviation` = 'DataONE', `org_type` = 3 WHERE `id` = 186;
UPDATE `orgs` SET `name` = 'Department of Defense (DOD)', `abbreviation` = 'DOD', `org_type` = 2 WHERE `id` = 210;
UPDATE `orgs` SET `name` = 'Department of Energy (DOE)', `abbreviation` = 'DOE', `org_type` = 2 WHERE `id` = 145;
UPDATE `orgs` SET `name` = 'Department of Transportation (DOT)', `abbreviation` = 'DOT', `org_type` = 2 WHERE `id` = 205;
UPDATE `orgs` SET `name` = 'Digital Curation Centre (DCC)', `abbreviation` = 'DCC', `org_type` = 3 WHERE `id` = 207;
UPDATE `orgs` SET `name` = 'Drexel University', `abbreviation` = 'Drexel', `org_type` = 1 WHERE `id` = 69;
UPDATE `orgs` SET `name` = 'Duke University', `abbreviation` = 'Duke', `org_type` = 1 WHERE `id` = 93;
UPDATE `orgs` SET `name` = 'East Carolina University (ECU)', `abbreviation` = 'ECU', `org_type` = 1 WHERE `id` = 104;
UPDATE `orgs` SET `name` = 'Emory University', `abbreviation` = 'Emory', `org_type` = 1 WHERE `id` = 67;
UPDATE `orgs` SET `name` = 'Florida Atlantic University (FAU)', `abbreviation` = 'FAU', `org_type` = 1 WHERE `id` = 214;
UPDATE `orgs` SET `name` = 'Florida State University (FSU)', `abbreviation` = 'FSU', `org_type` = 1 WHERE `id` = 162;
UPDATE `orgs` SET `name` = 'GATACA LLC', `abbreviation` = 'GATACA', `org_type` = 3 WHERE `id` = 174;
UPDATE `orgs` SET `name` = 'George Mason University (GMU)', `abbreviation` = 'GMU', `org_type` = 1 WHERE `id` = 42;
UPDATE `orgs` SET `name` = 'George Washington University (GWU)', `abbreviation` = 'GWU', `org_type` = 1 WHERE `id` = 106;
UPDATE `orgs` SET `name` = 'Georgetown University', `abbreviation` = 'Georgetown', `org_type` = 1 WHERE `id` = 109;
UPDATE `orgs` SET `name` = 'Georgia Southern University', `abbreviation` = 'Georgia Southern University', `org_type` = 1 WHERE `id` = 195;
UPDATE `orgs` SET `name` = 'Georgia State University (GSU)', `abbreviation` = 'GSU', `org_type` = 1 WHERE `id` = 68;
UPDATE `orgs` SET `name` = 'Georgia Tech', `abbreviation` = 'GaTech', `org_type` = 1 WHERE `id` = 49;
UPDATE `orgs` SET `name` = 'Gordon and Betty Moore Foundation (GBMF)', `abbreviation` = 'GBMF', `org_type` = 2 WHERE `id` = 121;
UPDATE `orgs` SET `name` = 'Grand Valley State University (GVSU)', `abbreviation` = 'GVSU', `org_type` = 1 WHERE `id` = 111;
UPDATE `orgs` SET `name` = 'Griffith University', `abbreviation` = 'Griffith', `org_type` = 1 WHERE `id` = 194;
UPDATE `orgs` SET `name` = 'Gulf of Mexico Research Initiative (GoMRI)', `abbreviation` = 'GoMRI', `org_type` = 2 WHERE `id` = 125;
UPDATE `orgs` SET `name` = 'Harvard University', `abbreviation` = 'Harvard', `org_type` = 1 WHERE `id` = 108;
UPDATE `orgs` SET `name` = 'Harvey Mudd College (HMC)', `abbreviation` = 'HMC', `org_type` = 1 WHERE `id` = 187;
UPDATE `orgs` SET `name` = 'Humboldt State University (HSU)', `abbreviation` = 'HSU', `org_type` = 1 WHERE `id` = 37;
UPDATE `orgs` SET `name` = 'Indiana University (IU)', `abbreviation` = 'IU', `org_type` = 1 WHERE `id` = 52;
UPDATE `orgs` SET `name` = 'Institute of Education Sciences (US Dept of Education IES)', `abbreviation` = 'IES', `org_type` = 2 WHERE `id` = 126;
UPDATE `orgs` SET `name` = 'Institute of Museum and Library Services (IMLS)', `abbreviation` = 'IMLS', `org_type` = 2 WHERE `id` = 122;
UPDATE `orgs` SET `name` = 'Instituto Tecnologico de Costa Rica (TEC)', `abbreviation` = 'TEC', `org_type` = 1 WHERE `id` = 226;
UPDATE `orgs` SET `name` = 'Interdisciplinary Earth Data Alliance (IEDA)', `abbreviation` = 'IEDA', `org_type` = 3 WHERE `id` = 202;
UPDATE `orgs` SET `name` = 'International Center for Agricultural Research in Dry Areas (ICARDA)', `abbreviation` = 'ICARDA', `org_type` = 3 WHERE `id` = 185;
UPDATE `orgs` SET `name` = 'Iowa State University', `abbreviation` = 'IA State', `org_type` = 1 WHERE `id` = 57;
UPDATE `orgs` SET `name` = 'James Madison University (JMU)', `abbreviation` = 'JMU', `org_type` = 1 WHERE `id` = 44;
UPDATE `orgs` SET `name` = 'Johns Hopkins University (JHU)', `abbreviation` = 'JHU', `org_type` = 1 WHERE `id` = 33;
UPDATE `orgs` SET `name` = 'Joint Fire Science Program (JFSP)', `abbreviation` = 'JFSP', `org_type` = 2 WHERE `id` = 127;
UPDATE `orgs` SET `name` = 'Kansas State University (KSU)', `abbreviation` = 'KSU', `org_type` = 1 WHERE `id` = 143;
UPDATE `orgs` SET `name` = 'Kent State University', `abbreviation` = 'Kent State', `org_type` = 1 WHERE `id` = 182;
UPDATE `orgs` SET `name` = 'Lawrence Berkeley National Laboratory (LBL)', `abbreviation` = 'LBL', `org_type` = 1 WHERE `id` = 100;
UPDATE `orgs` SET `name` = 'Lawrence Livermore National Lab (LLNL)', `abbreviation` = 'LLNL', `org_type` = 1 WHERE `id` = 176;
UPDATE `orgs` SET `name` = 'Lehigh University', `abbreviation` = 'Lehigh', `org_type` = 1 WHERE `id` = 105;
UPDATE `orgs` SET `name` = 'Los Alamos National Laboratory (LANL)', `abbreviation` = 'LANL', `org_type` = 1 WHERE `id` = 151;
UPDATE `orgs` SET `name` = 'Louisiana State University (LSU)', `abbreviation` = 'LSU', `org_type` = 1 WHERE `id` = 140;
UPDATE `orgs` SET `name` = 'Marine Biological Laboratory (MBL)', `abbreviation` = 'MBL', `org_type` = 3 WHERE `id` = 154;
UPDATE `orgs` SET `name` = 'Massachusetts Institute of Technology (MIT)', `abbreviation` = 'MIT', `org_type` = 1 WHERE `id` = 190;
UPDATE `orgs` SET `name` = 'Mayo Clinic', `abbreviation` = 'Mayo', `org_type` = 3 WHERE `id` = 189;
UPDATE `orgs` SET `name` = 'Miami University ', `abbreviation` = 'miamioh', `org_type` = 1 WHERE `id` = 115;
UPDATE `orgs` SET `name` = 'Michigan State University (MSU)', `abbreviation` = 'MSU', `org_type` = 1 WHERE `id` = 24;
UPDATE `orgs` SET `name` = 'Mississippi State University', `abbreviation` = 'Mississippi State', `org_type` = 1 WHERE `id` = 158;
UPDATE `orgs` SET `name` = 'Missouri University of Science and Technology (MST)', `abbreviation` = 'MST', `org_type` = 1 WHERE `id` = 181;
UPDATE `orgs` SET `name` = 'Montana State University (MSU)', `abbreviation` = 'MSU', `org_type` = 1 WHERE `id` = 114;
UPDATE `orgs` SET `name` = 'Moss Landing Marine Laboratories (CSU MLML)', `abbreviation` = 'MLML', `org_type` = 3 WHERE `id` = 28;
UPDATE `orgs` SET `name` = 'Nanyang Technological University, Singapore (NTU)', `abbreviation` = 'NTU', `org_type` = 1 WHERE `id` = 155;
UPDATE `orgs` SET `name` = 'National Aeronautics and Space Administration (NASA)', `abbreviation` = 'NASA', `org_type` = 2 WHERE `id` = 206;
UPDATE `orgs` SET `name` = 'National Endowment for the Humanities (NEH)', `abbreviation` = 'NEH', `org_type` = 2 WHERE `id` = 120;
UPDATE `orgs` SET `name` = 'National Institute of Justice (DOJ)', `abbreviation` = 'NIJ-DOJ', `org_type` = 2 WHERE `id` = 146;
UPDATE `orgs` SET `name` = 'National Institutes of Health (NIH)', `abbreviation` = 'NIH', `org_type` = 2 WHERE `id` = 123;
UPDATE `orgs` SET `name` = 'National Oceanic and Atmospheric Administration (NOAA)', `abbreviation` = 'NOAA', `org_type` = 2 WHERE `id` = 124;
UPDATE `orgs` SET `name` = 'National Science Foundation (NSF)', `abbreviation` = 'NSF', `org_type` = 2 WHERE `id` = 119;
UPDATE `orgs` SET `name` = 'Natural Resources Institute Finland (LUKE)', `abbreviation` = 'LUKE', `org_type` = 3 WHERE `id` = 183;
UPDATE `orgs` SET `name` = 'New York University (NYU)', `abbreviation` = 'NYU', `org_type` = 1 WHERE `id` = 78;
UPDATE `orgs` SET `name` = 'Non Partner Institution', `abbreviation` = 'Non-Partner', `org_type` = 1 WHERE `id` = 0;
UPDATE `orgs` SET `name` = 'North Carolina State University (NCSU)', `abbreviation` = 'NCSU', `org_type` = 1 WHERE `id` = 32;
UPDATE `orgs` SET `name` = 'Northeast Ohio Medical University (NEOMED)', `abbreviation` = 'NEOMED', `org_type` = 1 WHERE `id` = 216;
UPDATE `orgs` SET `name` = 'Northeastern University (NEU)', `abbreviation` = 'NEU', `org_type` = 1 WHERE `id` = 38;
UPDATE `orgs` SET `name` = 'Northern Arizona University (NAU)', `abbreviation` = 'NAU', `org_type` = 1 WHERE `id` = 138;
UPDATE `orgs` SET `name` = 'Northwestern University (NU)', `abbreviation` = 'NU', `org_type` = 1 WHERE `id` = 22;
UPDATE `orgs` SET `name` = 'Oak Ridge National Laboratory (ORNL)', `abbreviation` = 'ORNL', `org_type` = 1 WHERE `id` = 148;
UPDATE `orgs` SET `name` = 'Oakland University', `abbreviation` = 'Oakland', `org_type` = 1 WHERE `id` = 212;
UPDATE `orgs` SET `name` = 'Ohio State University (OSU)', `abbreviation` = 'OSU', `org_type` = 1 WHERE `id` = 17;
UPDATE `orgs` SET `name` = 'Oklahoma State University', `abbreviation` = 'Okstate', `org_type` = 1 WHERE `id` = 92;
UPDATE `orgs` SET `name` = 'Old Dominion University (ODU)', `abbreviation` = 'ODU', `org_type` = 1 WHERE `id` = 36;
UPDATE `orgs` SET `name` = 'Oregon State University', `abbreviation` = 'Oregon State', `org_type` = 1 WHERE `id` = 55;
UPDATE `orgs` SET `name` = 'Partnerships for Enhanced Engagement in Research (PEER)', `abbreviation` = 'PEER', `org_type` = 3 WHERE `id` = 223;
UPDATE `orgs` SET `name` = 'Pennsylvania State University (PSU)', `abbreviation` = 'PSU', `org_type` = 1 WHERE `id` = 25;
UPDATE `orgs` SET `name` = 'Portland State University (PDX)', `abbreviation` = 'PDX', `org_type` = 1 WHERE `id` = 62;
UPDATE `orgs` SET `name` = 'Princeton University', `abbreviation` = 'Princeton', `org_type` = 1 WHERE `id` = 83;
UPDATE `orgs` SET `name` = 'Purdue University', `abbreviation` = 'Purdue', `org_type` = 1 WHERE `id` = 47;
UPDATE `orgs` SET `name` = 'Rice University', `abbreviation` = 'Rice', `org_type` = 1 WHERE `id` = 34;
UPDATE `orgs` SET `name` = 'Sam Houston State University (SHSU)', `abbreviation` = 'SHSU', `org_type` = 1 WHERE `id` = 215;
UPDATE `orgs` SET `name` = 'San Diego State University (SDSU)', `abbreviation` = 'SDSU', `org_type` = 1 WHERE `id` = 168;
UPDATE `orgs` SET `name` = 'Smithsonian Institution (SI)', `abbreviation` = 'SI', `org_type` = 1 WHERE `id` = 4;
UPDATE `orgs` SET `name` = 'South Dakota State University', `abbreviation` = 'SD State', `org_type` = 1 WHERE `id` = 211;
UPDATE `orgs` SET `name` = 'Stanford University', `abbreviation` = 'Stanford', `org_type` = 1 WHERE `id` = 71;
UPDATE `orgs` SET `name` = 'Stony Brook University', `abbreviation` = 'Stony Brook', `org_type` = 1 WHERE `id` = 90;
UPDATE `orgs` SET `name` = 'Swarthmore College', `abbreviation` = 'Swarthmore', `org_type` = 1 WHERE `id` = 217;
UPDATE `orgs` SET `name` = 'Syracuse University', `abbreviation` = 'Syracuse', `org_type` = 1 WHERE `id` = 75;
UPDATE `orgs` SET `name` = 'Temple University', `abbreviation` = 'Temple', `org_type` = 1 WHERE `id` = 88;
UPDATE `orgs` SET `name` = 'Texas A&M University (TAMU)', `abbreviation` = 'TAMU', `org_type` = 1 WHERE `id` = 50;
UPDATE `orgs` SET `name` = 'Texas A&M University, Corpus Christi (TAMUCC)', `abbreviation` = 'TAMUCC', `org_type` = 1 WHERE `id` = 171;
UPDATE `orgs` SET `name` = 'Texas State University-San Marcos (TSU-SM)', `abbreviation` = 'TSU-SM', `org_type` = 1 WHERE `id` = 53;
UPDATE `orgs` SET `name` = 'Texas Tech University (TTU)', `abbreviation` = 'TTU', `org_type` = 1 WHERE `id` = 117;
UPDATE `orgs` SET `name` = 'Tufts University', `abbreviation` = 'Tufts', `org_type` = 1 WHERE `id` = 192;
UPDATE `orgs` SET `name` = 'Tulane University', `abbreviation` = 'Tulane', `org_type` = 1 WHERE `id` = 58;
UPDATE `orgs` SET `name` = 'U.S. Department of Agriculture (USDA)', `abbreviation` = 'USDA', `org_type` = 2 WHERE `id` = 170;
UPDATE `orgs` SET `name` = 'U.S. Geological Survey (USGS)', `abbreviation` = 'USGS', `org_type` = 2 WHERE `id` = 139;
UPDATE `orgs` SET `name` = 'University of California, Los Angeles (UCLA)', `abbreviation` = 'UCLA', `org_type` = 1 WHERE `id` = 9;
UPDATE `orgs` SET `name` = 'University at Buffalo (UB)', `abbreviation` = 'UB', `org_type` = 1 WHERE `id` = 201;
UPDATE `orgs` SET `name` = 'University Corporation for Atmospheric Research (UCAR)', `abbreviation` = 'UCAR', `org_type` = 3 WHERE `id` = 191;
UPDATE `orgs` SET `name` = 'University of Alabama', `abbreviation` = 'Bama', `org_type` = 1 WHERE `id` = 72;
UPDATE `orgs` SET `name` = 'University of Alabama at Birmingham (UAB)', `abbreviation` = 'UAB', `org_type` = 1 WHERE `id` = 177;
UPDATE `orgs` SET `name` = 'University of Arizona', `abbreviation` = 'UAriz', `org_type` = 1 WHERE `id` = 35;
UPDATE `orgs` SET `name` = 'University of California, Berkeley (UCB)', `abbreviation` = 'UCB', `org_type` = 1 WHERE `id` = 6;
UPDATE `orgs` SET `name` = 'University of California, Davis (UCD)', `abbreviation` = 'UCD', `org_type` = 1 WHERE `id` = 7;
UPDATE `orgs` SET `name` = 'University of California, Irvine (UCI)', `abbreviation` = 'UCI', `org_type` = 1 WHERE `id` = 8;
UPDATE `orgs` SET `name` = 'University of California, Merced (UCM)', `abbreviation` = 'UCM', `org_type` = 1 WHERE `id` = 10;
UPDATE `orgs` SET `name` = 'University of California, Office of the President (UCOP)', `abbreviation` = 'UCOP', `org_type` = 1 WHERE `id` = 15;
UPDATE `orgs` SET `name` = 'University of California, Riverside (UCR)', `abbreviation` = 'UCR', `org_type` = 1 WHERE `id` = 11;
UPDATE `orgs` SET `name` = 'University of California, San Diego (UCSD)', `abbreviation` = 'UCSD', `org_type` = 1 WHERE `id` = 3;
UPDATE `orgs` SET `name` = 'University of California, San Francisco (UCSF)', `abbreviation` = 'UCSF', `org_type` = 1 WHERE `id` = 12;
UPDATE `orgs` SET `name` = 'University of California, Santa Barbara (UCSB)', `abbreviation` = 'UCSB', `org_type` = 1 WHERE `id` = 13;
UPDATE `orgs` SET `name` = 'University of California, Santa Cruz (UCSC)', `abbreviation` = 'UCSC', `org_type` = 1 WHERE `id` = 14;
UPDATE `orgs` SET `name` = 'University of Central Florida (UCF)', `abbreviation` = 'UCF', `org_type` = 1 WHERE `id` = 112;
UPDATE `orgs` SET `name` = 'University of Chicago', `abbreviation` = 'UChicago', `org_type` = 1 WHERE `id` = 16;
UPDATE `orgs` SET `name` = 'University of Cincinnati Main Campus (UC)', `abbreviation` = 'UC', `org_type` = 1 WHERE `id` = 98;
UPDATE `orgs` SET `name` = 'University of Colorado Anschutz Medical Campus (CU Anschutz)', `abbreviation` = 'CU Anschutz', `org_type` = 1 WHERE `id` = 157;
UPDATE `orgs` SET `name` = 'University of Colorado Boulder (CU Boulder)', `abbreviation` = 'CU Boulder', `org_type` = 1 WHERE `id` = 85;
UPDATE `orgs` SET `name` = 'University of Colorado Denver (UC Denver)', `abbreviation` = 'UC Denver', `org_type` = 1 WHERE `id` = 229;
UPDATE `orgs` SET `name` = 'University of Connecticut (UConn)', `abbreviation` = 'UConn', `org_type` = 1 WHERE `id` = 94;
UPDATE `orgs` SET `name` = 'University of Dayton', `abbreviation` = 'UDayton', `org_type` = 1 WHERE `id` = 197;
UPDATE `orgs` SET `name` = 'University of Delaware (UDel)', `abbreviation` = 'UDel', `org_type` = 1 WHERE `id` = 116;
UPDATE `orgs` SET `name` = 'University of Denver (DU)', `abbreviation` = 'DU', `org_type` = 1 WHERE `id` = 213;
UPDATE `orgs` SET `name` = 'University of Florida', `abbreviation` = 'UFlorida', `org_type` = 1 WHERE `id` = 74;
UPDATE `orgs` SET `name` = 'University of Georgia (UGA)', `abbreviation` = 'UGA', `org_type` = 1 WHERE `id` = 152;
UPDATE `orgs` SET `name` = 'University of Hawaii', `abbreviation` = 'UHawaii', `org_type` = 1 WHERE `id` = 59;
UPDATE `orgs` SET `name` = 'University of Helsinki, Finland', `abbreviation` = 'Helsinki', `org_type` = 1 WHERE `id` = 175;
UPDATE `orgs` SET `name` = 'University of Houston (UHL)', `abbreviation` = 'UHL', `org_type` = 1 WHERE `id` = 103;
UPDATE `orgs` SET `name` = 'University of Idaho', `abbreviation` = 'UIdaho', `org_type` = 1 WHERE `id` = 43;
UPDATE `orgs` SET `name` = 'University of Illinois at Chicago (UIC)', `abbreviation` = 'UIC', `org_type` = 1 WHERE `id` = 26;
UPDATE `orgs` SET `name` = 'University of Illinois at Urbana-Champaign (UIUC)', `abbreviation` = 'UIUC', `org_type` = 1 WHERE `id` = 5;
UPDATE `orgs` SET `name` = 'University of Iowa', `abbreviation` = 'Iowa', `org_type` = 1 WHERE `id` = 21;
UPDATE `orgs` SET `name` = 'University of Kansas (KU)', `abbreviation` = 'KU', `org_type` = 1 WHERE `id` = 95;
UPDATE `orgs` SET `name` = 'University of Kentucky (UK)', `abbreviation` = 'UK', `org_type` = 1 WHERE `id` = 60;
UPDATE `orgs` SET `name` = 'University of Maine System (UMS)', `abbreviation` = 'UMS', `org_type` = 1 WHERE `id` = 99;
UPDATE `orgs` SET `name` = 'University of Mary Washington (UMW)', `abbreviation` = 'UMW', `org_type` = 1 WHERE `id` = 188;
UPDATE `orgs` SET `name` = 'University of Maryland, College Park (UMD)', `abbreviation` = 'UMD', `org_type` = 1 WHERE `id` = 184;
UPDATE `orgs` SET `name` = 'University of Massachusetts Amherst (UMass Amherst)', `abbreviation` = 'UMass Amherst', `org_type` = 1 WHERE `id` = 166;
UPDATE `orgs` SET `name` = 'University of Massachusetts Dartmouth (UMass Dartmouth)', `abbreviation` = 'UMass Dartmouth', `org_type` = 1 WHERE `id` = 159;
UPDATE `orgs` SET `name` = 'University of Massachusetts Medical School (UMMS)', `abbreviation` = 'UMMS', `org_type` = 1 WHERE `id` = 200;
UPDATE `orgs` SET `name` = 'University of Miami', `abbreviation` = 'UMiami', `org_type` = 1 WHERE `id` = 40;
UPDATE `orgs` SET `name` = 'University of Michigan', `abbreviation` = 'UMich', `org_type` = 1 WHERE `id` = 18;
UPDATE `orgs` SET `name` = 'University of Minnesota (UMN)', `abbreviation` = 'UMN', `org_type` = 1 WHERE `id` = 63;
UPDATE `orgs` SET `name` = 'University of Mississippi', `abbreviation` = 'Ole Miss', `org_type` = 1 WHERE `id` = 218;
UPDATE `orgs` SET `name` = 'University of Nebraska-Lincoln (UNL)', `abbreviation` = 'UNL', `org_type` = 1 WHERE `id` = 19;
UPDATE `orgs` SET `name` = 'University of Nevada, Las Vegas (UNLV)', `abbreviation` = 'UNLV', `org_type` = 1 WHERE `id` = 193;
UPDATE `orgs` SET `name` = 'University of Nevada, Reno (UNR)', `abbreviation` = 'UNR', `org_type` = 1 WHERE `id` = 222;
UPDATE `orgs` SET `name` = 'University of New Mexico (UNM)', `abbreviation` = 'UNM', `org_type` = 1 WHERE `id` = 48;
UPDATE `orgs` SET `name` = 'University of New Orleans (UNO)', `abbreviation` = 'UNO', `org_type` = 1 WHERE `id` = 76;
UPDATE `orgs` SET `name` = 'University of North Carolina-Chapel Hill (UNC-CH)', `abbreviation` = 'UNC-CH', `org_type` = 1 WHERE `id` = 23;
UPDATE `orgs` SET `name` = 'University of North Carolina-Charlotte (UNCC)', `abbreviation` = 'UNCC', `org_type` = 1 WHERE `id` = 196;
UPDATE `orgs` SET `name` = 'University of North Texas (UNT)', `abbreviation` = 'UNT', `org_type` = 1 WHERE `id` = 65;
UPDATE `orgs` SET `name` = 'University of Notre Dame (UND)', `abbreviation` = 'UND', `org_type` = 1 WHERE `id` = 46;
UPDATE `orgs` SET `name` = 'University of Oklahoma (OU)', `abbreviation` = 'OU', `org_type` = 1 WHERE `id` = 153;
UPDATE `orgs` SET `name` = 'University of Pennsylvania (UPenn)', `abbreviation` = 'UPenn', `org_type` = 1 WHERE `id` = 110;
UPDATE `orgs` SET `name` = 'University of Pittsburgh (Pitt)', `abbreviation` = 'Pitt', `org_type` = 1 WHERE `id` = 167;
UPDATE `orgs` SET `name` = 'University of Puerto Rico in Mayaguez (UPRM)', `abbreviation` = 'UPRM', `org_type` = 1 WHERE `id` = 198;
UPDATE `orgs` SET `name` = 'University of Rhode Island (URI)', `abbreviation` = 'URI', `org_type` = 1 WHERE `id` = 203;
UPDATE `orgs` SET `name` = 'University of Rochester (UR)', `abbreviation` = 'UR', `org_type` = 1 WHERE `id` = 79;
UPDATE `orgs` SET `name` = 'University of South Carolina (USC)', `abbreviation` = 'USC', `org_type` = 1 WHERE `id` = 208;
UPDATE `orgs` SET `name` = 'University of Tennessee', `abbreviation` = 'UT Libraries', `org_type` = 1 WHERE `id` = 91;
UPDATE `orgs` SET `name` = 'University of Texas at Arlington (UTA)', `abbreviation` = 'UTA', `org_type` = 1 WHERE `id` = 101;
UPDATE `orgs` SET `name` = 'University of Texas at Austin (UTA)', `abbreviation` = 'UTA', `org_type` = 1 WHERE `id` = 31;
UPDATE `orgs` SET `name` = 'University of Texas at Dallas (UT Dallas)', `abbreviation` = 'UT Dallas', `org_type` = 1 WHERE `id` = 228;
UPDATE `orgs` SET `name` = 'University of Texas at San Antonio (UTSA)', `abbreviation` = 'UTSA', `org_type` = 1 WHERE `id` = 160;
UPDATE `orgs` SET `name` = 'University of Utah', `abbreviation` = 'U Utah', `org_type` = 1 WHERE `id` = 66;
UPDATE `orgs` SET `name` = 'University of Virginia (UVa)', `abbreviation` = 'UVa', `org_type` = 1 WHERE `id` = 2;
UPDATE `orgs` SET `name` = 'University of Washington (UW)', `abbreviation` = 'UW', `org_type` = 1 WHERE `id` = 73;
UPDATE `orgs` SET `name` = 'University of Wisconsin-Madison', `abbreviation` = 'Wisc', `org_type` = 1 WHERE `id` = 51;
UPDATE `orgs` SET `name` = 'University of Wisconsin-Milwaukee (UWM)', `abbreviation` = 'UWM', `org_type` = 1 WHERE `id` = 64;
UPDATE `orgs` SET `name` = 'University of Wyoming (UWYO)', `abbreviation` = 'UWYO', `org_type` = 1 WHERE `id` = 179;
UPDATE `orgs` SET `name` = 'Upstate Medical University', `abbreviation` = 'Upstate', `org_type` = 1 WHERE `id` = 220;
UPDATE `orgs` SET `name` = 'Utah State University (USU)', `abbreviation` = 'USU', `org_type` = 1 WHERE `id` = 96;
UPDATE `orgs` SET `name` = 'Vanderbilt University', `abbreviation` = 'Vanderbilt', `org_type` = 1 WHERE `id` = 164;
UPDATE `orgs` SET `name` = 'Virginia Commonwealth University (VCU)', `abbreviation` = 'VCU', `org_type` = 1 WHERE `id` = 81;
UPDATE `orgs` SET `name` = 'Virginia Tech (VT)', `abbreviation` = 'VT', `org_type` = 1 WHERE `id` = 70;
UPDATE `orgs` SET `name` = 'Washington State University (WSU)', `abbreviation` = 'WSU', `org_type` = 1 WHERE `id` = 80;
UPDATE `orgs` SET `name` = 'Washington University in St. Louis (WUSTL)', `abbreviation` = 'WUSTL', `org_type` = 1 WHERE `id` = 82;
UPDATE `orgs` SET `name` = 'Wayne State University', `abbreviation` = 'Wayne State', `org_type` = 1 WHERE `id` = 150;
UPDATE `orgs` SET `name` = 'Weill Cornell Medical College', `abbreviation` = 'Weill Cornell', `org_type` = 1 WHERE `id` = 86;
UPDATE `orgs` SET `name` = 'Western Carolina University (WCU)', `abbreviation` = 'WCU', `org_type` = 1 WHERE `id` = 178;
UPDATE `orgs` SET `name` = 'Western Michigan University', `abbreviation` = 'WMich', `org_type` = 1 WHERE `id` = 227;
UPDATE `orgs` SET `name` = 'Woods Hole Oceanographic Institution (WHOI)', `abbreviation` = 'WHOI', `org_type` = 1 WHERE `id` = 142;
UPDATE `orgs` SET `name` = 'Yale University', `abbreviation` = 'Yale', `org_type` = 1 WHERE `id` = 39;

-- ******************************************************************************
-- ******************************************************************************
-- ******************************************************************************

-- Disable the constraints
ALTER TABLE `roadmap`.`plans_guidance_groups` DISABLE KEYS;
SET FOREIGN_KEY_CHECKS = 0;      
TRUNCATE TABLE `roadmap`.`plans_guidance_groups`;

-- Attach Each plan to the DCC/UC3 default guidance group and the insitution's guidance group (Exclude 'Non-Partner Institution')
INSERT INTO `plans_guidance_groups` (`plan_id`, `guidance_group_id`) 
(SELECT DISTINCT `plans`.`id`, `guidance_groups`.`id`
 FROM `plans`
 INNER JOIN `roles` ON `plans`.`id` = `roles`.`plan_id`
 INNER JOIN `users` ON `roles`.`user_id` = `users`.`id`
 INNER JOIN `guidance_groups` ON `users`.`org_id` = `guidance_groups`.`org_id`
 WHERE `users`.`org_id` > 0
);

-- Attach the default DCC/UC3 guidance to each plan by default
SET @dcc_gg = (SELECT `guidance_groups`.`id` FROM `guidance_groups` INNER JOIN `orgs` ON `guidance_groups`.`org_id` = `orgs`.`id` WHERE `abbreviation` = 'DCC');
INSERT INTO `plans_guidance_groups` (`plan_id`, `guidance_group_id`) 
(SELECT DISTINCT `plans`.`id`, @dcc_gg
 FROM `plans`);

-- Enable Back the constraints
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `roadmap`.`plans_guidance_groups` ENABLE KEYS;
-- ******************************************************************************
-- ******************************************************************************
-- ******************************************************************************


-- # Create Guidance Groups for each Organization as a default group for tthose orgs newly created in DMP2-Prod.
-- To disable constraints  
ALTER TABLE `roadmap`.`guidance_groups` DISABLE KEYS;
SET FOREIGN_KEY_CHECKS = 0;  

INSERT INTO `roadmap`.`guidance_groups`(
  `name`,               `org_id`,     `optional_subset`,  `published`,   `created_at`,     `updated_at`)

VALUES
  ('North Dakota State University Guidance',  232, 0, 1, '2017-12-06 16:21:06', '2017-12-06 16:21:06'),
  ('National University of Singapore Guidance', 233, 0, 1, '2018-01-23 17:39:13',  '2018-01-24 01:14:35'),
  ('Mount Holyoke College Guidance',  234, 0, 1, '2018-01-23 23:25:39', '2018-01-25 16:33:10'),
  ('University of Northern Iowa Guidance',  235, 0, 1, '2018-01-31 16:54:19', '2018-01-31 16:54:19'),
  ('Rochester Institute of Technology Guidance',  236, 0, 1, '2018-02-07 00:06:07', '2018-02-13 22:40:20'),
  ('Seton Hall University Guidance',  237, 0, 1, '2018-02-09 20:32:23', '2018-02-12 17:50:46'),
  ('University of South Florida Guidance',  238, 0, 1, '2018-02-14 19:36:45', '2018-02-14 19:36:45'),
  ('University of Vermont Guidance',  239, 0, 1, '2018-02-14 21:00:30', '2018-02-14 21:00:30'),
  ('South Texas College Guidance',  240, 0, 1, '2018-02-20 17:35:10','2018-02-20 17:35:10');

-- Enable Back the constraints
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE `roadmap`.`guidance_groups` ENABLE KEYS;

-- **********************************************************************************************************************
-- **********************************************************************************************************************
