/* 
* TODO: 1. Place the .txt data file and the dictionary file you downloaded in the work folder, or enter the full path to these files!
*       2. You may have to increase memory using the 'set mem' statement. It is commented out in the code bellow.
*
* If you have any questions or need assistance contact info@socialexplorer.com.
*/
clear
cd "C:\Users\Jackie\Documents\GitHub\ungentry\ACS0812_Boston"
///set mem 512m
set more off
infile using "R10732460.dct", using("R10732460_SL080.txt")

rename FIPS tractid10
drop GEOID NAME QName STUSAB SUMLEV GEOCOMP FILEID LOGRECNO 
drop US REGION DIVISION STATECE STATE COUNTY COUSUB PLACE PLACESE 
drop TRACT BLKGRP CONCIT AIANHH AIANHHFP AIHHTLI AITSCE AITS ANRC 
drop CBSA CSA METDIV MACC MEMI NECTA CNECTA NECTADIV UA UACP CDCURR 
drop SLDU SLDL VTD ZCTA3 ZCTA5 SUBMCD SDELM SDSEC SDUNI UR PCI TAZ 
drop UGA BTTR BTBG PUMA5 PUMA1

rename T017_001 households
drop T017_002 T017_003 T017_004 T017_005 T017_006 T017_007 T017_008 T017_009 
drop PCT_T017_002 PCT_T017_003 PCT_T017_004 PCT_T017_005 PCT_T017_006 PCT_T017_007 PCT_T017_008 PCT_T017_009 
drop T020_001 T020_002 T020_003 T020_004 T020_005 T020_006 T020_007 T020_008 T020_009 
drop T020_017 T020_018
drop T020_010 T020_011 T020_012 T020_013 T020_014 T020_015 T020_016
drop PCT_T020_002 PCT_T020_003 PCT_T020_004 PCT_T020_005 PCT_T020_007 PCT_T020_008 PCT_T020_009 
drop PCT_T020_017 PCT_T020_018
rename PCT_T020_006 pcthhchild
drop PCT_T020_010 PCT_T020_011 PCT_T020_012 PCT_T020_013 PCT_T020_014 PCT_T020_015 PCT_T020_016 
drop T050_001 T050_002 T050_003 T050_004 T050_005 T050_006 T050_007 T050_008 T050_009 T050_010 
drop T050_011 T050_012 T050_013 T050_014

gen pctocc_profmanage = PCT_T050_002 + PCT_T050_003
drop PCT_T050_002 PCT_T050_003 PCT_T050_004 PCT_T050_005 PCT_T050_006 PCT_T050_007 PCT_T050_008 PCT_T050_009 PCT_T050_010 
drop PCT_T050_011 PCT_T050_012 PCT_T050_013 PCT_T050_014

drop T056_001 T056_002 T056_003 T056_004 T056_005 T056_006 T056_007 T056_008 T056_009 T056_010
drop T056_011 T056_012 T056_013 T056_014 T056_015 T056_016 T056_017

rename PCT_T056_002 pctinc_0_10K
rename PCT_T056_003 pctinc_10K_15K
rename PCT_T056_004 pctinc_15K_20K
rename PCT_T056_005 pctinc_20K_25K
rename PCT_T056_006 pctinc_25K_30K
rename PCT_T056_007 pctinc_30K_35K
rename PCT_T056_008 pctinc_35K_40K
rename PCT_T056_009 pctinc_40K_45K
rename PCT_T056_010 pctinc_45K_50K
rename PCT_T056_011 pctinc_50K_60K
rename PCT_T056_012 pctinc_60K_75K
rename PCT_T056_013 pctinc_75K_100K
rename PCT_T056_014 pctinc_100K_125K
rename PCT_T056_015 pctinc_125K_150K
rename PCT_T056_016 pctinc_150K_200K
rename PCT_T056_017 pctinc_200K_more
rename T057_001 medhhincome

drop T080_001 T080_002 T080_003 PCT_T080_003
rename PCT_T080_002 pctpublicassist
rename T093_001 units

drop T102_001 T102_002 T102_003 T102_004 T102_005 T102_006 T102_007 T102_008 T102_009
rename PCT_T102_002 pctrent_0_300
rename PCT_T102_003 pctrent_300_600
rename PCT_T102_004 pctrent_600_800
rename PCT_T102_005 pctrent_800_1000
rename PCT_T102_006 pctrent_1000_1250
rename PCT_T102_007 pctrent_1250_1500
rename PCT_T102_008 pctrent_1500_2000
rename PCT_T102_009 pctrent_2000_more

rename T105_001 medianpctincomerent
drop T109_001 T109_002 T109_003 T109_004 T109_005 T109_006 T109_007 T109_008 T109_009 T109_010 T109_011
gen pctinc_mortgage_30_more = PCT_T109_004 
gen pctinc_nomortgage_30_more = PCT_T109_009 
drop PCT_T109_002 PCT_T109_003 PCT_T109_004 PCT_T109_005 PCT_T109_006 PCT_T109_007 PCT_T109_008 PCT_T109_009 PCT_T109_010 PCT_T109_011

gen pctpoverty = ((T114_002 + T115_002 + T116_002)/ (T114_001 + T115_001 + T116_001)) * 100
drop T114_001 T114_002 T114_003 PCT_T114_002 PCT_T114_003 
drop T115_001 T115_002 T115_003 PCT_T115_002 PCT_T115_003 
drop T116_001 T116_002 T116_003 PCT_T116_002 PCT_T116_003

drop T130_001 T130_002 T130_003 T130_004 T130_005 T130_006
rename PCT_T130_002 pctsameres
drop PCT_T130_003 PCT_T130_004 PCT_T130_005 PCT_T130_006
gen pctunits_newres_2010 = ((B25026003 + B25026010)/ (B25026002 + B25026009))*100
gen pctunits_newres_2000 = ((B25026003 + B25026004 + B25026010 + B25026011)/ (B25026002 + B25026009))*100
drop B25026001 B25026002 B25026003 B25026004 B25026005 B25026006 B25026007 B25026008 B25026009 B25026010 
drop B25026011 B25026012 B25026013 B25026014 B25026015 
drop B25026001s B25026002s B25026003s B25026004s B25026005s B25026006s B25026007s B25026008s B25026009s B25026010s 
drop B25026011s B25026012s B25026013s B25026014s B25026015s 
drop PCT_B25026002 PCT_B25026003 PCT_B25026004 PCT_B25026005 PCT_B25026006 PCT_B25026007 PCT_B25026008 PCT_B25026009 PCT_B25026010 
drop PCT_B25026011 PCT_B25026012 PCT_B25026013 PCT_B25026014 PCT_B25026015


save "C:\Users\Jackie\Documents\GitHub\ungentry\ACS0812_Boston\ACS0812_Boston_addvars.dta", replace
