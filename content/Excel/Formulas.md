# Formulas

Numbers from end of string on cell A1
```
=RIGHT(A1, LEN(A1) - MAX(IF(ISNUMBER(MID(A1, ROW(INDIRECT("1:"&LEN(A1))), 1) *1)=FALSE, ROW(INDIRECT("1:"&LEN(A1))), 0)))
```
Start of string on cell A2
```
=LEFT(A2, MATCH(FALSE, ISNUMBER(MID(A2, ROW(INDIRECT("1:"&LEN(A2)+1)), 1) *1), 0) -1)
```
From from any position
```
=SUMPRODUCT(MID(0&A2, LARGE(INDEX(ISNUMBER(--MID(A2, ROW(INDIRECT("1:"&LEN(A2))), 1)) * ROW(INDIRECT("1:"&LEN(A2))), 0), ROW(INDIRECT("1:"&LEN(A2))))+1, 1) * 10^ROW(INDIRECT("1:"&LEN(A2)))/10)
```
Decimal time to hours 
```
=TEXT(SUM(C2:C56)/24,"[h]:mm:ss")
```
Last day of month
```
="Date: "& TEXT(EOMONTH(TODAY(), 0),"dd/mm/yyyy")
```
Extract from cell with "Invoice n. 987654"
```
="Variable symbol:   "& RIGHT(B1, SEARCH(".",B1)-1)
```
