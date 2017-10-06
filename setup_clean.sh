#!/bin/bash

function blank_line {
	echo $'\n'
	printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
	echo $'\n'
}

# A script made to install all the packages and softwares, frequently required after a clean install of Ubuntu OS. 

echo -e "Enter your github user.name: "
read git_username

echo -e "Enter your github email.id: "
read git_email_id

ROS_DISTRO="kinetic"

# Blank Line
blank_line

echo "Thank you for entering your information!" $'\n'
read -p "Press enter to continue: "

# Blank Line
blank_line

STR=$'WARNING: This script is meant for Ubuntu 16.04.2LTS_64-bit In case you are using any other OS, the script would not work properly and there might be dependancies issues.'

if [[ `lsb_release -rs` != "16.04" ]] # replace 8.04 by the number of release you want
then
	echo "$STR" $'\n'
fi


# Blank Line
blank_line

sudo apt-get update

# Blank Line
blank_line

# setup oh-my-zsh
echo "Installing oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)" $'\n'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

# Blank Line
blank_line

# setup VIM
echo "Installing vim" $'\n'
sudo apt-get install vim -y

# Blank Line
blank_line

# setup atom-text-editor
echo "Installing Atom Text Editor" $'\n'
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update 
sudo apt install atom -y

# setup Terminator
echo "Installing Terminator" $'\n'
sudo add-apt-repository ppa:gnome-terminator
sudo apt-get update
sudo apt-get install terminator -y

# Blank Line
blank_line

# setup ROS
echo "Installing ROS ${ROS_DISTRO}" $'\n'
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-${ROS_DISTRO}-desktop-full -y
sudo rosdep init
rosdep update
echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc
source ~/.bashrc
echo "source /opt/ros/${ROS_DISTRO}/setup.zsh" >> ~/.zshrc
source ~/.zshrc
sudo apt-get install python-rosinstall -y

# Blank Line
blank_line

# setup Gazebo
echo "Installing Gazebo" $'\n'
curl -ssL http://get.gazebosim.org | sh

# setup arduino
echo "Installing Arduino and rosserial-arduino" $'\n'
sudo apt-get install arduino -y

# setup rosserial arduino
source /opt/ros/$ROS_DISTRO/setup.bash
mkdir -p ~/sketchbook/libraries
cd ~/sketchbook/libraries
rm -rf ros_lib
rosrun rosserial_arduino make_libraries.py .

# Blank Line
blank_line

# setup git
echo "Installing git" $'\n'
sudo apt-get install git -y
git config --global user.name "$git_username"
git config --global user.email "$git_email_id"

# Blank Line
blank_line

# setup OpenCV 3.2.0
echo "Installing OpenCV 3.2.0" $'\n'
./install_openCV.sh

# Blank Line
blank_line

# setup Python PIP
echo "Installing Python-PIP" $'\n'
sudo apt-get install python-pip -y

# Blank Line
blank_line

# setup google chrome
echo "Installing Google Chrome" $'\n'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo "In case an error is encountered in above step, run `sudo apt-get -f install`"

# Blank Line
blank_line

echo "Installation of all basic softwares and packages successful!"
echo "It is recommended that you restart your computer and start afresh."
