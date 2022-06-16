# Final-Project
## Table of Contents
- [What is the Project?](https://github.com/AryanB1/Final-Project/blob/main/README.md#what-is-the-project)
- [Purpose and Personal Interest](https://github.com/AryanB1/Final-Project/blob/main/README.md#purpose-and-personal-interest)
- [Features and Easter Eggs](https://github.com/AryanB1/Final-Project/blob/main/README.md#features-and-easter-eggs)
- [Unfinished Features](https://github.com/AryanB1/Final-Project/blob/main/README.md#unfinished-features)
- [Class Flow Chart](https://github.com/AryanB1/Final-Project/blob/main/README.md#class-flow-chart)
- [Class Design and Constructors](https://github.com/AryanB1/Final-Project/blob/main/README.md#class-design-and-constructors)
- [Important Variables and Functions](https://github.com/AryanB1/Final-Project/blob/main/README.md#important-variables-and-functions)
- [Game Instructions](https://github.com/AryanB1/Final-Project/blob/main/README.md#important-variables-and-functions)
- [Release Link and Running Instructions](https://github.com/AryanB1/Final-Project/blob/main/README.md#release-link-and-running-instructions)
## What is the Project?
- This project is a pong game ([Wikipedia](https://en.wikipedia.org/wiki/Pong))
- This project is written in the processing language ([Processing Documentation](https://processing.org/reference))
## Purpose and Personal Interest 
- **Purpose:** To demonstrate my knowledge in the processing language and understanding of object orientated programming principles alongside other curricular outcomes of advanced computer science
- **Personal Interest:** My personal interest in completing this project is because after writing and rewriting pong so many times in class, I wanted to finish this course with the best version of pong that I could create
## Features and Easter Eggs
- All basic features of pong gone over in class
- Easter Eggs: If the left score and right score equal to three a special interaction occurs
- Additional Features: If one player wins they recieve a celebration of circles
- When a goal is scored a small piece of the goal scoarers paddle falls off to make it fair, and the screen shows a message congratulation the player for scoring
- There are buttons for starting the game, exiting the game (while the game is on instructions mode, and when the screen mode is in portrait), and restarting the game (while the game is being played, and when the game is won)
- Although buttons are present in the game, all keypress commands are still available, as if the user does not have a mouse, using a trackpad to click buttons can be inconvienient 
## Unfinished Features
- Full Android Support: At the moment, only a few key features are available through mousePressed, with many features still utilizing keyPressed. For a full port to the Android operating system, touch screen support needs to be added to the following features: Paddle Movement, paddle speed settings, ball speed settings, multiplayer vs singleplayer vs screensaver, and nightmode vs daymode. These features would be added through a deeper use of the Buttons class, and by refactoring my existing classes to support mousePressed() rather than keyPressed()
- Online Multiplayer Support: Use computer networking principles and webhosting to allow for online multiplayer pong games. Implementing this feature would require a deeper understanding of network protocals and server management rather than any specific class in my code
- Different Background Themes and Theme Selection: Allow the user to select a background to play pong on such as a tennis court, a badminton court, or a table tennis table. This would be implemented through a deeper use of my Buttons class 
## Class Flow Chart
![class_structure](class_structure.png)
## Class Design and Constructors
- Abstract Class Shape
  - The constructor contains source variables that all subclasses use, all core variables are both gotten and set from the variables found in shapes
  - This class also initializes an array list, and every object from any subclass is displayed on the screen using this class
- Circle Class
  - The first constructor creates the balls that are used to play the game
  - The second constructor is used to create the victory animation
  - The first constructor uses a method to cause the ball to bounce by tracking the position of the paddle and the ball in the draw function of the main program. This method is implemented through calling a common method which is then added as an abstract method in the shapes class, and is then called in the main program
  - The first constructor uses another common method to indicate the ball speed
  - The second contructor uses a series of logic statements found in the setup, and draw functions of the main program, so that the circle continuosly move with each changing iteration of the program. 
- Rectangle Class
  - The first constructor is used to create the paddles, scoreboard, and left / right goal score backgrounds
  - The second constructor is used to create the animation of the paddle reducing in size after each goal is scored
  - The rectangle class uses two common methods to set the paddle speed, and allow for paddle movement
  - A method is used in the Circle class to cause the paddle size to shrink, and engages the second constructor to show the animation of the paddle shrinking in size
- Text Class
  - The first constructor is used for single lines of text such as the score 
  - The second constructor is used for multiple lines of text such as the instructions
  - The first constructor uses a getter and setter to change the message being displayed based on certain conditions as determined by the draw class
  - At the moment, there is no getter and setter for the second constructor because the only use for this constructor is to display the instructions, and these instructions never change in the current program. However, for a future version of this program, a similar getter and setter to what is implemented for the first constructor can be used.
 - Buttons Class
  - The constructor is used to create the elements needed for the button to be visible, have text on it, and the parameters needed to control button clicks.
  - Hover functionality has been added by getting the MouseX and MouseY position, and checking if it is within the rectangular shape of the button. When a user hovers over a button, the fill colour becomes a shade of grey.
  - A getter and setter is used to change the text for a button depending on the situation.
  - A method is used to crossreference the button text with a list of commands, and when a button's text is the same as the command text, a specific action occurs when the button is pressed
## Important Variables and Functions
There are three important variables used in this program that cannot be explained through the class design portion.
- Nightmode: This variable changes the background and foreground colours depending on whether it is true or false. When it is true, the colours are changed to night-friendly colours. When it is false, the colours are changed to day-friendly colours
- Screensaver: Modifies the movements of the paddle so that they are always equal to the ball, thereby creating a screensaver as no point will ever be scored using this feature
- Singleplayer: This variable determines whether or not singleplayer is active. When singleplayer is active, only the left paddle is functional. 
- KeyPressed: Tracks when a key is pressed, both the circle and ball class both have keyPressed methods, that are called in the keyPressed function in the main program
- MousePressed: Tracks when a mouse or trackpad is clicked: The buttons class has a mousePressed method to track when the button is clicked. 
- Setup: Where all objects are intialized and added to the shapes class
- Draw: Where all objects are drawn
## Game Instructions
**All Instructions are present in the game, however they have also been added below:**
- Please set your screen in landscape mode
- For single player: press j (You control the left paddle)
- To turn off single player: press z
- For screen saver: press f
- To turn off screen saver: press z
- To turn on night mode: press q
- To turn off night mode: press e
- To move the left paddle up, press w
- To move the left paddle down, press s
- To move the right paddle up, press the up key
- To move the right paddle down, press the down key
- For Left Paddle Speed, Press n (hard), r (normal), g (easy)
- For Right Paddle Speed, Press m (hard), t (normal), h (easy)
- By default both of these speed parameters are set to easy
- To reset game press z
- Click any number key beteween 1-9 if you want to add or remove balls (there is one ball by default)
- A point is scored by getting a point into the enemy players net, or in the case of single player mode, hitting the ball 
- First one to 5 points wins!!
- Press i to close this window! It can be reopened any time you need to see the instructions or take a break!
- You can use the o(easy), u(normal), and p(hard) keys to set the ball speed. By default, the speed is set to easy
- If the addition of the left and right scoreboard equals 3, try clicking anywhere in the middle of the screen!
- Feel Free using key presses or mouse presses to complete commands
## Release Link and Running Instructions
- Export the 64 bit windows application
- Unzip the folder
- Open the folder
- Run the application that has the ".exe" ending
- Release ([Link](https://github.com/AryanB1/Final-Project/releases/tag/Finished))
