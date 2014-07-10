iosTouchPropagationTest
=======================

Play around with for exactly 5 seconds and immediately understand how ios touch event propagation works.

Apple's docs are terribly obfuscated and unhelpful. I just want a damn overview regarding how touch events work. This app just has 5 boxes showing a bunch of different scenarios, so you can figure it out in 2 seconds. But even quicker, I'll just list the bullet points:

- You touch the screen
- Window gets event, passes it to all children views with userInteractionEnabled == YES
- when a view gets event, continue pasing it down to its eligable children to do the same
- once propagation hits view with no children with userInteractionEnabled == YES, start upward propagation on self
- when a view gets event propagating upward, check if it's listening for a gesture
  - if so, fire event, and STOP propagation.
  - if not, pass event up to parent
