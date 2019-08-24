maxMaj = 4
maxMin = 4
maj = 1
while [ $maj -le $maxMaj ]
do
min = 1
while [ $min -le $maxMin ]
do
waveguide="waveguide"
major="majR"
minor="minr"
majvalstr="$maj"
minvalstr="$min"
fileend=".Java"
filelocation="JAVACODES/"
classfileend=".class"
inputfile="$filelocation$waveguide$maj$major$min$minor$fileend"
classfile="$filelocation$waveguide$maj$major$min$minor$classfileend"
#
comsol compile $inputfile
#
mv $classfile simulationcodes/
compiled="finished compiling"
echo ${classfile}
min=$(($min+1))
done
maj=$(($maj+1))
done
echo "Compilestorm complete"