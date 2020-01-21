# game_ctrl_m
Matlab package for video game controllers  
Written by Dan Oates (WPI Class of 2020)

### Description
This package contains interfaces for video game controllers. It is a wrapper for the vrjoystick class which maps names for buttons, axes, and POVs to their internal joystick IDs. Each axis also has a configurable deadzone. The files in this package are described below:

- GameCtrl : Superclass for all game controllers
- Xbox360 : Class for Xbox 360 controllers
- Nint64 : Class for Nintendo 64 controllers
- analyze : Function for analyzing controllers with unknown mappings

The GameCtrl class has methods for adding arbitrary button, axis, and POV name mappings, making it adaptable to any joystick input.

### Toolbox Dependencies
- Simulink 10.0
- Simulink 3D Animation 8.3

### Cloning and Submodules
Clone this repo as '+game_ctrl' and add the containing dir to the Matlab path.