#Minecraft Forge Install Script
#Script Created By: Anthony Budd
#Last Edit Date: 12/29/2020


##Var Setting
username="forgemcserver"
password="Password"
forgeUrl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.16.4-35.1.4/forge-1.16.4-35.1.4-installer.jar"
forgeJar="forge-1.16.4-35.1.4-installer.jar"
workingDir="/home/$username/minecraft/"
controlPanelName="MinecraftControl.sh"

##Update and add vars
echo "Getting Updates and Installing Required Files"
apt update -y && apt upgrade -y
apt install screen

##Add user
echo "Adding User: $username"
pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
useradd -m -p "$pass" "$username"
[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"

##Add Working Dir
echo "Adding Directory"
mkdir /home/$username/minecraft
mkdir /home/$username/scripts
mkdir /home/$username/temp

##Download Needed Files

#Scripts
echo "Downloading Scripts"
wget https://raw.githubusercontent.com/Buddster124/Forge-Minecraft-Server/main/accessConsole.sh -O /home/$username/scripts/accessConsole.sh
wget https://raw.githubusercontent.com/Buddster124/Forge-Minecraft-Server/main/startServer.sh -O /home/$username/scripts/startServer.sh
wget https://raw.githubusercontent.com/Buddster124/Forge-Minecraft-Server/main/startServerScreen.sh -O /home/$username/scripts/startServerScreen.sh

#Forge Installer
wget $forgeUrl -O /home/$username/minecraft/$forgeJar

##Run Install
echo "Installing Minecraft Forge Server"
cd $workingDir
java -jar /home/$username/minecraft/$forgeJar --installServer

##Remove Installer
echo "Removing Forge Installer"
rm /home/$username/minecraft/$forgeJar

##Ending Message
echo "Install Complete"
echo "=================================================================================="
echo "Install Details"
echo "Minecraft Server Username: $username"
echo "Minecraft Server User Password: $password"
echo "Working Dir: $workingDir"
echo "To Start The Server, Login to the Minecraft User Account and Navigate to $workingDir."
echo "Then Run '$controlPanelName start'"
echo "=================================================================================="
echo "On first launch, you will have to agree to the eula."
echo "To agree to the eula after you launch the server go to '$workingDir/eula.txt'"



