#!/bin/bash

if [[ -z $1 ]]; then
  echo -e ""
  echo -e "${White}Usage: ${Green}./maketag.sh ${Cyan}<slug> ${Purple}<fullname>${NC}"
  echo -e ""
  echo -e "${Gray}example: ${Blue}./maketag.sh js JavaScript${NC}"
  echo -e ""
  exit
fi

if [[ -z $2 ]]; then
  echo -e ""
  echo -e "${BRed}Error: ${White}Missing fullname for ${SLUG}${NC}"
  echo -e ""
  exit
fi

SLUG=$1
FULLNAME=$2

TEMPLATE=`pwd`"/_tags/_template.md"
OUTPUTFILE=`pwd`"/_tags/${SLUG}.md"
DATAFILE=`pwd`"/_data/tags.yml"



if [ -f $OUTPUTFILE ]; then
  echo -e ""
  echo -e "${BRed}Error: ${White}Tag: ${SLUG} already exists${NC}"
  echo -e ""
  exit
fi

cp $TEMPLATE $OUTPUTFILE
sed -i "s/%slug%/${SLUG}/g" $OUTPUTFILE
sed -i "s/%fullname%/${FULLNAME}/g" $OUTPUTFILE

echo -e "" >> ${DATAFILE}
echo -e "- slug: ${SLUG}" >> ${DATAFILE}
echo -e "  name: ${FULLNAME}" >> ${DATAFILE}