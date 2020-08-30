#!/bin/bash

function usage()
{
  printf "%s\n" "$0 <release version tag>"
  printf "\t%s\n" "<release version tag> = A Release Tag, such as v0.9.7-RC2 or v1.2.6"
  printf "\t%s\n" "This will create a directory 'imcMonsterCreator_<release tag>'"  
}

if [[ ("$1" == "") || ( "$1" == "help" ) ]]; then
	usage
	exit 1
fi

RELEASEVER=$1
RELEASEDIR="${HOME}/imcMonsterCreator"

if [[ -d ${RELEASEDIR} ]]; then
	printf "%s\n" "ERROR: Release Directory already exists.  Please clean up after the prior release and run again."
	exit 1
fi

mkdir ${RELEASEDIR}
if [[ ! -d ${RELEASEDIR} ]]; then
  printf "%s\n" "Error Creating Release Directory."
  exit 1
fi

cp 01_generic_portrait.rptok ${RELEASEDIR}
cp 01_generic_token.rptok ${RELEASEDIR}
cp BasicMonster.rptok ${RELEASEDIR}
cp LiarActionEffects.rptok ${RELEASEDIR}
cp Lib_MonsterCreator.rptok ${RELEASEDIR}
cp Campaign_Properties.txt ${RELEASEDIR}
cp User_Manual.txt ${RELEASEDIR}
cp imcMonsterCreator_by_Example.txt ${RELEASEDIR}
cp imcMonsterCreator5e.cmpgn ${RELEASEDIR}

# Create the Release File
cd ..
CURRENTDIR=`pwd`
cd ${HOME}
zip -r imcMonsterCreator_${RELEASEVER}.zip imcMonsterCreator/*
mv imcMonsterCreator_${RELEASEVER}.zip ${CURRENTDIR}
cp ${RELEASEDIR}/imcMonsterCreator5e.cmpgn ${CURRENTDIR}

CREATEDARCHIVE="${CURRENTDIR}/imcMonsterCreator_${RELEASEVER}.zip"
printf "%s\n" "Archive ${CREATEDARCHIVE} Created."

# Clean Up
if [[ -f ${CREATEDARCHIVE} ]]; then
	rm -rf ${RELEASEDIR}
fi
