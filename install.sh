#!/bin/bash
# -*- Mode: sh; coding: utf-8; indent-tabs-mode: nil; tab-width: 4 -*-
#
# Authors:
#   Sam Hewitt <hewittsamuel@gmail.com>
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

function continue {
echo ""
read -p "Do you want to continue? (Y)es, (N)o : " INPUT
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
		read -p "Found an existing installation. Replace it? (Y)es, (N)o : " INPUT
		case $INPUT in
			[Yy]* ) rm -Rf /usr/share/themes/Paper 2>/dev/null;;
			[Nn]* );;
		    * )
		    clear && echo 'Sorry, try again.'
		    main
		    ;;
		esac
	fi
	cp -R ./Paper/ /usr/share/themes/
	chmod -R 755 /usr/share/themes/Paper
	echo "Installation complete!"
	set
elif [ "$UID" -ne "$ROOT_UID" ]; then
	if [ -d $HOME/.local/share/themes/Paper ]; then
		echo
		read -p "Found an existing installation. Replace it? (Y)es, (N)o : " INPUT
		case $INPUT in
			[Yy]* ) rm -Rf "$HOME/.local/share/themes/Paper" 2>/dev/null;;
			[Nn]* );;
		    * )
		    clear && echo 'Sorry, try again.'
		    main
		    ;;
		esac
	fi
	# .local/share/themes
	if [ -d $HOME/.local/share/themes ]; then
		cp -R ./Paper/ $HOME/.local/share/themes/
	else
		mkdir -p $HOME/.local/share/themes
		cp -R ./Paper/ $HOME/.local/share/themes/
	fi
	# ./themes
	if [ -d $HOME/./themes ]; then
		cp -R ./Paper/ $HOME/./themes/
	else
		mkdir -p $HOME/./themes
		cp -R ./Paper/ $HOME/.local/share/themes/
	fi
	echo "Installation complete!"
fi
}

function set {
echo ""
read -p "Do you want to set Paper as desktop theme? (Y)es, (N)o : " INPUT
case $INPUT in
	[Yy]* ) settheme;;
    [Nn]* ) end;;
    * ) echo; echo "Uh oh, invalid response. Please retry."; set;;
esac
}

function settheme {
echo "Setting Paper as desktop GTK theme..."
gsettings set org.gnome.desktop.interface gtk-theme "Paper"
gsettings set org.gnome.desktop.wm.preferences theme "Paper"
echo "Done."
end
}

function end {
	echo "Exiting"
	exit 0
}

ROOT_UID=0
if [ "$UID" -ne "$ROOT_UID" ]; then
	echo
	echo "Paper GTK Theme will be installed in '$HOME/.local/share/themes/Paper'."
	echo "To make them available to all users, run this script as root."
	continue
else
	echo
	echo "Paper GTK Theme will be installed in '/usr/share/themes'"
	echo "It will be available to all users."
	continue
fi