#undef ASSERT

/// Override BYOND's native ASSERT to optionally specify a message
#define ASSERT(condition, message...) \
	if (!(condition)) { \
		CRASH(assertion_message(__FILE__, __LINE__, #condition, ##message)) \
	}

/proc/assertion_message(file, line, condition, message)
	if (!isnull(message))
		message = " - [message]"

	/* Bastion of Endeavor Translation
	return "[file]:[line]:Assertion failed: [condition][message]"
	*/
	return "[file]:[line]: Не удался ASSERT: [condition][message]"
	// End of Bastion of Endeavor Translation
