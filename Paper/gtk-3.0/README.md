Summary
-------

* Do not edit the CSS directly, edit the source SCSS files and process them with SASS (run 
  `./parse-sass.sh` when you have the required software installed, as described below)
* To be able to use the latest/adequate version of sass, install ruby, gem, sass & bundle.

## How to tweak the theme

Paper is a large and complex theme, to keep it maintainable it's written and processed in SASS. 


_colors.scss        - global color definitions. We keep the number of defined colors to a necessary minimum, 
                      most colors are derived form a handful of basics. It covers both the light variant and
                      the dark variant.

_colors-public.scss - SCSS colors exported through gtk to allow for 3rd party apps color mixing.

_drawing.scss       - drawing helper mixings/functions to allow easier definition of widget drawing under
                      specific context. This is why Paper isn't 15000 LOC.

_common.scss        - actual definitions of style for each widget. This is where you are likely to add/remove
                      your changes.

apps/_*.scss        - actual definitions of style for each widget. This is where you are likely to add/remove
                      your changes.