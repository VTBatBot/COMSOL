module purge
module load comsol/5.3.260
echo "comsol module loaded"
l=5
while [ $l -le $maxl ]
do
c=3
while [ $c -le $maxc ]
do
d=1
while [ $d -le $maxd ]
do
#
#PBS -l walltime=1:00:00
#PBS -l nodes=4:ppn=32
#PBS -W group_list=newriver
#PBS -q open_q
#PBS -j oe
#
cd $PBS_O_WORKDIR
#
#  All your nodes are belong to us
#
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
results="Results.mph"
resultlocation="results/"
outputfile="$resultlocation$length$lvalstr$paramstring$cvalstr$ccharstr$dvalstr$dcharstr$results"
log="LOG.log"
logfile="$resultlocation$length$lvalstr$paramstring$cvalstr$ccharstr$dvalstr$dcharstr$log"
text="TEXTLOG.txt"
textlogfile="$resultlocation$length$lvalstr$paramstring$cvalstr$ccharstr$dvalstr$dcharstr$text"
comsol batch -inputfile $inputfile -outputfile $outputfile  -batchlog $logfile > $textlogfile
#
echo "simulation launched"
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