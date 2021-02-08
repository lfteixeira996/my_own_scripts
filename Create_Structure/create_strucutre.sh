 
#!/bin/bash

#############################################################################################################################
# The above command turns off the output for the script
# Script Name : create_structure.bat
# Author      : Luis Teixeira
# Created     : 13th-November-2018
# Version     : 1.1
#
#  Description: This script create the folder structure for a new exercise 
#               First the user inserts the name of the project, difficulty and number
#                 1-Create a folder with the project name
#                 2-project_name.py file
#                 3-README.md file
#                 4-tests.py
#############################################################################################################################

# Functions
# Append text to the beginning of the file
append_start() 
{
  echo "$1$(cat $2)" > $2
}

# Append text to the end of the file
append_end()
{
  echo "$1" >> $2
}


#Read exercise name
echo -n "Enter the name of the project: "
read proj_name

#Read difficulty
echo -n "Enter the difficulty: "
read proj_diff

#Read number of the project
echo -n "Enter the number: "
read proj_num

#Read web link
echo -n "Enter the link(CodeWars): "
read weblink

#Display date
date=$(date +%d-%m-%Y)

#Text to write in the files(code and tests)
textMD=$"##############################################  
#Name   : $proj_name  
#Author :  
#Date   : $date  
#E-Mail :   
##############################################  "


#Github link
github="https://github.com/GitHub_User/CodeWars/tree/master/Python/"

#Text to write in the README.md file (in case already exists)
updateMD_1=$"| # | [$proj_diff]($github$proj_diff) | [CodeWars](https://www.codewars.com/dashboard) | $date |:white_check_mark:|"

#Text to write in the README.md file (in case new one)
newMD_1=$"| # | Difficulty - GitHub | CodeWars - Link | Date  | State |
|:-:|:-:|:-:|:-:|:-:|"

#Text to write in the README.md file (in case already exists)
updateMD_2=$"|$proj_num|[$proj_name]($github$proj_diff/$proj_name/README.md) | [Code]($github$proj_diff/$proj_name/$proj_name.py)|[Tests]($github$proj_diff/$proj_name/tests.py)|[CodeWars]($weblink)|:x:|"

#Text to write in the README.md file (in case new one)
newMD_2=$"| # | Exercise  | Code  | Tests | CodeWars - Link | State |
|:-:|:-:|:-:|:-:|:-:|:-:|"


#read the current user
myvar=$(whoami)
#echo $myvar

#Open Desktop folder for current user
#cd C:
#cd Users/$myvar/Documents/CodeWars/Python

#Create folder structure
mkdir $proj_diff/

###############################################################
#Create/update README.md file
if [ -e README.md ] 
then
    echo "OK"
else
    touch README.md
    append_start "$newMD_1" "README.md"
fi

if grep -qF "$proj_diff" README.md
then
  echo "OK"
else
  append_end "$updateMD_1" "README.md"
fi  

###############################################################
#create exercise folder
mkdir $proj_diff/$proj_name
cd $proj_diff/

###############################################################

#Create/update README.md file
if [ -e README.md ]
then
    append_end "$updateMD_2" "README.md"
else
    touch README.md
    append_start "$newMD_2" "README.md"
    append_end "$updateMD_2" "README.md"
fi

###############################################################
#Create code file
cd $proj_name/
touch $proj_name.py
echo "$textMD" | tee $proj_name.py


touch tests.py
echo "$textMD" | tee tests.py

#Generate code for README.md file
echo "$textMD" | tee -a README.md
###############################################################


echo "Luis Teixeira 2018"
