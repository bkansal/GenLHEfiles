#!/bin/sh
JOBS="jobs"
TEMP="templatecards"
PROC="SMS-C1N2"
PARTC1="_mC1-"
PARTN2="_mN2-"
### Create cards and SLHAs for all mass points

for MC1 in 100 125 150 175 200 225 250 275 300 325; do
    for DM in 50 40 30 20 15 10 7.5 5 3 1; do

	MN2=`awk "BEGIN {printf \"%.2f\n\", (${MC1}-${DM})}"`
	MN2STR=${MN2/./p}
	MC1STR=${MC1/./p}
	MODEL=${PROC}${PARTC1}${MC1STR}${PARTN2}${MN2STR}
	mkdir -p "${JOBS}/${MODEL}"
	cp ${TEMP}/${PROC}_run_card.dat "${JOBS}/${MODEL}/${MODEL}_run_card.dat"
	sed "s/%MN2%/${MN2STR}/g;s/%MC1%/${MC1STR}/g" ${TEMP}/${PROC}_proc_card.dat > "${JOBS}/${MODEL}/${MODEL}_proc_card.dat"
	sed "s/%MN2%/${MN2}/g;s/%MC1%/${MC1}/g" ${TEMP}/${PROC}_customizecards.dat > "${JOBS}/${MODEL}/${MODEL}_customizecards.dat"
	sed "s/%MN2%/${MN2}/g;s/%MC1%/${MC1}/g" ${TEMP}/${PROC}.slha > ${JOBS}/${MODEL}/${MODEL}.slha
    done
done
	
