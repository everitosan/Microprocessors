#*********************************** Definition of Functions
function isProjectNameEmpty {
  if [[ $projectName == "" ]]
    then
      projectName="Project"
  fi
}

function makeProjectDir {
  if [[ ! -d $projectName ]]
    then
      mkdir $projectName
    else
      echo "xxxxxxxxxxxxxxxxxxxxxxx"
      echo "The directory is ocuped"
      echo "xxxxxxxxxxxxxxxxxxxxxxx"
      exit
  fi
}

function writeMain {
  #creates the main asm file and specifies the AVR to use
  touch $fileDir
  echo ";Created by EVESAN" > $fileDir
  echo ".DEVICE \"$device\"" >> $fileDir
}

function writeMakeFile {
  #creates MakeFile
  touch $makeFileDir
  echo "#Definition of AVR variables for compilation and flash" > $makeFileDir
  echo "DEVICE     = atmega48" >> $makeFileDir
  echo "CLOCK      = 1000000" >> $makeFileDir
  echo "PROGRAMMER = -c USBasp" >> $makeFileDir


  echo "#Definition of compiler, fuses and programmer" >> $makeFileDir
  echo "COMPILE = gavrasm main.asm" >> $makeFileDir
  echo "FUSES      = -U hfuse:w:0xd9:m -U lfuse:w:0x24:m" >> $makeFileDir
  echo "AVRDUDE = avrdude \$(PROGRAMMER) -p \$(DEVICE)" >> $makeFileDir

  echo "#Definition of available tasks" >> $makeFileDir
  echo "all:	main.hex" >> $makeFileDir

  echo "flash:	all" >> $makeFileDir
  echo "	\$(AVRDUDE) -U flash:w:main.hex:i" >> $makeFileDir

  echo "main.hex:" >> $makeFileDir
  echo "	clean" >> $makeFileDir
  echo "	\$(COMPILE)" >> $makeFileDir
  echo "clean:" >> $makeFileDir
  echo "	rm -f main.hex" >> $makeFileDir
  echo "	rm -f main.lst" >> $makeFileDir

}

#*********************************** Build scaffold
projectName=$1
isProjectNameEmpty #evaluates if theres a value given for the project name
fileDir="$projectName/main.asm" #route of the main file
makeFileDir="$projectName/Makefile" #route of the make file
device="ATmega48"


makeProjectDir
if [[  ! -e $fileDir && ! -e $makeFileDir ]] #validates if the files are alreay created or not
  then
    #creates direcory of the project
    writeMain
    writeMakeFile
    echo "**********************************"
    echo "            $projectName created"
    echo "**********************************"
  else
    echo "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
    echo "Files of a project were detected. \n Nothing has been overwrited"
    echo "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
fi
