// This macro converts .tif files to .nrrd files

// Author: Miguel Fernandes
// Date: 07 Feb 2022

// Usage:
// Run this macro and select a folder containing .tif files

#@ File (label="Select a folder to process", style="directory") inputFolder 
#@ String (label = "File suffix", value = ".tif") suffix
#@ File (label="Select a folder to save results", style="directory") outputFolder 


print("User selected input folder: " + inputFolder);
print("User selected save folder: " + outputFolder);




setBatchMode(true); //batch mode on

//get file list from input folder
fileList=getFileList(inputFolder);


for (i = 0; i < lengthOf(fileList); i++) {
	
	fileName=fileList[i];
	
	//check if file is correct one
    if (endsWith(fileName, suffix)) {
    	path=inputFolder + "/"+ fileList[i];
    	print(fileName,"is a" + suffix + " file");
         
		
	// open files
	run("Bio-Formats (Windowless)", "open=[path]");
	
	nameOnly = File.nameWithoutExtension;
	print("Image name without extension= " + nameOnly);


	run("NIfTI-1", "save=["+outputFolder+"/"+nameOnly +".nii]");

	print(outputFolder+"/"+nameOnly + ".nii");


    }
   
    else {
    	print(fileList[i],"is NOT a tif file.");
    }
    run("Close All");
         
}

print ("FINISHED ALL FILES")
setBatchMode(false); //exit batch mode

