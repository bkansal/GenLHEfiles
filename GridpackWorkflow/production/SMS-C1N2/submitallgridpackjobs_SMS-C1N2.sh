#!/bin/sh
SCRIPT="../../test/scripts/submitGridpackCondorJob.py"
PROC="SMS-C1N2_"
PARTN2="mN2-"
PARTC1="mC1-"
JOBS="jobs"
genprodir="/home/users/bkansal/SUSYsignalProduction/genproductions/"
vomsdir="/tmp/x509up_ubkansal"

for MC1 in 100 ;do #125 150 175 200 225 250 275 300 325; do 
    for DM in 50 ;do #40 30 20 15 10 7.5 5 3 1; do 
	MN2=`awk "BEGIN {printf \"%.2f\n\", (${MC1}-${DM})}"`
	MN2STR=${MN2/./p}
	MC1STR=${MC1/./p}
	MODEL=${PROC}${PARTC1}${MC1STR}_${PARTN2}${MN2STR}
	python ${SCRIPT} ${MODEL} --cards-dir ${JOBS}/${MODEL} --proxy ${vomsdir} --genproductions-dir ${genprodir}
    done
done