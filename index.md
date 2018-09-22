# Homepage  
## The Indian Dribble
[![Indian Dribble](https://img.youtube.com/vi/1vc94igXQo/0.jpg)](https://www.youtube.com/watch?v=-1vc94igXQo)
# Diagram
# Analysis
We are able to evalute the success of an Indian Dribble, by breaking it down into four components: speed, consistency, levelness, and accuracy of rotations. From this breakdown, we can give users actionable feedback on their dribbling. 
## Speed
A large indicator of how well this drill is done, is speed. The faster, the better. To get an idea of how fast you are doing the drill, we did some frequency analysis. Because the motion is repetitive, it has a frequency. To get a better understanding of someone's frequency throughout the drill, we performed the Fast Fourier Transformation (FFT). The FFT transfered the data into the frequency domain, plotting against magnitude, allowing us to deduce the main frequency components. To find the characteristic frequency of the motion, we normalized the data. We subtracted the frequency of the second highest peak, from the frequency of the highest peak (which centers near zero). This left us with the frequency at which the drill was completed. We then translated these frequencies to a scale of 1 to 10, to give users feedback on their speed.

*Insert image of fft
*Insert metric

*Insert image of FFt
*Insert metric
## Consistency
While speed is important, so is the consistency at which you are able to keep up that speed.
## Levelness
In our case, yaw measured how far off the line the stick went. To make your dribble as good as possible, you want to minimize any movement in this direction. Looking at a graph of the yaw, you will notice the sinusoidal shape. It is a sinusoid and not a straight line due to the turns at each end of the dribble, but a good drill has a very subtle sinusoidal curve. To put this into a metric, we found the peaks and valleys of our yaw curve, and foudn their difference. We then put those differences into a scale based off of which difference were closest to ideal, and which ones needed the most coaching. Below are two examples, one of a fairly level drill, and one that wavered more in the yaw.

*Insert image of yaw one
*Insert score of yaw 1

*Insert image of yaw bad
*Insert score of yaw bad

As shown by the graphs, the more subtle the curve, the better the score.
## Accurate Rotations
An ideal Indian Dribble takes the stick from a 90 degree angle, with the end of the stick pointing away from you, all the way around to a 270 degree angle, where the end of the stick is facing you. We were able to determine how close someones dirbble came to perfectly hitting these angles, by looking at the roll data to see if the extrema are 90 and 270 degrees. Depending on how close you cme to hitting thses angles, you will get a score out of ten, as well as how many degrees off your drill was on each side.

*Image 1
*Response 1

*Image 2
*Response 2

# Future Steps
words
# Source Code
```markdown
Syntax highlighted code block
```
[Link](url) and ![Image](src)

    
