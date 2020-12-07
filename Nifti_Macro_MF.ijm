// Convert red and green Channel czi to Nifti-format 
// written by Miguel Fernandes 6March2020

input = getDirectory("Choose a Directory");
print(input);
setBatchMode(true); 
list = getFileList(input);

for (i = 0; i < list.length; i++){
	
	//####################################################################
	// To get the Autonaming and Finding the correct files
	
	filex = list[i];
	dir = input; 
	name = filex;

	filename = input+filex;
	filename_lenght = lengthOf(filename);
	filename_ending = substring(filename,filename_lenght-3,filename_lenght);
	filename_raw = substring(filename,0,filename_lenght-4);
	
	new_filename_red = filename_raw+"_01.nii";
	new_filename_green = filename_raw+"_02.nii";

	path = filename_raw+".czi";
	index = lastIndexOf(path, "\\");
	window_name = substring(path,index+1,lengthOf(path));
		
	if (filename_ending == "czi"){
		print ("czi-file: "+ filename);
		//####################################################################
		run("Bio-Formats Macro Extensions");
		dimOrder="";
		cOP="split_channels";
		tOP="";
		
		options="open=["+path+"] view=[Standard ImageJ] " +cOP+" "+tOP+" autoscale";
		run("Bio-Formats Importer",options);
		
		print("Red: "+ new_filename_red);
		selectWindow(window_name+" - C=0");
		run("NIfTI-1", "save="+new_filename_red);
		print("Green: "+ new_filename_green);
		selectWindow(filex +" - C=1"); //change channel here to 2 if T-PMT present (original 1)
		run("NIfTI-1", "save="+new_filename_green);

		run("Close All");
	}
	else{
	print ("");
	}
}
print ("DONE WITH ALL FILES");
setBatchMode(false);