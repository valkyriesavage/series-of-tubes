Welcome to the README!

The general way of loading code onto an Arduino is as follows:

Plug the Arduino into your computer
Make sure you've downloaded Arduino 1.0+
Open Arduino
Ensure you have selected the correct board (likely Arduino Uno) and serial port (probably the first one listed) from the menus under Tools >
Open the code file (if there are multiple code files in a directory, any one of them will open all of them)
Click upload (this also performs the verify step, there is no need to run that separately)

Here are the instructions for setting up the various demos:

Breathing Bunny:

Ingredients:
	1x print of breathing bunny in 100% Tango Black Plus
	1x computer power supply
	1x Arduino (5v, probably Uno)
	1x USB connector cable for Arduino
	1x air pump
	2x tubes for pump connections
	3x wires
	
Code directory:
	series-of-tubes/example_objects/code/breathing_bunny
	
Connections:
	On the power supply, connect the green wire to pin 8 of the Arduino (this is already set up on the one I've left on my desk)
	Connect any yellow wire and any black wire (in either order) to the two terminals of the air pump
	
Steps:
	Plug in the power supply
	Upload the code to the Arduino
	Note which tube on the air pump is pressure and which is vacuum (this will depend on the way you hooked up the terminals)
	Plug the pressure tube into the bunny's nose and the vacuum tube into the bunny's back
	Touch!
	
Pen Holder:

Ingredients:
	1x print of pen holder in any material with light pipe stuffed in ends and QRE breakout boards in base
	4x pens
	1x Arduino Uno
	1x USB cable connector

Code directories:
	series-of-tubes/example_objects/code/pen_holder/digital_reflectance (for Arduino)
	series-of-tubes/example_objects/code/pen_holder/show_state_of_pens (for Processing)
	
Connections:
	The wires labelled VCC from every board on the bottom of the pen holder needs to be connected to Arduino 5v
	The wires labelled GND needs to be connected to Arduino Ground
	The middle wires need to be connected to DIGITAL pins 2-5 on Arduino

Steps:
	In the code, enable debug output (there is a block that is commented out in the main function, just uncomment that and comment out the top)
	Load the code onto the Arduino
	Hit ctrl+shift+M to see the serial output
	Test putting pens in and taking them out, and try to figure out which tube maps to which pen.  You should also note a threshold on that holder that you can use to judge if the pen is in or out.  The numbers will be bouncing around at like 300-ish.
	When you've figured out which thresholds to use for which pens, you can type those into the top, and also rename the tools if you want (I had a pen, a brush, a marker, and a pencil)
	Kill the debug output from the Arduino code and re-enable the real output (of just numbers)
	Re-load the code onto the Arduino
	Close Arduino
	Open Processing
	Run the sketch; it should connect and talk properly unless you have a bunch of weird COM ports (if that's the case, just play with the COM port index)
	Good to go!
	
EL things:

Ingredients:
	Print
	Controller
	Batteries

It depends which demo you're doing, but basically you just have to plug in the wires to the controllers and power them up.  I hate the sound they make, but anyway you can just let them run.  Play with the flashing vs. not-flashing.

Maze:

	No setup required.  :)