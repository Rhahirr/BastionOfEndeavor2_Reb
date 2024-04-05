//Splits the text of a file at seperator and returns them in a list.
//returns an empty list if the file doesn't exist
/world/proc/file2list(filename, seperator="\n", trim = TRUE)
	if (trim)
	/* Bastion of Endeavor Translation: You never know.
		return splittext(trim(file2text(filename)),seperator)
	return splittext(file2text(filename),seperator)
	*/
		return splittext_char(trim(file2text(filename)),seperator)
	return splittext_char(file2text(filename),seperator)
	// End of Bastion of Endeavor Translation
