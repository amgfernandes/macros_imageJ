//use Process> Multiple image processor to select complete folder


function action(input, output, filename) {
	open(input + filename);
	
	run("Image Stabilizer", "transformation=Translation maximum_pyramid_levels=4 template_update_coefficient=0.90 maximum_iterations=1000 error_tolerance=0.0000001 output_to_a_new_stack");
      	
      	saveAs("Tiff", output + filename);
        close();
}


