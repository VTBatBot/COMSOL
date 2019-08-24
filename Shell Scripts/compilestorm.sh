maxc=8
maxd=6
maxl=7
l=7
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
paramsstr="params"
ccharstr="c"
dcharstr="d"
cvalstr="$c"
dvalstr="$d"
fileend=".Java"
filelocation="JAVACODES/"
classfileend=".class"
inputfile="$filelocation$length$lvalstr$paramsstr$cvalstr$ccharstr$dvalstr$dcharstr$fileend"
classfile="$filelocation$length$lvalstr$paramsstr$cvalstr$ccharstr$dvalstr$dcharstr$classfileend"
#
comsol compile $inputfile
#
mv $classfile simulationcodes/
compiled="finished compiling"
echo ${classfile}
d=$(($d+1))
done
c=$(($c+1))
done
l=$(($l+2))
done
echo "Compilestorm complete"