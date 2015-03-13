Paper Theme
===========

[Paper](http://snwh.org/paper/) is a modern desktop theme suite. Its design is mostly flat with a minimal use of shadows for depth.

###Preamble

Paper has been developed primarily with modern GTK3 (GNOME-based) desktop environments in mind, legacy-toolkit and GTK2 environments will not provide an ideal experience, as much of the visual design relies on modern GTK3+ widgets.

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

There are scripts to simplify the rendering process;to run them (and edit theme assets) you will need:

 * inkscape
 * python3

To render new assets from their source SVG files, run the following:

    ./render-gtk3-assets.py
    ./render-gtk3-assets-hidpi.py
    ./render-gnome-shell-assets.py
    ./render-wm-assets.py

If scripts are throwing errors, they may not be executable, try:
	
	chmod +x *

Each script will look in the asset source directories (../src/*) and render the respective assets (provided there are changes) to the appropriate locations.

-----------