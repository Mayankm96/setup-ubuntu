# Install various software and packages into your Ubuntu
A short shell script to install all the softwares and packages frequently required after a clean install of Ubuntu. The script has been written for Ubuntu 16.04LTS.

## Softwares installed:
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [vim](http://www.vim.org/download.php)
* [Atom text Editor](https://atom.io/)
* [Terminator](https://wiki.archlinux.org/index.php/Terminator)
* [Robot Operating System](http://wiki.ros.org/ROS/)
* [Gazebo](http://gazebosim.org/)
* [Arduino IDE](https://www.arduino.cc/)
* [Git](https://github.com/)
* [OpenCV 3.2.0](http://opencv.org/)
* [Google Chrome](https://www.google.com/chrome/)

## How to use?
1. Clone the repository to your system: `git clone https://github.com/Mayankm96/setup-ubuntu.git`
2. On the terminal, execute the command `cd /path/to/setup_clean.sh && chmod +x *.sh`
3. After that, execute the command `./setup_clean.sh` to install all the above mentioned softwares

__NOTE:__ To install only ROS, run `./install_ROS.sh ${ROS_DISTRO}`, where `${ROS_DISTRO}=kinetic` for [Ubuntu 16.04](http://releases.ubuntu.com/16.04/)
