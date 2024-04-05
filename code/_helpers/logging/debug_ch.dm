/// Logging for config errors
/// Rarely gets called; just here in case the config breaks.
/proc/log_config(text, list/data)
	/* Bastion of Endeavor Translation
	var/entry = "CONFIG: "
	*/
	var/entry = "КОНФИГ: "
	// End of Bastion of Endeavor Translation

	entry += text
	/* Bastion of Endeavor Translation
	entry += " | DATA: "
	*/
	entry += " | ДАННЫЕ: "
	// End of Bastion of Endeavor Translation
	entry += data

	WRITE_LOG(diary, entry)
	SEND_TEXT(world.log, text)
