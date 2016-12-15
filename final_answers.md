# Final Questions

## 1

In the working version, the simulation file loading code is done within the universe file, whereas in mu version it is done within the 'NbodySimulation' class. In the working class, the 'load_simulation' method reads the simulation file and sets up all of the bodies. In my code, however, it is all done in the very first 'initialize' section. The working version does all of the coding in order to set up all of the bodies in a much more effective manor, using considerably fewer lines and fewer steps. Both of our codes, however, take the number of bodies, from the first line of a simulation, and uses that in order to determine how many lines of the simulation needed to be read. Then, both codes input that number of bodies into a 'bodies' array.

## 2

The working version of the code sets 25,000 as a global variable, 'DT', whereas I simply inputted the number wherever necessary. Both of our versions, however, calculate the acceleration, velocity, and position in three different methods. Therefore, all of the calculations were spread out and could be more easily identified. Another similarity is found in the method in which all of the forces are calculated. Both versions take the other body inputted and calculate the force, adding it to the force_x and force_y. Our 'draw' methods are different, however, because the working version uses the universe class again, whereas mine simply scales the positions calculated preciously and draws the image. My image drawing may have more room for error, but is also one simple line of code that can be easily managed.

## 3

The advantages of having a Universe class outweigh any disadvantages there may be. A universe class allows a spread out version of all calculations, so therefore the code does not seem to be in disarray. Also, a universe class makes scaling and finding coordinates of each body significantly easier. Everything within the universe class can be easily altered without having to affect the actual 'NbodySimulation', such as a 'reset'  method and an individual 'update_bodies' method. Therefore, having a separate universe class makes the code much more organized and compact, and even more easy to follow. However, disadvantages may include a certain reliance upon the Universe class. If the Body and actual simualtions each rely on the Universe class too much, then any errors that may be found in the Universe class could be catastrophic.

## 4

The main difference between the two versions is the existence of the Universe class. This extra class allows for some more organization within the working version. In my version, however, every calculation you could ever want to look for are only within the two files. Therefore, I honestly prefer my version. In my version, all calculations are done in the 'NbodySimulation' and 'Body' classes. Therefore, these classes are able to find more use, and I am able to find where each calculation is and where it could have gone wrong.

However, I definitely see the allure having the separated classes and methods has. Each method is more fluent, and you can find exactly which method has an error if one exists. However, I can say that in my code all of the calculations are done in very few places, therefore not relying upon other methods much. Therefore I prefer my version, for it has anything I could need to find in only a few places.

## 5

My weaknesses in coding are very apparent in my code. I'm disorganized. My calculations are all done in the same place, and I do that on purpose. I like having all of the calculations in the same place so I personally can follow them. However, that selfish way of thinking only makes it more difficult for others to read my code. Thus, my main weakness is making my code able to be understood by others. My code works, gets the job done, and has everything it needs to. If something goes wrong, I can find it. However, it could be easier and I definitely need to work on that. Another weakness is it takes awhile for me to cross hurdles. If I reach a point in my code in which I do not know which direction to take next, I will take a considerable amount of time to find my next step. I like to decide upon every step I plan on taking before actually taking them in my head. Therefore, this could harm the fluency of actually writing the code.

My strengths, however lie in the effectiveness of the code. Whenever I code, I make sure that every calculation and process is taken care of. Not only that, but I am always sure to get it done in an effective manor so that it works without looking too ugly. Another strength I have is the ability to sit down and focus on writing code. If I only have an hour to write a code, I'll finish it in forty-five minutes. I work quickly and focus constantly so that my train of thought gets to the station as soon as I need it to.
