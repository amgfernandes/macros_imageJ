// This macro converts .tif files to .nrrd files

// Author: Miguel Fernandes
// Date: 07 Feb 2022

// Usage:
// Run this macro and select a folder containing .tif files

//Asks to select a directory. There should not be any " " in your directory or file names
dir=getDirectory("choose file directory");
print(dir)

flist=getFileList(dir);


setBatchMode(true); //batch mode on 


for(i=0;i<flist.length;i++){

	// check if files are .tif
	
	if(endsWith(flist[i],"tif")){
		path=dir+flist[i];
		print(flist[i],"is a tif file.");
		
	// open files
	run("Bio-Formats (Windowless)", "open=[path]");
	
	nameOnly = File.nameWithoutExtension;
	print("Image name without extension= " + nameOnly);

	run("Nrrd ... ", "nrrd="+dir + nameOnly + ".nrrd");

	print("End of file" + path);


    }
   
    else {
    	print(flist[i],"is NOT a tif file.");
    }
    run("Close All");
         
}

print ("FINISHED ALL FILES")
setBatchMode(false); //exit batch mode

