remove_slices(10)
function remove_slices(s) {
//remove s initial slides. Typically a lot of background
	
	Stack.getDimensions(width, height, channels, slices, frames);
	setSlice(slices);
	s =  s;
	while (s > 0) {
		
		setSlice(s);		
		slices = slices - 1;
		if (slices < s) {
			run("Delete Slice");
			s = s - 1;
			}
	}
}		
