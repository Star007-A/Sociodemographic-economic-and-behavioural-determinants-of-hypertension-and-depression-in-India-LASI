*Depression Scale (Recode)
recode fs701 (1/2 = 0 "No") (3/4 = 1 "Yes"), gen(fs701_n)
recode fs702 (1/2 = 0 "No") (3/4 = 1 "Yes"), gen(fs702_n)
recode fs703 (1/2 = 0 "No") (3/4 = 1 "Yes"), gen(fs703_n)
recode fs704 (1/2 = 0 "No") (3/4 = 1 "Yes"), gen(fs704_n)
recode fs706 (1/2 = 0 "No") (3/4 = 1 "Yes"), gen(fs706_n)
recode fs707 (1/2 = 0 "No") (3/4 = 1 "Yes"), gen(fs707_n)
recode fs708 (1/2 = 0 "No") (3/4 = 1 "Yes"), gen(fs708_n)
recode fs705 (1/2 = 1 "Yes") (3/4 = 0 "No"), gen(fs705_n)
recode fs709 (1/2 = 1 "Yes") (3/4 = 0 "No"), gen(fs709_n)
recode fs710 (1/2 = 1 "Yes") (3/4 = 0 "No"), gen(fs710_n)

*Depression score
gen Dep = fs701_n + fs702_n + fs703_n + fs704_n + fs706_n + fs707_n + fs708_n + fs705_n + fs709_n + fs710_n
recode Dep (0/3 = 0 "No") (4/10 = 1 "Yes"), gen(Dep_n)
ta Dep_n
ta Dep_n [iw=indiaindividualweight]
ta Dep_n [iw=indiaindividualweight] if dm005>=45

*Smoking
replace smoke = 0 if hb001==2
gen smoke=.
replace smoke = 2 if hb003_a ==1 | hb006==1
replace smoke = 1 if hb003_a ==2 | hb006==2
replace smoke = 0 if hb001==2
ta smoke
ta smoke [iw=indiaindividualweight]
label def smoke 0 "Never Smoke" 1 "Currently Not Smoking" 2 "Currently Smoking"
label values smoke smoke
ta smoke

*Socio
ta dm005
recode dm005 (45/59 = 1 "Young Old 45-59") (60/74 = 2 "Middle Old 60-74") (75/max = 3 "Oldest Old 75+"), gen (AgeDist)
ta AgeDist
ta dm021
recode dm021 (1 = 1 "Currently in Union") (2/7 = 2 "Currently Not in Union"), gen(dm021_n)
ta dm021_n
ta dm010
recode dm010 (2 = 1 "Hindu")(3 = 2 "Muslim")(else = 3 "Other"), gen(dm010_n)
ta dm010_n

*BMI
ta bm067
ta bm071
gen BMI = bm071/(bm067*0.01)^2
recode BMI (min/29.99999 = 0 "Not Obese")(30.00000/max = 1 "Obese"), gen(Obesity)
ta Obesity
ta Obesity [iw=indiaindividualweight]

*Prevalence of Hypertension
ta ht002 if dm003==1
ta ht002 if dm003==1 [iw=indiaindividualweight]
ta ht002 if dm003==1 & ag==1
ta ht002 if dm003==1 & ag==1 [iw=indiaindividualweight]
ta ht002 if dm003==1 & ag==2
ta ht002 if dm003==1 & ag==2 [iw=indiaindividualweight]
ta ht002 if dm003==2
ta ht002 if dm003==2 [iw=indiaindividualweight]
ta ht002 if dm003==2 & ag==1
ta ht002 if dm003==2 & ag==1 [iw=indiaindividualweight]
ta ht002 if dm003==2 & ag==2
ta ht002 if dm003==2 & ag==2 [iw=indiaindividualweight]

ta ht002 if residence==1
ta ht002 if residence==1 [iw=indiaindividualweight]
ta ht002 if residence==1 & ag==1
ta ht002 if residence==1 & ag==1 [iw=indiaindividualweight]
ta ht002 if residence==1 & ag==2
ta ht002 if residence==1 & ag==2 [iw=indiaindividualweight]
ta ht002 if residence==2
ta ht002 if residence==2 [iw=indiaindividualweight]
ta ht002 if residence==2 & ag==1
ta ht002 if residence==2 & ag==1 [iw=indiaindividualweight]
ta ht002 if residence==2 & ag==2
ta ht002 if residence==2 & ag==2 [iw=indiaindividualweight]

ta ht002 if dm010_n==1
ta ht002 if dm010_n==1 [iw=indiaindividualweight]
ta ht002 if dm010_n==1 & ag==1
ta ht002 if dm010_n==1 & ag==1 [iw=indiaindividualweight]
ta ht002 if dm010_n==1 & ag==2
ta ht002 if dm010_n==1 & ag==2 [iw=indiaindividualweight]
ta ht002 if dm010_n==2
ta ht002 if dm010_n==2 [iw=indiaindividualweight]
ta ht002 if dm010_n==2 & ag==1
ta ht002 if dm010_n==2 & ag==1 [iw=indiaindividualweight]
ta ht002 if dm010_n==2 & ag==2
ta ht002 if dm010_n==2 & ag==2 [iw=indiaindividualweight]
ta ht002 if dm010_n==3
ta ht002 if dm010_n==3 [iw=indiaindividualweight]
ta ht002 if dm010_n==3 & ag==1
ta ht002 if dm010_n==3 & ag==1 [iw=indiaindividualweight]
ta ht002 if dm010_n==3 & ag==2
ta ht002 if dm010_n==3 & ag==2 [iw=indiaindividualweight]

ta ht002 if edu_lvl==1
ta ht002 if edu_lvl==1 [iw=indiaindividualweight]
ta ht002 if edu_lvl==1 & ag==1
ta ht002 if edu_lvl==1 & ag==1 [iw=indiaindividualweight]
ta ht002 if edu_lvl==1 & ag==2
ta ht002 if edu_lvl==1 & ag==2 [iw=indiaindividualweight]
ta ht002 if edu_lvl==2
ta ht002 if edu_lvl==2 [iw=indiaindividualweight]
ta ht002 if edu_lvl==2 & ag==1
ta ht002 if edu_lvl==2 & ag==1 [iw=indiaindividualweight]
ta ht002 if edu_lvl==2 & ag==2
ta ht002 if edu_lvl==2 & ag==2 [iw=indiaindividualweight]
ta ht002 if edu_lvl==3
ta ht002 if edu_lvl==3 [iw=indiaindividualweight]
ta ht002 if edu_lvl==3 & ag==1
ta ht002 if edu_lvl==3 & ag==1 [iw=indiaindividualweight]
ta ht002 if edu_lvl==3 & ag==2
ta ht002 if edu_lvl==3 & ag==2 [iw=indiaindividualweight]
ta ht002 if edu_lvl==4
ta ht002 if edu_lvl==4 [iw=indiaindividualweight]
ta ht002 if edu_lvl==4 & ag==1
ta ht002 if edu_lvl==4 & ag==1 [iw=indiaindividualweight]
ta ht002 if edu_lvl==4 & ag==2
ta ht002 if edu_lvl==4 & ag==2 [iw=indiaindividualweight]

ta ht002 if dm013==1
ta ht002 if dm013==1 [iw=indiaindividualweight]
ta ht002 if dm013==1 & ag==1
ta ht002 if dm013==1 & ag==1 [iw=indiaindividualweight]
ta ht002 if dm013==1 & ag==2
ta ht002 if dm013==1 & ag==2 [iw=indiaindividualweight]
ta ht002 if dm013==2
ta ht002 if dm013==2 [iw=indiaindividualweight]
ta ht002 if dm013==2 & ag==1
ta ht002 if dm013==2 & ag==1 [iw=indiaindividualweight]
ta ht002 if dm013==2 & ag==2
ta ht002 if dm013==2 & ag==2 [iw=indiaindividualweight]
ta ht002 if dm013==3
ta ht002 if dm013==3 [iw=indiaindividualweight]
ta ht002 if dm013==3 & ag==1
ta ht002 if dm013==3 & ag==1 [iw=indiaindividualweight]
ta ht002 if dm013==3 & ag==2
ta ht002 if dm013==3 & ag==2 [iw=indiaindividualweight]
ta ht002 if dm013==4
ta ht002 if dm013==4 [iw=indiaindividualweight]
ta ht002 if dm013==4 & ag==1
ta ht002 if dm013==4 & ag==1 [iw=indiaindividualweight]
ta ht002 if dm013==4 & ag==2
ta ht002 if dm013==4 & ag==2 [iw=indiaindividualweight]

ta ht002 if dm021_n==1
ta ht002 if dm021_n==1 [iw=indiaindividualweight]
ta ht002 if dm021_n==1 & ag==1
ta ht002 if dm021_n==1 & ag==1 [iw=indiaindividualweight]
ta ht002 if dm021_n==1 & ag==2
ta ht002 if dm021_n==1 & ag==2 [iw=indiaindividualweight]
ta ht002 if dm021_n==2
ta ht002 if dm021_n==2 [iw=indiaindividualweight]
ta ht002 if dm021_n==2 & ag==1
ta ht002 if dm021_n==2 & ag==1 [iw=indiaindividualweight]
ta ht002 if dm021_n==2 & ag==2
ta ht002 if dm021_n==2 & ag==2 [iw=indiaindividualweight]

ta ht002 if mpce_quintile ==1
ta ht002 if mpce_quintile ==1 [iw=indiaindividualweight]
ta ht002 if mpce_quintile ==1 & ag==1
ta ht002 if mpce_quintile ==1 & ag==1 [iw=indiaindividualweight]
ta ht002 if mpce_quintile ==1 & ag==2
ta ht002 if mpce_quintile ==1 & ag==2 [iw=indiaindividualweight]
ta ht002 if mpce_quintile ==2
ta ht002 if mpce_quintile ==2 [iw=indiaindividualweight]
ta ht002 if mpce_quintile ==2 & ag==1
ta ht002 if mpce_quintile ==2 & ag==1 [iw=indiaindividualweight]
ta ht002 if mpce_quintile ==2 & ag==2
ta ht002 if mpce_quintile ==2 & ag==2 [iw=indiaindividualweight]
ta ht002 if mpce_quintile ==3
ta ht002 if mpce_quintile ==3 [iw=indiaindividualweight]
ta ht002 if mpce_quintile ==3 & ag==1
ta ht002 if mpce_quintile ==3 & ag==1 [iw=indiaindividualweight]
ta ht002 if mpce_quintile ==3 & ag==2
ta ht002 if mpce_quintile ==3 & ag==2 [iw=indiaindividualweight]
ta ht002 if mpce_quintile ==4
ta ht002 if mpce_quintile ==4 [iw=indiaindividualweight]
ta ht002 if mpce_quintile ==4 & ag==1
ta ht002 if mpce_quintile ==4 & ag==1 [iw=indiaindividualweight]
ta ht002 if mpce_quintile ==4 & ag==2
ta ht002 if mpce_quintile ==4 & ag==2 [iw=indiaindividualweight]
ta ht002 if mpce_quintile ==5
ta ht002 if mpce_quintile ==5 [iw=indiaindividualweight]
ta ht002 if mpce_quintile ==5 & ag==1
ta ht002 if mpce_quintile ==5 & ag==1 [iw=indiaindividualweight]
ta ht002 if mpce_quintile ==5 & ag==2
ta ht002 if mpce_quintile ==5 & ag==2 [iw=indiaindividualweight]

ta ht002 if Region==1
ta ht002 if Region==1 [iw=indiaindividualweight]
ta ht002 if Region==1 & ag==1
ta ht002 if Region==1 & ag==1 [iw=indiaindividualweight]
ta ht002 if Region==1 & ag==2
ta ht002 if Region==1 & ag==2 [iw=indiaindividualweight]
ta ht002 if Region==2
ta ht002 if Region==2 [iw=indiaindividualweight]
ta ht002 if Region==2 & ag==1
ta ht002 if Region==2 & ag==1 [iw=indiaindividualweight]
ta ht002 if Region==2 & ag==2
ta ht002 if Region==2 & ag==2 [iw=indiaindividualweight]
ta ht002 if Region==3
ta ht002 if Region==3 [iw=indiaindividualweight]
ta ht002 if Region==3 & ag==1
ta ht002 if Region==3 & ag==1 [iw=indiaindividualweight]
ta ht002 if Region==3 & ag==2
ta ht002 if Region==3 & ag==2 [iw=indiaindividualweight]
ta ht002 if Region==4
ta ht002 if Region==4 [iw=indiaindividualweight]
ta ht002 if Region==4 & ag==1
ta ht002 if Region==4 & ag==1 [iw=indiaindividualweight]
ta ht002 if Region==4 & ag==2
ta ht002 if Region==4 & ag==2 [iw=indiaindividualweight]
ta ht002 if Region==5
ta ht002 if Region==5 [iw=indiaindividualweight]
ta ht002 if Region==5 & ag==1
ta ht002 if Region==5 & ag==1 [iw=indiaindividualweight]
ta ht002 if Region==5 & ag==2
ta ht002 if Region==5 & ag==2 [iw=indiaindividualweight]

ta ht002 if hb213==1
ta ht002 if hb213==1 [iw=indiaindividualweight]
ta ht002 if hb213==1 & ag==1
ta ht002 if hb213==1 & ag==1 [iw=indiaindividualweight]
ta ht002 if hb213==1 & ag==2
ta ht002 if hb213==1 & ag==2 [iw=indiaindividualweight]
ta ht002 if hb213==2
ta ht002 if hb213==2 [iw=indiaindividualweight]
ta ht002 if hb213==2 & ag==1
ta ht002 if hb213==2 & ag==1 [iw=indiaindividualweight]
ta ht002 if hb213==2 & ag==2
ta ht002 if hb213==2 & ag==2 [iw=indiaindividualweight]
ta ht002 if hb213==3
ta ht002 if hb213==3 [iw=indiaindividualweight]
ta ht002 if hb213==3 & ag==1
ta ht002 if hb213==3 & ag==1 [iw=indiaindividualweight]
ta ht002 if hb213==3 & ag==2
ta ht002 if hb213==3 & ag==2 [iw=indiaindividualweight]
ta ht002 if hb213==4
ta ht002 if hb213==4 [iw=indiaindividualweight]
ta ht002 if hb213==4 & ag==1
ta ht002 if hb213==4 & ag==1 [iw=indiaindividualweight]
ta ht002 if hb213==4 & ag==2
ta ht002 if hb213==4 & ag==2 [iw=indiaindividualweight]
ta ht002 if hb213==5
ta ht002 if hb213==5 [iw=indiaindividualweight]
ta ht002 if hb213==5 & ag==1
ta ht002 if hb213==5 & ag==1 [iw=indiaindividualweight]
ta ht002 if hb213==5 & ag==2
ta ht002 if hb213==5 & ag==2 [iw=indiaindividualweight]

ta ht002 if smoke==0
ta ht002 if smoke==0 [iw=indiaindividualweight]
ta ht002 if smoke==0 & ag==1
ta ht002 if smoke==0 & ag==1 [iw=indiaindividualweight]
ta ht002 if smoke==0 & ag==2
ta ht002 if smoke==0 & ag==2 [iw=indiaindividualweight]
ta ht002 if smoke==1
ta ht002 if smoke==1 [iw=indiaindividualweight]
ta ht002 if smoke==1 & ag==1
ta ht002 if smoke==1 & ag==1 [iw=indiaindividualweight]
ta ht002 if smoke==1 & ag==2
ta ht002 if smoke==1 & ag==2 [iw=indiaindividualweight]
ta ht002 if smoke==2
ta ht002 if smoke==2 [iw=indiaindividualweight]
ta ht002 if smoke==2 & ag==1
ta ht002 if smoke==2 & ag==1 [iw=indiaindividualweight]
ta ht002 if smoke==2 & ag==2
ta ht002 if smoke==2 & ag==2 [iw=indiaindividualweight]

ta ht002 if Obesity==0
ta ht002 if Obesity==0 [iw=indiaindividualweight]
ta ht002 if Obesity==0 & ag==1
ta ht002 if Obesity==0 & ag==1 [iw=indiaindividualweight]
ta ht002 if Obesity==0 & ag==2
ta ht002 if Obesity==0 & ag==2 [iw=indiaindividualweight]
ta ht002 if Obesity==1
ta ht002 if Obesity==1 [iw=indiaindividualweight]
ta ht002 if Obesity==1 & ag==1
ta ht002 if Obesity==1 & ag==1 [iw=indiaindividualweight]
ta ht002 if Obesity==1 & ag==2
ta ht002 if Obesity==1 & ag==2 [iw=indiaindividualweight]

ta Dep_n if ht002==1
ta Dep_n if ht002==1 [iw=indiaindividualweight]
ta Dep_n if ht002==1 & ag==1
ta Dep_n if ht002==1 & ag==1 [iw=indiaindividualweight]
ta Dep_n if ht002==1 & ag==2
ta Dep_n if ht002==1 & ag==2 [iw=indiaindividualweight]
ta Dep_n if ht002==2
ta Dep_n if ht002==2 [iw=indiaindividualweight]
ta Dep_n if ht002==2 & ag==1
ta Dep_n if ht002==2 & ag==1 [iw=indiaindividualweight]
ta Dep_n if ht002==2 & ag==2
ta Dep_n if ht002==2 & ag==2 [iw=indiaindividualweight]

ta ht002 if Dep_n==0
ta ht002 if Dep_n==0 [iw=indiaindividualweight]
ta ht002 if Dep_n==0 & ag==1
ta ht002 if Dep_n==0 & ag==1 [iw=indiaindividualweight]
ta ht002 if Dep_n==0 & ag==2
ta ht002 if Dep_n==0 & ag==2 [iw=indiaindividualweight]
ta ht002 if Dep_n==1
ta ht002 if Dep_n==1 [iw=indiaindividualweight]
ta ht002 if Dep_n==1 & ag==1
ta ht002 if Dep_n==1 & ag==1 [iw=indiaindividualweight]
ta ht002 if Dep_n==1 & ag==2
ta ht002 if Dep_n==1 & ag==2 [iw=indiaindividualweight]

*Prevalence of Depression(India)

ta Dep_n if dm003==1
ta Dep_n if dm003==1 [iw=indiaindividualweight]
ta Dep_n if dm003==1 & ag==1
ta Dep_n if dm003==1 & ag==1 [iw=indiaindividualweight]
ta Dep_n if dm003==1 & ag==2
ta Dep_n if dm003==1 & ag==2 [iw=indiaindividualweight]
ta Dep_n if dm003==2
ta Dep_n if dm003==2 [iw=indiaindividualweight]
ta Dep_n if dm003==2 & ag==1
ta Dep_n if dm003==2 & ag==1 [iw=indiaindividualweight]
ta Dep_n if dm003==2 & ag==2
ta Dep_n if dm003==2 & ag==2 [iw=indiaindividualweight]

ta Dep_n if residence==1
ta Dep_n if residence==1 [iw=indiaindividualweight]
ta Dep_n if residence==1 & ag==1
ta Dep_n if residence==1 & ag==1 [iw=indiaindividualweight]
ta Dep_n if residence==1 & ag==2
ta Dep_n if residence==1 & ag==2 [iw=indiaindividualweight]
ta Dep_n if residence==2
ta Dep_n if residence==2 [iw=indiaindividualweight]
ta Dep_n if residence==2 & ag==1
ta Dep_n if residence==2 & ag==1 [iw=indiaindividualweight]
ta Dep_n if residence==2 & ag==2
ta Dep_n if residence==2 & ag==2 [iw=indiaindividualweight]

ta Dep_n if dm010_n==1
ta Dep_n if dm010_n==1 [iw=indiaindividualweight]
ta Dep_n if dm010_n==1 & ag==1
ta Dep_n if dm010_n==1 & ag==1 [iw=indiaindividualweight]
ta Dep_n if dm010_n==1 & ag==2
ta Dep_n if dm010_n==1 & ag==2 [iw=indiaindividualweight]
ta Dep_n if dm010_n==2
ta Dep_n if dm010_n==2 [iw=indiaindividualweight]
ta Dep_n if dm010_n==2 & ag==1
ta Dep_n if dm010_n==2 & ag==1 [iw=indiaindividualweight]
ta Dep_n if dm010_n==2 & ag==2
ta Dep_n if dm010_n==2 & ag==2 [iw=indiaindividualweight]
ta Dep_n if dm010_n==3
ta Dep_n if dm010_n==3 [iw=indiaindividualweight]
ta Dep_n if dm010_n==3 & ag==1
ta Dep_n if dm010_n==3 & ag==1 [iw=indiaindividualweight]
ta Dep_n if dm010_n==3 & ag==2
ta Dep_n if dm010_n==3 & ag==2 [iw=indiaindividualweight]

ta Dep_n if edu_lvl==1
ta Dep_n if edu_lvl==1 [iw=indiaindividualweight]
ta Dep_n if edu_lvl==1 & ag==1
ta Dep_n if edu_lvl==1 & ag==1 [iw=indiaindividualweight]
ta Dep_n if edu_lvl==1 & ag==2
ta Dep_n if edu_lvl==1 & ag==2 [iw=indiaindividualweight]
ta Dep_n if edu_lvl==2
ta Dep_n if edu_lvl==2 [iw=indiaindividualweight]
ta Dep_n if edu_lvl==2 & ag==1
ta Dep_n if edu_lvl==2 & ag==1 [iw=indiaindividualweight]
ta Dep_n if edu_lvl==2 & ag==2
ta Dep_n if edu_lvl==2 & ag==2 [iw=indiaindividualweight]
ta Dep_n if edu_lvl==3
ta Dep_n if edu_lvl==3 [iw=indiaindividualweight]
ta Dep_n if edu_lvl==3 & ag==1
ta Dep_n if edu_lvl==3 & ag==1 [iw=indiaindividualweight]
ta Dep_n if edu_lvl==3 & ag==2
ta Dep_n if edu_lvl==3 & ag==2 [iw=indiaindividualweight]
ta Dep_n if edu_lvl==4
ta Dep_n if edu_lvl==4 [iw=indiaindividualweight]
ta Dep_n if edu_lvl==4 & ag==1
ta Dep_n if edu_lvl==4 & ag==1 [iw=indiaindividualweight]
ta Dep_n if edu_lvl==4 & ag==2
ta Dep_n if edu_lvl==4 & ag==2 [iw=indiaindividualweight]

ta Dep_n if dm013==1
ta Dep_n if dm013==1 [iw=indiaindividualweight]
ta Dep_n if dm013==1 & ag==1
ta Dep_n if dm013==1 & ag==1 [iw=indiaindividualweight]
ta Dep_n if dm013==1 & ag==2
ta Dep_n if dm013==1 & ag==2 [iw=indiaindividualweight]
ta Dep_n if dm013==2
ta Dep_n if dm013==2 [iw=indiaindividualweight]
ta Dep_n if dm013==2 & ag==1
ta Dep_n if dm013==2 & ag==1 [iw=indiaindividualweight]
ta Dep_n if dm013==2 & ag==2
ta Dep_n if dm013==2 & ag==2 [iw=indiaindividualweight]
ta Dep_n if dm013==3
ta Dep_n if dm013==3 [iw=indiaindividualweight]
ta Dep_n if dm013==3 & ag==1
ta Dep_n if dm013==3 & ag==1 [iw=indiaindividualweight]
ta Dep_n if dm013==3 & ag==2
ta Dep_n if dm013==3 & ag==2 [iw=indiaindividualweight]
ta Dep_n if dm013==4
ta Dep_n if dm013==4 [iw=indiaindividualweight]
ta Dep_n if dm013==4 & ag==1
ta Dep_n if dm013==4 & ag==1 [iw=indiaindividualweight]
ta Dep_n if dm013==4 & ag==2
ta Dep_n if dm013==4 & ag==2 [iw=indiaindividualweight]

ta Dep_n if dm021_n==1
ta Dep_n if dm021_n==1 [iw=indiaindividualweight]
ta Dep_n if dm021_n==1 & ag==1
ta Dep_n if dm021_n==1 & ag==1 [iw=indiaindividualweight]
ta Dep_n if dm021_n==1 & ag==2
ta Dep_n if dm021_n==1 & ag==2 [iw=indiaindividualweight]
ta Dep_n if dm021_n==2
ta Dep_n if dm021_n==2 [iw=indiaindividualweight]
ta Dep_n if dm021_n==2 & ag==1
ta Dep_n if dm021_n==2 & ag==1 [iw=indiaindividualweight]
ta Dep_n if dm021_n==2 & ag==2
ta Dep_n if dm021_n==2 & ag==2 [iw=indiaindividualweight]

ta Dep_n if mpce_quintile ==1
ta Dep_n if mpce_quintile ==1 [iw=indiaindividualweight]
ta Dep_n if mpce_quintile ==1 & ag==1
ta Dep_n if mpce_quintile ==1 & ag==1 [iw=indiaindividualweight]
ta Dep_n if mpce_quintile ==1 & ag==2
ta Dep_n if mpce_quintile ==1 & ag==2 [iw=indiaindividualweight]
ta Dep_n if mpce_quintile ==2
ta Dep_n if mpce_quintile ==2 [iw=indiaindividualweight]
ta Dep_n if mpce_quintile ==2 & ag==1
ta Dep_n if mpce_quintile ==2 & ag==1 [iw=indiaindividualweight]
ta Dep_n if mpce_quintile ==2 & ag==2
ta Dep_n if mpce_quintile ==2 & ag==2 [iw=indiaindividualweight]
ta Dep_n if mpce_quintile ==3
ta Dep_n if mpce_quintile ==3 [iw=indiaindividualweight]
ta Dep_n if mpce_quintile ==3 & ag==1
ta Dep_n if mpce_quintile ==3 & ag==1 [iw=indiaindividualweight]
ta Dep_n if mpce_quintile ==3 & ag==2
ta Dep_n if mpce_quintile ==3 & ag==2 [iw=indiaindividualweight]
ta Dep_n if mpce_quintile ==4
ta Dep_n if mpce_quintile ==4 [iw=indiaindividualweight]
ta Dep_n if mpce_quintile ==4 & ag==1
ta Dep_n if mpce_quintile ==4 & ag==1 [iw=indiaindividualweight]
ta Dep_n if mpce_quintile ==4 & ag==2
ta Dep_n if mpce_quintile ==4 & ag==2 [iw=indiaindividualweight]
ta Dep_n if mpce_quintile ==5
ta Dep_n if mpce_quintile ==5 [iw=indiaindividualweight]
ta Dep_n if mpce_quintile ==5 & ag==1
ta Dep_n if mpce_quintile ==5 & ag==1 [iw=indiaindividualweight]
ta Dep_n if mpce_quintile ==5 & ag==2
ta Dep_n if mpce_quintile ==5 & ag==2 [iw=indiaindividualweight]

ta Dep_n if Region==1
ta Dep_n if Region==1 [iw=indiaindividualweight]
ta Dep_n if Region==1 & ag==1
ta Dep_n if Region==1 & ag==1 [iw=indiaindividualweight]
ta Dep_n if Region==1 & ag==2
ta Dep_n if Region==1 & ag==2 [iw=indiaindividualweight]
ta Dep_n if Region==2
ta Dep_n if Region==2 [iw=indiaindividualweight]
ta Dep_n if Region==2 & ag==1
ta Dep_n if Region==2 & ag==1 [iw=indiaindividualweight]
ta Dep_n if Region==2 & ag==2
ta Dep_n if Region==2 & ag==2 [iw=indiaindividualweight]
ta Dep_n if Region==3
ta Dep_n if Region==3 [iw=indiaindividualweight]
ta Dep_n if Region==3 & ag==1
ta Dep_n if Region==3 & ag==1 [iw=indiaindividualweight]
ta Dep_n if Region==3 & ag==2
ta Dep_n if Region==3 & ag==2 [iw=indiaindividualweight]
ta Dep_n if Region==4
ta Dep_n if Region==4 [iw=indiaindividualweight]
ta Dep_n if Region==4 & ag==1
ta Dep_n if Region==4 & ag==1 [iw=indiaindividualweight]
ta Dep_n if Region==4 & ag==2
ta Dep_n if Region==4 & ag==2 [iw=indiaindividualweight]
ta Dep_n if Region==5
ta Dep_n if Region==5 [iw=indiaindividualweight]
ta Dep_n if Region==5 & ag==1
ta Dep_n if Region==5 & ag==1 [iw=indiaindividualweight]
ta Dep_n if Region==5 & ag==2
ta Dep_n if Region==5 & ag==2 [iw=indiaindividualweight]

ta Dep_n if hb213==1
ta Dep_n if hb213==1 [iw=indiaindividualweight]
ta Dep_n if hb213==1 & ag==1
ta Dep_n if hb213==1 & ag==1 [iw=indiaindividualweight]
ta Dep_n if hb213==1 & ag==2
ta Dep_n if hb213==1 & ag==2 [iw=indiaindividualweight]
ta Dep_n if hb213==2
ta Dep_n if hb213==2 [iw=indiaindividualweight]
ta Dep_n if hb213==2 & ag==1
ta Dep_n if hb213==2 & ag==1 [iw=indiaindividualweight]
ta Dep_n if hb213==2 & ag==2
ta Dep_n if hb213==2 & ag==2 [iw=indiaindividualweight]
ta Dep_n if hb213==3
ta Dep_n if hb213==3 [iw=indiaindividualweight]
ta Dep_n if hb213==3 & ag==1
ta Dep_n if hb213==3 & ag==1 [iw=indiaindividualweight]
ta Dep_n if hb213==3 & ag==2
ta Dep_n if hb213==3 & ag==2 [iw=indiaindividualweight]
ta Dep_n if hb213==4
ta Dep_n if hb213==4 [iw=indiaindividualweight]
ta Dep_n if hb213==4 & ag==1
ta Dep_n if hb213==4 & ag==1 [iw=indiaindividualweight]
ta Dep_n if hb213==4 & ag==2
ta Dep_n if hb213==4 & ag==2 [iw=indiaindividualweight]
ta Dep_n if hb213==5
ta Dep_n if hb213==5 [iw=indiaindividualweight]
ta Dep_n if hb213==5 & ag==1
ta Dep_n if hb213==5 & ag==1 [iw=indiaindividualweight]
ta Dep_n if hb213==5 & ag==2
ta Dep_n if hb213==5 & ag==2 [iw=indiaindividualweight]

ta Dep_n if smoke==0
ta Dep_n if smoke==0 [iw=indiaindividualweight]
ta Dep_n if smoke==0 & ag==1
ta Dep_n if smoke==0 & ag==1 [iw=indiaindividualweight]
ta Dep_n if smoke==0 & ag==2
ta Dep_n if smoke==0 & ag==2 [iw=indiaindividualweight]
ta Dep_n if smoke==1
ta Dep_n if smoke==1 [iw=indiaindividualweight]
ta Dep_n if smoke==1 & ag==1
ta Dep_n if smoke==1 & ag==1 [iw=indiaindividualweight]
ta Dep_n if smoke==1 & ag==2
ta Dep_n if smoke==1 & ag==2 [iw=indiaindividualweight]
ta Dep_n if smoke==2
ta Dep_n if smoke==2 [iw=indiaindividualweight]
ta Dep_n if smoke==2 & ag==1
ta Dep_n if smoke==2 & ag==1 [iw=indiaindividualweight]
ta Dep_n if smoke==2 & ag==2
ta Dep_n if smoke==2 & ag==2 [iw=indiaindividualweight]

ta Dep_n if Obesity==0
ta Dep_n if Obesity==0 [iw=indiaindividualweight]
ta Dep_n if Obesity==0 & ag==1
ta Dep_n if Obesity==0 & ag==1 [iw=indiaindividualweight]
ta Dep_n if Obesity==0 & ag==2
ta Dep_n if Obesity==0 & ag==2 [iw=indiaindividualweight]
ta Dep_n if Obesity==1
ta Dep_n if Obesity==1 [iw=indiaindividualweight]
ta Dep_n if Obesity==1 & ag==1
ta Dep_n if Obesity==1 & ag==1 [iw=indiaindividualweight]
ta Dep_n if Obesity==1 & ag==2
ta Dep_n if Obesity==1 & ag==2 [iw=indiaindividualweight]

ta Dep_n if ht002==1
ta Dep_n if ht002==1 [iw=indiaindividualweight]
ta Dep_n if ht002==1 & ag==1
ta Dep_n if ht002==1 & ag==1 [iw=indiaindividualweight]
ta Dep_n if ht002==1 & ag==2
ta Dep_n if ht002==1 & ag==2 [iw=indiaindividualweight]
ta Dep_n if ht002==2
ta Dep_n if ht002==2 [iw=indiaindividualweight]
ta Dep_n if ht002==2 & ag==1
ta Dep_n if ht002==2 & ag==1 [iw=indiaindividualweight]
ta Dep_n if ht002==2 & ag==2
ta Dep_n if ht002==2 & ag==2 [iw=indiaindividualweight]
