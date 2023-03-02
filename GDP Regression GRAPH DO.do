clear
use "/Users/mattb/Documents/School/QAMO/Business Econometrics 2/Research Question/4/GDP REGRESSION GRAPH DATA.dta"

destring Lower95, replace
destring Upper95, replace
destring EventTime, replace
destring Estimate, replace
twoway rarea Lower95 Upper95 EventTime, sort color(gs14) || scatter Estimate EventTime, connect(1) xline(0)

