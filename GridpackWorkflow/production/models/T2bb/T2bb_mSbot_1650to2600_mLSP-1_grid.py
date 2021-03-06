#!/usr/bin/env python

### Script to define scan grid

### Authors:
### Manuel Franco Sevilla
### Ana Ovcharova

import os,sys,math
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
from grid_utils import *

    
model = "T2bb"
process = "SbotSbot"
# Parameters that define the grid in the bulk and diagonal                                          
# -------------------------------                                                                 \
#    Constructing grid                                                                             

xmin, xmax, xstep = 1650, 2601, 50
nevts = 10 #Number of events in thousands                                                           

mpoints = []
for mx in range(xmin, xmax+1, xstep):
  mpoints.append([mx, 1, nevts])
## Test print out for repeated points                                                              

mset = set()
for mp in mpoints: mset.add(mp[0]*10000+mp[1])
Ntot, Ndiff = len(mpoints), len(mset)
if Ntot==Ndiff: print "\nGrid contains "+str(Ntot)+" mass points. No duplicates\n"
else: print "\n\nGRID CONTAINS "+str(Ntot-Ndiff)+" DUPLICATE POINTS!!\n\n"

# -------------------------------                                                                 
# Plotting and printing
Ntot = 0
for mp in mpoints:
  nev = mp[2]
  Ntot += nev

Ntot = Ntot/1e3
print '\nScan contains '+"{0:,.0f}".format(Ntot*1e6)+" events\n"
print 'Average matching efficiency (for McM and GEN fragment) = '+"{0:.3f}".format(getAveEff(mpoints,process))
print
