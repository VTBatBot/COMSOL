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
echo "Initiating Simulationstorm 1.1 B"
maxMin=4
maxMaj=4
module purge
module load comsol/5.3.260
echo "comsol module loaded"
maj=1
while [ $maj -le $maxMaj ]
do
min=1
while [ $min -le $maxMin ]
do
major="majR"
majvalstr="$maj"
minor="minr"
minvalstr="$min"
fileend=".class"
filelocation="simulationcodes/"
inputfile="$filelocation$waveguide$majvalstr$major$minvalstr$minor$fileend"
results="Results_Model.mph"
resultlocation="results/"
outputfile="$resultlocation$waveguide$majvalstr$major$minvalstr$minor$results"
log="LOG.log"
logfile="$resultlocation$waveguide$majvalstr$major$minvalstr$minor$log"
text="TEXTLOG.txt"
textlogfile="$resultlocation$waveguide$majvalstr$major$minvalstr$minor$text"
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
min=$(($min+1))
done
maj=$(($maj+1))
done
echo "Simulationstorm successful"