// This macro converts .dcm sequence of files to tif files

// Author: Miguel Fernandes
// Date: 19 May 2021

// Usage:
// Run this macro and select a folder containing .dcm files

//Asks to select a directory. There should not be any empty spaces in your directory or file names

#@ File (label="Select a folder to process", style="directory") inputFolder
#@ String (label = "File suffix to save", value = "tif") suffixOutput
#@ File (label="Select a folder to save results", style="directory") outputFolder

print(inputFolder);

setBatchMode(true); //batch mode on


// open image sequence of files
run("Image Sequence...", "open=[inputFolder] file=.dcm");

nameOnly = File.nameWithoutExtension;
print("Image name without extension= " + nameOnly);

saveAs(suffixOutput, outputFolder + "/combined_stack_" + nameOnly);


run("Close All");
print ("FINISHED ALL FILES");
setBatchMode(false); //exit batch mode
