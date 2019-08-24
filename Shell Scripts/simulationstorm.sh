#! /bin/bash
#
#PBS -l walltime=30:00:00
#PBS -l nodes=3:ppn=24
#PBS -W group_list=newriver
#PBS -q normal_q
#PBS -A neec_comsol	
#PBS -M nathc17@vt.edu
#PBS -m bea
#PBS -j oe
#
cd $PBS_O_WORKDIR
#
#  All your nodes are belong to us
#
echo "Sucessfully connected to ARC supercomputer"
echo "Initiating Simulationstorm 1.0"
maxc=8
maxd=6
maxl=5
b=""
lnum=$((($maxl-3)))
let number=$maxc*$maxd*$maxl
b="$b$number"
module purge
module load comsol/5.3.260
echo "comsol module loaded"
l=5
while [ $l -le $maxl ]
do
c=1
while [ $c -le $maxc ]
do
d=1
while [ $d -le $maxd ]
do
length="Length"
lvalstr="$l"
ccharstr="c"
dcharstr="d"
cvalstr="$c"
dvalstr="$d"
paramstring="params"
fileend=".class"
filelocation="simulationcodes/"
inputfile="$filelocation$length$lvalstr$paramstring$cvalstr$ccharstr$dvalstr$dcharstr$fileend"
results="Results_Model.mph"
resultlocation="results/"
outputfile="$resultlocation$length$lvalstr$paramstring$cvalstr$ccharstr$dvalstr$dcharstr$results"
log="LOG.log"
logfile="$resultlocation$length$lvalstr$paramstring$cvalstr$ccharstr$dvalstr$dcharstr$log"
text="TEXTLOG.txt"
textlogfile="$resultlocation$length$lvalstr$paramstring$cvalstr$ccharstr$dvalstr$dcharstr$text"
#
comsol batch -inputfile $inputfile -outputfile $outputfile  -batchlog $logfile > $textlogfile
#
echo "simulation launched"
jobid="$PBS_JOBID"
echo "currently running ID: "
echo ${jobid}
echo "with core allocation of: "
echo ${PBS_NP}
if [ $? -ne 0 ]; then
echo "COMSOL_NEWRIVER: Run error!"
exit 1
fi
#
echo "COMSOL_NEWRIVER: Normal end of execution."
#
# Remove file to save space
#
rm -rf $outputfile
echo "simulation mph file removed to save space."
d=$(($d+1))
done
c=$(($c+1))
done
l=$(($l+2))
done
echo "Simulationstorm successful"