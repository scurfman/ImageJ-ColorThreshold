//Color Threshold Single Image
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
min[0]=0;
max[0]=255;
filter[0]="pass";

//SATURATION VALEUS
min[1]=0;
max[1]=255;
filter[1]="pass";

//BRIGHTNESS VALUES
min[2]=0;
max[2]=255;
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
//End of Color Thresholding-------------

//Selects the area with the defined parameters
run("Create Selection");
setBackgroundColor(0, 0, 0);
run("Clear Outside");


//measure the selection
run("Measure");


//Remove the slashes from the last line if you want the picture to close
//close the picture
//close();
