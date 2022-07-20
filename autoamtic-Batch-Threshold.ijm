//gets the path of the image
path = File.openDialog("Select the first image");

//opens the image
open(path);

//gets the folder that the image is lcoated in 
dir = File.getParent(path);

//gets the name of the file (the image)
theName = getInfo("image.filename");

//asks the user for number of images
n = getNumber("Enter number of images: ", 100);

//HSB values
hueMin = getNumber("Enter Hue MINIMUM Value: ", 0);
hueMax = getNumber("Enter Hue MAXIMUM Value: ", 255);
satMin = getNumber("Enter Saturation MINIMUM Value: ", 0);
satMax = getNumber("Enter Saturation MAXIMUM Value: ", 255);
briMin = getNumber("Enter Brightness MINIMUM Value: ", 0);
briMax = getNumber("Enter Brightness MAXIMUM Value: ", 255);


//START OF COLOR THRESHOLDING
for (n ;n>0;n--){
min=newArray(3);
max=newArray(3);
filter=newArray(3);
a=getTitle();
run("HSB Stack");
run("Convert Stack to Images");
selectWindow("Hue");
rename("0");
selectWindow("Saturation");
rename("1");
selectWindow("Brightness");
rename("2");

//HUE VALEUS
min[0]=hueMin;
max[0]=hueMax;
filter[0]="pass";

//SATURATION VALEUS
min[1]=satMin;
max[1]=satMax;
filter[1]="pass";

//BRIGHTNESS VALUES
min[2]=briMin;
max[2]=briMax;
filter[2]="pass";


for (i=0;i<3;i++){
  selectWindow(""+i);
  setThreshold(min[i], max[i]);
  run("Convert to Mask");
  if (filter[i]=="stop")  run("Invert");
}
imageCalculator("AND create", "0","1");
imageCalculator("AND create", "Result of 0","2");
for (i=0;i<3;i++){
  selectWindow(""+i);
  close();
}
selectWindow("Result of 0");
close();
selectWindow("Result of Result of 0");
rename(a);
//End of Color Thresholding--------------------

//Selects the area with the defined parameters
run("Create Selection");
setBackgroundColor(0, 0, 0);
run("Clear Outside");

//measure the selection
run("Measure");

//AFTER THE COLOR THRESHOLD----------------
//opens the first image
open(dir+"/" + theName);

//opens the next image in the folder
run("Open Next");

//selects the first image
selectWindow(theName);

//closes the first image
close();

//makes theName variable the current window
theName= getInfo("image.filename");

//close the new image
close();

//reopen the new image to have macro performed
open(dir+ "/" + theName);
}




