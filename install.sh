#!/bin/bash
# -*- Mode: sh; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-
#
# Authors:
#   Sam Hewitt <sam@snwh.org>
#
# Description:
#   An installation bash script for Paper GTK Theme
#
# Legal Stuff:
#
# This file is part of the Paper GTK Theme and is free software; you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by the Free Software
# Foundation; version 3.
#
# This file is part of the Paper GTK Theme and is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <https://www.gnu.org/licenses/lgpl-3.0.txt>

clear
echo '#-----------------------------------------#'
echo '#     Paper GTK Theme Install Script      #'
echo '#-----------------------------------------#'


show_question() {
echo -e "\033[1;34m$@\033[0m"
}

show_dir() {
echo -e "\033[1;32m$@\033[0m"
}

show_error() {
echo -e "\033[1;31m$@\033[0m"
}

function continue {
echo
show_question '\tDo you want to continue? (Y)es, (N)o : ' 
echo
read INPUT
case $INPUT in
	[Yy]* ) main;;
    [Nn]* ) exit 99;;
    * ) echo; echo "Sorry, try again."; continue;;
esac
}

function main {
if [ "$UID" -eq "$ROOT_UID" ]; then
	if [ -d /usr/share/themes/Paper ]; then
		echo
		show_question '\tFound an existing installation. Replace it? (Y)es, (N)o : ' 
		echo
		read INPUT
		case $INPUT in
			[Yy]* ) rm -Rf /usr/share/themes/Paper 2>/dev/null;;
			[Nn]* );;
		    * ) clear; show_error '\tSorry, try again.'; main;;
		esac
	fi
	echo "Installing..."
	cp -R ./Paper/ /usr/share/themes/
	chmod -R 755 /usr/share/themes/Paper
	echo "Installation complete!"
	echo "You will have to set your theme manually."
	end
elif [ "$UID" -ne "$ROOT_UID" ]; then
	if [ -d $HOME/.local/share/themes/Paper ]; then
		echo
		show_question '\tFound an existing installation. Replace it? (Y)es, (N)o : ' 
		echo
		read INPUT
		case $INPUT in
			[Yy]* ) rm -Rf "$HOME/.local/share/themes/Paper" 2>/dev/null;;
			[Nn]* );;
		    * ) clear; show_error '\tSorry, try again.'; main;;
		esac
	fi
	echo "Installing..."
	# .local/share/themes
	install -d $HOME/.local/share/themes
	cp -R ./Paper/ $HOME/.local/share/themes/
	# .themes
	install -d $HOME/.themes
	cp -R ./Paper/ $HOME/.themes/
	echo "Installation complete!"
	set
fi
}



function set {
echo
show_question '\tDo you want to set Paper as desktop theme? (Y)es, (N)o : ' 
echo
read INPUT
case $INPUT in
	[Yy]* ) settheme;;
    [Nn]* ) end;;
    * ) echo; show_error "\aUh oh, invalid response. Please retry."; set;;
esac
}

function settheme {
echo "Setting Paper as desktop GTK theme..."
gsettings reset org.gnome.desktop.interface gtk-theme
gsettings reset org.gnome.desktop.wm.preferences theme
gsettings set org.gnome.desktop.interface gtk-theme "Paper"
gsettings set org.gnome.desktop.wm.preferences theme "Paper"
echo "Done."
setthemegnome
}

function setthemegnome {
if [ -d /usr/share/gnome-shell/extensions/user-theme@gnome-shell-extensions.gcampax.github.com/ ]; then	
	echo
	show_question '\tWould you like to use Paper as your GNOME Shell theme? (Y)es, (N)o : '
	echo
	read INPUT
	case $INPUT in
		[Yy]* ) gsettings set org.gnome.shell.extensions.user-theme name "Paper";;
	    [Nn]* ) end;;
	    * ) echo; show_error "\aUh oh, invalid response. Please retry."; set;;
	esac
	end
else
	end
fi
}

function end {
	echo "Exiting"
	exit 0
}


ROOT_UID=0
if [ "$UID" -ne "$ROOT_UID" ]; then
	echo
	echo "Paper GTK Theme will be installed in:"
	echo
	show_dir '\t$HOME/.local/share/themes'
	echo
	echo "To make them available to all users, run this script as root."
	continue
else
	echo
	echo "Paper GTK Theme will be installed in:"
	echo
	show_dir '\t/usr/share/themes'
	echo
	echo "It will be available to all users."
	continue
fi