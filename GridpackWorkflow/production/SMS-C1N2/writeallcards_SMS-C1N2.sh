#!/bin/sh
JOBS="jobs"
TEMP="templatecards"
PROC="SMS-C1N2"
PART="_mChi-"

### Create cards and SLHAs for all mass points

for MNLSP in 100 125 150 175 200 225 250 275 300 325 ; do
    MODEL=${PROC}${PART}${MNLSP}
    mkdir -p "${JOBS}/${MODEL}"
    cp ${TEMP}/${PROC}_run_card.dat "${JOBS}/${MODEL}/${MODEL}_run_card.dat"
    sed "s/%MNLSP%/${MNLSP}/g" ${TEMP}/${PROC}_proc_card.dat > "${JOBS}/${MODEL}/${MODEL}_proc_card.dat"
    sed "s/%MNLSP%/${MNLSP}/g" ${TEMP}/${PROC}_customizecards.dat > "${JOBS}/${MODEL}/${MODEL}_customizecards.dat"
    sed "s/%MNLSP%/${MNLSP}/g" ${TEMP}/${PROC}.slha > ${JOBS}/${MODEL}/${MODEL}.slha
done
