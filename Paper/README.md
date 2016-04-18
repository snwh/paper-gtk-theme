Notes
-------

* Do not edit the CSS files directly, edit the source SCSS files and process them with SASS (run 
  `sass --update --sourcemap=none .` in this directory when you have the required software installed)
* Do not edit the PNG or SVG assets directly, edit and render the sources in the `src` folder in the source root and render those.

## SASS Assets (SASSets)

Paper is a large and complex theme, to keep it maintainable and easily editable it's written and processed in SASS and organized in a modular fashion. 

`_colors.scss`
 - global color definitions. We keep the number of defined colors to a necessary minimum, most colors are derived form a handful of basics. It covers both the light variant and the dark variant.

`_colors-public.scss`
- SCSS colors exported through gtk to allow for 3rd party apps color mixing.

`_drawing.scss`
- drawing helper mixings/functions to allow easier definition of widget drawing under specific context.

`_common.scss`
- shared definitions for the theme

`widgets/_*.scss`
- styles for widgets are on individual sheets to make the theme more modular and easier to batch edit 

`_apps.scss` & `apps/_*.scss`
- style definitions for specific apps and environments. This is where colored headerbars are made
