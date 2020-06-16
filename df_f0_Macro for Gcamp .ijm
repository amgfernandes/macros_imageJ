run("Z Project...", "start=30 stop=40 projection=[Average Intensity]");
imageCalculator("Subtract create stack", "F4_pmtUG.tiff","AVG_F4_pmtUG.tiff");
imageCalculator("Divide create 32-bit stack", "Result of F4_pmtUG.tiff","AVG_F4_pmtUG.tiff");
run("Enhance Contrast", "saturated=0.35");
