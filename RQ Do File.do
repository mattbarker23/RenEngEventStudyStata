clear

use "/Users/mattb/Documents/School/QAMO/Business Econometrics 2/Research Question/3/RQ Data File Stata.dta"

***GENERATE VARIABLES

// gen eventnegative4 = 0
// replace eventnegative4 = 1 if eventtime==-4
//
// gen eventnegative3 = 0
// replace eventnegative3 = 1 if eventtime==-3
//
// gen eventnegative2 = 0 
// replace eventnegative2 = 1 if eventtime==-2
//
// gen event0 = 0
// replace event0 = 1 if eventtime==0
//
// gen event1 = 0
// replace event1 = 1 if eventtime==1
//
// gen event2 = 0
// replace event2 = 1 if eventtime==2

*_________________________________________________________________________________
***REGRESSIONS

xtset countrycode year

reg renewableasaoftotalenergy ratified, robust

outreg2 using panelOutreg, excel replace ctitle(Simple Regression)

xtreg renewableasaoftotalenergy eventnegative4 eventnegative3 eventnegative2 event0 event1 event2, fe

outreg2 using panelOutreg, excel append ctitle(Fixed Effects - Event Study)


xtreg renewableasaoftotalenergy eventnegative4 eventnegative3 eventnegative2 event0 event1 event2 gdppercapitausd, fe

outreg2 using panelOutreg, excel append ctitle(Fixed Effects - Event Study w/ GDP)

*_________________________________________________________________________________
***DATA VISUALIZATIONS

// collapse (mean) renewableenergyprod, by(year)
// twoway bar renewableenergyprod year


// collapse (mean) renewableasaoftotalenergy, by(year)
// twoway scatter renewableasaoftotalenergy year, connect(1)

sparkline renewableasaoftotalenergy year, by(countrycode)

sparkline renewableasaoftotalenergy year, over(country)
sparkline renewableasaoftotalenergy year if countrycode==1, over(country)

line renewableasaoftotalenergy year, over(country)

line renewableasaoftotalenergy year if countrycode==1 || line renewableasaoftotalenergy year if countrycode==2 ||line renewableasaoftotalenergy year if countrycode==3 || line renewableasaoftotalenergy year if countrycode==4 || line renewableasaoftotalenergy year if countrycode==5 || line renewableasaoftotalenergy year if countrycode==6 ||line renewableasaoftotalenergy year if countrycode==7 || line renewableasaoftotalenergy year if countrycode==8 || line renewableasaoftotalenergy year if countrycode==9 || line renewableasaoftotalenergy year if countrycode==10 ||line renewableasaoftotalenergy year if countrycode==11 || line renewableasaoftotalenergy year if countrycode==12 || line renewableasaoftotalenergy year if countrycode==13 || line renewableasaoftotalenergy year if countrycode==14 ||line renewableasaoftotalenergy year if countrycode==15 || line renewableasaoftotalenergy year if countrycode==16 || line renewableasaoftotalenergy year if countrycode==17 ||line renewableasaoftotalenergy year if countrycode==18 || line renewableasaoftotalenergy year if countrycode==19
        
*_________________________________________________________________________________
***TABLES

by country, sort: egen MEANtotalenergyprod = mean(totalenergyprod)
gen meantotalenergyprod=(totalenergyprod)

tab year, sum(totalenergyprod)

tab country, sum(MEANtotalenergyprod)

tab country, sum(totalenergyprod)
*_________________________________________________________________________________
***ALTERNATE REGRESSIONS

reg renewableasaoftotalenergy ratified, robust

reg renewableasaoftotalenergy eventnegative4 eventnegative3 eventnegative2 event0 event1 event2 i.year i.countrycode, robust

reg renewableasaoftotalenergy eventnegative4 eventnegative3 eventnegative2 event0 event1 event2 gdppercapitausd i.year i.countrycode, robust

reg renewableenergyprod eventnegative4 eventnegative3 eventnegative2 event0 event1 event2 gdppercapitausd i.year i.countrycode, robust
