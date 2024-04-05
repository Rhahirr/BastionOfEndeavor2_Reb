/// verb_manager subsystem just for handling say's
VERB_MANAGER_SUBSYSTEM_DEF(speech_controller)
	/* Bastion of Endeavor Translation
	name = "Speech Controller"
	*/
	name = "Контроллер речи"
	// End of Bastion of Endeavor Translation
	wait = 1
	priority = FIRE_PRIORITY_SPEECH_CONTROLLER//has to be high priority, second in priority ONLY to SSinput
