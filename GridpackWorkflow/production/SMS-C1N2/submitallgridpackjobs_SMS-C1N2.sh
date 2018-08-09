#!/bin/sh
SCRIPT="../../test/scripts/submitGridpackCondorJob.py"
MODEL="SMS-C1N2_mChi-"
JOBS="jobs"

for MNLSP in 100 125 150 175 200 225 250 275 300 325 ; do
    python ${SCRIPT} ${MODEL}${MNLSP} --cards-dir ${JOBS}/${MODEL}${MNLSP} --proxy /tmp/x509up_ubkansal --genproductions-dir "/home/users/bkansal/SUSYsignalProduction/genproductions/"
done
