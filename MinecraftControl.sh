#Minecraft Forge Control Script
#Script Created By: Anthony Budd
#Last Edit Date: 12/29/2020

##Var Setting
username="forgemcserver"
workingDir="/home/$username/"
scriptDir="/home/$username/scripts/"

#Arg Selection
if [ $1 == "start"]
then
   sh ./$scriptDir/startServerScreen.sh
elif [ $1  == "debug"]
then
   sh ./$scriptDir/startServer.sh
elif [$1 == "fixFileErrors"]
then
wget https://raw.githubusercontent.com/Buddster124/MinecraftForgeServerScripts/main/accessConsole.sh -O /home/$username/scripts/accessConsole.sh
wget https://raw.githubusercontent.com/Buddster124/MinecraftForgeServerScripts/main/startServer.sh -O /home/$username/scripts/startServer.sh
wget https://raw.githubusercontent.com/Buddster124/MinecraftForgeServerScripts/main/startServerScreen.sh -O /home/$username/scripts/startServerScreen.sh
elif [ $1 == "console"]
then
   sh ./$scriptDir/accessConsole.sh
elif [ $1 == "help"]
then
    echo "start -- Starts Game Server"
    echo "debug -- Starts Game Server With Console Open"
    echo "console -- Opens The Game Server Console"
    echo "fixFileErrors -- Fixes Problems From Scripts Not There"
else
    echo "Please enter a argument, For help do ./MinecraftControl.sh help"
fi













