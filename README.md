# Install various software and packes into your Ubuntu
A short shell script to install all the softwares and packages frequently required after a clean install of Ubuntu. The script has been written for Ubuntu 16.04LTS.

## Softwares installed:
* [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
* [vim](http://www.vim.org/download.php)
* [Sublime Text Editor](https://www.sublimetext.com/)
* [Robot Operating System](http://wiki.ros.org/ROS/)
* [Arduino IDE](https://www.arduino.cc/)
* [Git](https://github.com/)
* [OpenCV 3.0.0-beta](http://opencv.org/)
* [Google Chrome](https://www.google.com/chrome/)

## How to use?
1. Download the shell script `setup_clean.sh` into your system
2. Open a terminal (`ctrl + alt + T`) and type `gedit /path/to/setup_clean.sh`
3. Edit the inital three parameters for your distribution. These are for the ROS distribution you want to install along with your username and email ID required to configure your GitHub account
4. Once done, close the text editor
5. On the terminal, execute the command `chmod +x /path/to/setup_clean.sh`
6. After that, execute the command `/path/to/setup_clean.sh`
