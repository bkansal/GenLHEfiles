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
# -------------------------------
#    Constructing grid

xmin, xmax, xstep = 1650, 2600, 50
nevts = 10 #Number of events in thousands

mpoints = []
cols = []
for mx in range(xmin, xmax+1, xstep):
  mpoints.append([mx, 1, nevts])
  cols.append([mx, 1, nevts])
## Test print out for repeated points

mset = set()
for mp in mpoints: mset.add(mp[0]*10000+mp[1])
Ntot, Ndiff = len(mpoints), len(mset)
if Ntot==Ndiff: print "\nGrid contains "+str(Ntot)+" mass points. No duplicates\n"
else: print "\n\nGRID CONTAINS "+str(Ntot-Ndiff)+" DUPLICATE POINTS!!\n\n"

# -------------------------------
#     Plotting and printing
ymin=0
ymax=1
# makePlot(cols, 'events', model, process, xmin, xmax, ymin, ymax)
# Ntot = makePlot(cols, 'lumi', model, process, xmin, xmax, ymin, ymax)
Ntot = 0
for mp in mpoints:
  nev = mp[2]
  Ntot += nev

Ntot = Ntot/1e3
print '\nScan contains '+"{0:,.0f}".format(Ntot*1e6)+" events\n"
print 'Average matching efficiency (for McM and GEN fragment) = '+"{0:.3f}".format(getAveEff(mpoints,process))
print

# for ind in range(len(scanBlocks)):
#   Nbulk, Ndiag = Nevents[ind][0]/1e3, Nevents[ind][1]/1e3
#   Nblock = Nbulk+Ndiag
#   print "From "+'{:>4}'.format(scanBlocks[ind].xmin)+" to "+str(scanBlocks[ind].xmax)+": ",
#   print "{0:>4.1f}".format(Nblock)+"M ("+"{0:>4.1f}".format(Nblock/Ntot*100)+" %) events, "+"{0:>4.1f}".format(Nbulk),
#   print "M ("+"{0:>4.1f}".format(Nbulk/Ntot*100)+" %) in the bulk, "+"{0:>4.1f}".format(Ndiag)+"M (",
#   print "{0:.1f}".format(Ndiag/Ntot*100)+" %) in the diagonal"

# print
