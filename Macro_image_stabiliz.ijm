dir=getDirectory("choose file directory");//ask you to select directory. there should not be any " " in your directory or file names
print(dir)
flist=getFileList(dir);
//setBatchMode(true); //batch mode on //dont used it for image stabilization
for(i=0;i<flist.length;i++){
	if(endsWith(flist[i],"tiff")){
		path=dir+flist[i];
	run("Bio-Formats", "open=[path] color_mode=Default rois_import=[ROI manager] view=Hyperstack stack_order=XYCZT");
	//run("Open [Image IO]", "image=path" );
	title=getTitle();
	print (title);
	//print(path);
	//run("Enhance Contrast", "saturated=0.35");
	//run("Slice Remover", "first=885 last=902 increment=1");//if some frames are wrong at the end
	run("Image Stabilizer", "transformation=Translation maximum_pyramid_levels=4 template_update_coefficient=0.90 maximum_iterations=1000 error_tolerance=0.0000001");
	//run("Image Stabilizer", "transformation=Affine maximum_pyramid_levels=4 template_update_coefficient=0.90 maximum_iterations=1000 error_tolerance=0.0000001");
	//run("Enhance Contrast", "saturated=0.35");
	//saveAs("Tiff", dir + "c" + title);
	saveAs("Tiff", dir + title);
	print("End of file" + path);
	}
}
print ("FINISHED ALL FILES")
//setBatchMode(false); //exit batch mode	

