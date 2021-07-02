// This macro converts .czi files to tif files

// Author: Miguel Fernandes
// Date: 19 April 2021

// Usage:
// Run this macro and select a folder containing .czi files

//Asks to select a directory. There should not be any " " in your directory or file names
dir=getDirectory("choose file directory");
print(dir)

flist=getFileList(dir);


setBatchMode(true); //batch mode on 
for(i=0;i<flist.length;i++){

	// check if files are .czi
	
	if(endsWith(flist[i],"czi")){
		path=dir+flist[i];
		print(flist[i],"is a czi file.");
		
	// open files
	run("Bio-Formats (Windowless)", "open=[path]");
	
	nameOnly = File.nameWithoutExtension;
	print("Image name without extension= " + nameOnly);

	// save as tif
	saveAs("Tiff", dir + nameOnly);
	print("End of file" + path);
    }
   
    else {
    	print(flist[i],"is NOT a czi file.");
    }
    run("Close All");
         
}

print ("FINISHED ALL FILES")
setBatchMode(false); //exit batch mode

