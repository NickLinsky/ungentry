/* 
* TODO: 1. Place the .txt data file and the dictionary file you downloaded in the work folder, or enter the full path to these files!
*       2. You may have to increase memory using the 'set mem' statement. It is commented out in the code bellow.
*
* If you have any questions or need assistance contact info@socialexplorer.com.
*/
clear	
cd "C:\Users\Jackie\Documents\GitHub\ungentry\Census1990_Boston"
///set mem 512m
set more off
infile using "R10716313.dct", using("R10716313_SL140.txt")


drop NAME QName SUMLEV GEOCOMP REGION DIVISION STATE COUNTY TRACT
rename FIPS tractid90

rename T001_001 totalpop

drop T002_002 T002_001 T002_003 T003_001 T003_002 T003_003 PCT_T003_002 PCT_T003_003 T005_001 T005_002 T005_003 PCT_T005_002 PCT_T005_003 
drop T008_001 T008_002 T008_003 T008_004 T008_005 T008_006 T008_007 T008_008 T008_009 T008_010 T008_011 T008_012 T008_013 
drop PCT_T008_002 PCT_T008_003 PCT_T008_004 PCT_T008_005 PCT_T008_006 PCT_T008_007 PCT_T008_008 PCT_T008_009 PCT_T008_010 PCT_T008_011 PCT_T008_012 PCT_T008_013
drop T012_001 T012_002 T012_003 T012_004 T012_005 T012_006 PCT_T012_002 PCT_T012_003 PCT_T012_004 PCT_T012_005 PCT_T012_006 
drop T016_002 T016_003 T016_004 T016_005 T016_006 T016_007 T016_008 T016_009 
drop PCT_T016_002 PCT_T016_003 PCT_T016_004 PCT_T016_005 PCT_T016_006 PCT_T016_007 PCT_T016_008 PCT_T016_009

rename T016_001 households

drop T019_001 T019_002 T019_003 T019_004 T019_005 T019_007 T019_008 T019_009 T019_010 T019_011 T019_012 T019_013 
drop T019_006 T019_014 PCT_T019_002 PCT_T019_003 PCT_T019_004 PCT_T019_005
drop PCT_T019_007 PCT_T019_008 PCT_T019_009 PCT_T019_010 PCT_T019_011 PCT_T019_012 PCT_T019_013 PCT_T019_014

rename PCT_T019_006 pcthhchild

drop T022_001 T022_002 T022_003 T022_004 T022_005 T022_006 PCT_T022_002 PCT_T022_003 PCT_T022_004

gen pctcollege = PCT_T022_005 + PCT_T022_006

drop PCT_T022_005 PCT_T022_006 PCT_T022_006 T023_001 T023_002 T023_003 PCT_T023_002 PCT_T023_003
drop T024_001 T024_002 PCT_T024_002 T029_001 T029_002 T029_003 PCT_T029_002 PCT_T029_003

rename PCT_T038_011 pctind_finance
rename PCT_T038_015 pctind_professional
rename PCT_T039_002 pctocc_profmanage

drop T038_001 T038_002 T038_003 T038_004 T038_005 T038_006 T038_007 T038_008 T038_009 T038_010 
drop T038_011 T038_012 T038_013 T038_014 T038_015 T038_016 T038_017 T038_018 T038_019
drop PCT_T038_002 PCT_T038_003 PCT_T038_004 PCT_T038_005 PCT_T038_006 PCT_T038_007 PCT_T038_008 PCT_T038_009 PCT_T038_010 
drop PCT_T038_012 PCT_T038_013 PCT_T038_014 PCT_T038_016 PCT_T038_017 PCT_T038_018 PCT_T038_019
drop T039_001 T039_002 T039_003 T039_004 T039_005 T039_006 T039_007 T039_008 T039_009 T039_010 
drop T039_011 T039_012 T039_013 T039_014 T039_015 T039_016 T039_017 T039_018
drop PCT_T039_003 PCT_T039_004 PCT_T039_005 PCT_T039_006 PCT_T039_007 PCT_T039_008 PCT_T039_009 PCT_T039_010 
drop PCT_T039_011 PCT_T039_012 PCT_T039_013 PCT_T039_014 PCT_T039_015 PCT_T039_016 PCT_T039_017 PCT_T039_018

drop T040_001 T040_002 T040_003 T040_004 T040_005 T040_006 PCT_T040_002 PCT_T040_003 PCT_T040_004 PCT_T040_005 PCT_T040_006

drop T041_001 T041_002 T041_003 T041_004 T041_005 T041_006 T041_007 T041_008 T041_009 T041_010 
drop T041_011 T041_012 T041_013 T041_014 T041_015 T041_016 T041_017 T041_018 T041_019 T041_020 
drop T041_021 T041_022 T041_023 T041_024 T041_025 T041_026

rename PCT_T041_002 pctinc_0_5K
rename PCT_T041_003 pctinc_5K_10K
gen pctinc_10K_15K = PCT_T041_004 + PCT_T041_005
gen pctinc_15K_20K = PCT_T041_006 + PCT_T041_007
gen pctinc_20K_25K = PCT_T041_008 + PCT_T041_009
gen pctinc_25K_30K = PCT_T041_010 + PCT_T041_011
gen pctinc_30K_35K = PCT_T041_012 + PCT_T041_013
gen pctinc_35K_40K = PCT_T041_014 + PCT_T041_015
gen pctinc_40K_45K = PCT_T041_016 + PCT_T041_017
gen pctinc_45K_50K = PCT_T041_018 + PCT_T041_019
rename PCT_T041_020 pctinc_50K_55K
rename PCT_T041_021 pctinc_55K_60K
rename PCT_T041_022 pctinc_60K_75K
rename PCT_T041_023 pctinc_75K_100K
rename PCT_T041_024 pctinc_100K_125K
rename PCT_T041_025 pctinc_125K_150K
rename PCT_T041_026 pctinc_150K_more
drop PCT_T041_004 PCT_T041_005 PCT_T041_006 PCT_T041_007 PCT_T041_008 PCT_T041_009 PCT_T041_010 
drop PCT_T041_011 PCT_T041_012 PCT_T041_013 PCT_T041_014 PCT_T041_015 PCT_T041_016 PCT_T041_017 PCT_T041_018 PCT_T041_019

drop T042_001 T042_002 T042_003 T042_004 T042_005 T042_006 T042_007 T042_008 T042_009 T042_010 
drop PCT_T042_002 PCT_T042_003 PCT_T042_004 PCT_T042_005 PCT_T042_006 PCT_T042_007 PCT_T042_008 PCT_T042_009 PCT_T042_010

rename T043_001 medhhincome

drop T044_001 T045_001 T045_002 T045_003 T045_004 T045_005 T045_006 T046_001 T047_001 T048_001 
drop T049_001 T050_001 T056_001 T056_002 T056_003 PCT_T056_002 PCT_T056_003
drop T057_001 T057_002 T057_003 PCT_T057_002 PCT_T057_003 T058_001 T058_002 T058_003 PCT_T058_002 PCT_T058_003 
drop T059_001 T059_002 T059_003 PCT_T059_002 PCT_T059_003 T060_001 T060_002 T060_003 PCT_T060_002 PCT_T060_003 
drop T061_001 T061_002 T061_003 PCT_T061_002 PCT_T061_003 T062_001 T062_002 T062_003 PCT_T062_003 
drop T063_001 T063_002 T063_003 PCT_T063_002 PCT_T063_003 T064_001 T064_002 T064_003 PCT_T064_002 PCT_T064_003

rename PCT_T062_002 pctpublicassist

drop T065_001 T066_001 T067_001 T068_001 T069_001 T070_001 T071_001

rename T072_001 units
drop T073_001 T073_002 T073_003
rename PCT_T073_002 pctown
rename PCT_T073_003 pctrent
drop T074_001 T074_002 T074_003 PCT_T074_002
rename PCT_T074_003 pctvacant

drop T075_001 T075_002 T075_003 T075_004 PCT_T075_002 PCT_T075_003 PCT_T075_004 
drop T076_001 T076_002 T076_003 T076_004 T076_005 T076_006 T076_007 T076_008 T076_009 T076_010 T076_011 T076_012 
drop PCT_T076_002 PCT_T076_003 PCT_T076_004 PCT_T076_005 PCT_T076_006 PCT_T076_007 PCT_T076_008 PCT_T076_009 PCT_T076_010 PCT_T076_011 PCT_T076_012
drop T077_001 T078_001 T078_002 T078_003 T078_004 T078_005 T078_006 T078_007 T078_008 
drop PCT_T078_002 PCT_T078_003 PCT_T078_004 PCT_T078_005 PCT_T078_006 PCT_T078_007 PCT_T078_008
drop T079_001 T079_002 T079_003 T079_004 T079_005 T079_006 T079_007 T079_008 
drop PCT_T079_002 PCT_T079_003 PCT_T079_004 PCT_T079_005 PCT_T079_006 PCT_T079_007 PCT_T079_008

rename T080_001 medianvalue

drop T081_001 T081_002 T081_003 T081_004 T081_005 T081_006 T081_007 T081_008 PCT_T081_002 PCT_T081_008
rename PCT_T081_003 pctrent_0_300
rename PCT_T081_004 pctrent_300_600
rename PCT_T081_005 pctrent_600_750
rename PCT_T081_006 pctrent_750_1000
rename PCT_T081_007 pctrent_1000_more
rename T082_001 medianrent

drop T083_001 T083_002 T083_003 T083_004 T083_005 T083_006 T083_007 PCT_T083_002 PCT_T083_003 PCT_T083_004 PCT_T083_007
gen pctincomerent_30_more = PCT_T083_005 + PCT_T083_006
drop PCT_T083_005 PCT_T083_006

rename T084_001 medianpctincomerent
drop T085_001 T087_001 T087_002 T087_003 PCT_T087_002 PCT_T087_003 T088_001 T088_002 T088_004 T088_008 T088_003 T088_005 T088_006 T088_007 T088_009
rename PCT_T088_004 pctinc_mortgage_30_more
rename PCT_T088_008 pctinc_nomortgage_30_more

drop PCT_T088_002 PCT_T088_003 PCT_T088_005 PCT_T088_006 PCT_T088_007 PCT_T088_009
drop T089_001 T089_002 T089_003 T089_004 PCT_T089_002 PCT_T089_003 PCT_T089_004 
drop T090_001 T090_002 T090_003 T090_004 PCT_T090_002 PCT_T090_003 PCT_T090_004 T091_001 T091_002 
drop T098_001 T098_002 T098_003 T098_004 T098_005 PCT_T098_002 PCT_T098_003 PCT_T098_004 PCT_T098_005

order pctcollege, after(pctocc_profmanage)
order pctinc_10K_15K pctinc_15K_20K pctinc_20K_25K pctinc_25K_30K pctinc_30K_35K pctinc_35K_40K pctinc_40K_45K pctinc_45K_50K, after( pctinc_5K_10K)
order pctincomerent_30_more, after( medianrent)

merge 1:1 tractid90 using "C:\Users\Jackie\Documents\GitHub\ungentry\Census1990_Boston\Census1990_Boston_addvars.dta", nogenerate

order pctpoverty, after(medhhincome)

append using "C:\Users\Jackie\Documents\GitHub\ungentry\Census1990_Boston\Census1990_Boston_norfolk.dta"

outsheet using "C:\Users\Jackie\Documents\GitHub\ungentry\Census1990_Boston\Census1990_Boston.csv", comma replace
