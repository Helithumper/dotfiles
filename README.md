# Peyton's Dotfiles!
This is a compilation of everything required to customize a linux machine to my tastes :)

## Master apt-get List
* tmux
* sl
* htop
* unity-tweak-tool
* build-essential
* fonts-hack-ttf
* zsh
* ttf-ancient-fonts

## Fonts
* Roboto Mono
	* [Link](https://fonts.google.com/specimen/Roboto+Mono)
	* Used for text editors
* Roboto
	* [Link](https://fonts.google.com/specimen/Roboto)
	* Used for system fonts
* Hack
	* Used for editors sometimes

## Terminal
### Gogh
Gogh is a color plugin for the terminal. Here are instructions on how to install it:
Run the following in Bash:
~~~bash
$ sudo apt-get install dconf-cli

$ wget -O gogh https://git.io/vQgMr && chmod +x gogh && ./gogh && rm gogh
~~~

### Oh My ZSH
Oh my ZSH adds some customization to the terminal. Here are instructions on how to install it:

1. Install ZSH
~~~bash
$ sudo apt-get install zsh
~~~
2. Install Oh-My-ZSH
~~~bash
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
~~~

### Bullet Train
1. Download the theme [here](http://raw.github.com/caiogondim/bullet-train-oh-my-zsh-theme/master/bullet-train.zsh-theme)

2. Put the file **bullet-train.zsh-theme** in **$ZSH_CUSTOM/themes/**

3. Configure the theme in your **~/.zshrc** file:

```bash
$ ZSH_THEME="bullet-train"
```

## Sublime
Sublime text is my editor of choice. Here are some installation instructions

1. Install the GPG key:
~~~bash
$ wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
~~~

2. Ensure apt is set up to work with https sources:
~~~bash
$ sudo apt-get install apt-transport-https
~~~
3. Select the channel to use:

Stable
~~~bash
$ echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
~~~
Dev
~~~bash
$ echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
~~~
Update apt sources and install Sublime Text
~~~bash
sudo apt-get update
sudo apt-get install sublime-text
~~~
## Icons
I use the Numix Circles Icon pack. Installation is very easy!
~~~bash
$ sudo add-apt-repository ppa:numix/ppa
$ sudo apt-get update
$ sudo apt-get install numix-icon-theme-circle
~~~
## Themes
I use the Flatabulous theme. 
~~~bash
sudo add-apt-repository ppa:noobslab/themes
sudo apt-get update
sudo apt-get install flatabulous-theme
~~~

