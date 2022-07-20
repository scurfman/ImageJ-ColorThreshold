# ImageJ-ColorThreshold

This repository contains macro programs for color thresholding RGB images. In order for the RGB image to be thresholded using a macro, it has to be converted to a HSB (Hue, Saturation, Brightness) Image. All macros will run the measure function at the end. 

**This macro does NOT work for the batch measure.**

-The macro titled **"color-threshold"** is a basis to which a single image can be color thresholded. To edit it, you go Plugins --> Macros --> Edit... to view the macro code. You can then change the different values (which are labeled) to suit your needs. 

-The macro titled **"batch-Threshold"** prompts for the number of images, and the values for each of the HSB values. The macro defaults the min to 0 and the max to 255. This macro only works if you have each image opened separatley. (Ex -  This can be done by selecting 30 images and dragging them into the window, allowing each one to open.) The amount of images that can be open will depend on the RAM you have allocated to the program, which can be changed under Edit --> Options --> Memory & Threads. The images will load bottom to top, so sort the images in the folder by Z->A. 

Macros can be installed into ImageJ, but will be removed everytime the program is restarted. 
