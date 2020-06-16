run("Duplicate...", "duplicate");
rename("Gcamp");
selectWindow("Gcamp");
run("Z Project...", "start=30 stop=40 projection=[Average Intensity]");
selectWindow("AVG_Gcamp");
//run("Enhance Contrast", "saturated=0.35");
imageCalculator("Subtract create stack", "Gcamp","AVG_Gcamp");

rename("Result of Gcamp.tiff");
selectWindow("Result of Gcamp.tiff");
run("Enhance Contrast", "saturated=0.35");

imageCalculator("Divide create 32-bit stack", "Result of Gcamp.tiff","AVG_Gcamp");
selectWindow("Result of Result of Gcamp.tiff");
run("Enhance Contrast", "saturated=0.35");
