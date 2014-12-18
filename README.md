Paper Theme
===========

[Paper](http://snwh.org/paper/) is a modern GNOME desktop theme. Its design is mostly flat with a minimal use of shadows for depth.

###Preamble

Paper has been developed primarily for GNOME and other GTK3 desktops, legacy desktops will not have the same experience.

Paper is distributed under the terms the GNU General Public License (GNU GPL v.3).

###Installation & Usage

If you download the provided archive, extract it and run the included install script.

	bash install.sh

###Bugs & Issues

If you find any bugs or issues with Paper or if you have a question, you can visit Paper's primary issue tracker on [GitHub](https://github.com/snwh/paper-gtk-theme/issues).


###Getting the Source

The source for Paper GTK3 Theme can be found [here](https://github.com/snwh/paper-gtk-theme).

Alternatively, you can clone the latest version its git repository:

    git clone https://github.com/snwh/paper-gtk-theme.git

###Using the Source

There are scripts to simplify the rendering process;to run them (and edit icons) you will need:

 * inkscape
 * python3

To render new assets from their source SVG files, run the following:

    ./render-gtk3-assets.py
    ./render-gtk3-assets-hidpi.py
    ./render-metacity-assets.py
    ./render-gnome-shell-assets.py
    ./render-unity-assets.py

If it's throwing an error, the script may not be executable, try:
	
	chmod +x *

This script will look in the source directories (../src/*) and render the respective icons (provided there are changes).

-----------