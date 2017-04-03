#!/bin/bash

# A script made to install all the packages and softwares, frequently required after a clean install of Ubuntu OS. 


ROS_DISTRO = $'kinetic'
git_username = $'Mayankm96'
git_email_id = $'mayankmittal155@gmail.com'

echo $'\n'
STR=$'WARNING: This script is meant for Ubuntu 16.04.2LTS. In case you are using any other OS, the script would not work properly and there might be dependancies issues.'
echo "$STR" $'\n'

sudo apt-get update

# Blank Line
echo $'\n'
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo $'\n'

# setup oh-my-zsh
echo "Installing oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)" $'\n'
sudo apt-get install zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s $(which zsh)

# Blank Line
echo $'\n'
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo $'\n'

# setup VIM
echo "Installing vim" $'\n'
sudo apt-get install vim

# Blank Line
echo $'\n'
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo $'\n'

# setup Sublime Text Editor
echo "Installing Sublime Text 3" $'\n'
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer
# Blank Line
echo $'\n'
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo $'\n'

# setup ROS
echo "Installing ROS $ROS_DISTRO" $'\n'
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt-get update
sudo apt-get install ros-$ROS_DISTRO-desktop-full
sudo rosdep init
rosdep update
echo "source /opt/ros/$ROS_DISTRO/setup.bash" >> ~/.bashrc
source ~/.bashrc
echo "source /opt/ros/$ROS_DISTRO/setup.zsh" >> ~/.zshrc
source ~/.zshrc
sudo apt-get install python-rosinstall

# Blank Line
echo $'\n'
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo $'\n'


# setup Gazebo
echo "Installing Gazebo" $'\n'
curl -ssL http://get.gazebosim.org | sh

# setup arduino
echo "Installing Arduino and rosserial-arduino" $'\n'
sudo apt-get install arduino

# setup rosserial arduino
source /opt/ros/$ROS_DISTRO/setup.bash
mkdir -p ~/sketchbook/libraries
cd ~/sketchbook/libraries
rm -rf ros_lib
rosrun rosserial_arduino make_libraries.py .

# Blank Line
echo $'\n'
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo $'\n'

# setup git
echo "Installing git" $'\n'
sudo apt-get install git
git config --global user.name "$git_username"
git config --global user.email "$git_email_id"

# Blank Line
echo $'\n'
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo $'\n'

# setup OpenCV 3.0-beta
echo "Installing OpenCV 3.0.0-beta" $'\n'
sudo apt-get install build-essential
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
cd ~/tmp
git clone https://github.com/Itseez/opencv.git
cmake ~/tmp/opencv
mkdir -p ~/tmp/opencv/release
cd ~/tmp/opencv/release
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local ..
make -j8 # -j8 runs 8 jobs in parallel.
         # Change 8 to number of hardware threads available.
sudo make install

# Blank Line
echo $'\n'
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo $'\n'

# setup google chrome
echo "Installing Google Chrome" $'\n'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo "In case an error is encountered in above step, run `sudo apt-get -f install`"

# Blank Line
echo $'\n'
printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
echo $'\n'

echo "Installation of all basic softwares and packages successful!"
echo "It is recommended that you restart your computer and start afresh."
