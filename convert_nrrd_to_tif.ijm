dir=getDirectory("choose file directory");//ask you to select directory. there should not be any " " in your directory or file names
print(dir)
flist=getFileList(dir);
//setBatchMode(true); //batch mode on //dont used it for image stabilization
for(i=0;i<flist.length;i++){
	if(endsWith(flist[i],"nrrd")){
		path=dir+flist[i];
	run("Bio-Formats", "open=[path] color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
	title=getTitle();
	print (title);
	saveAs("Tif", dir + title);
	print("End of file" + path);
	}
}
print ("FINISHED ALL FILES")
//setBatchMode(false); //exit batch mode	

