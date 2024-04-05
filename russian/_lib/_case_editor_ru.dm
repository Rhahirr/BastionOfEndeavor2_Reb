/**
 * Creates a TGUI window with a text input. Returns the user's response.
 *
 * This proc should be used to create windows for text entry that the caller will wait for a response from.
 * If tgui fancy chat is turned off: Will return a normal input. If max_length is specified, will return
 * stripped_multiline_input.
 *
 * Arguments:
 * * user - The user to show the text input to.
 * * message - The content of the text input, shown in the body of the TGUI window.
 * * title - The title of the text input modal, shown on the top of the TGUI window.
 * * default - The default (or current) value, shown as a placeholder.
 * * max_length - Specifies a max length for input. MAX_MESSAGE_LEN is default (4096)
 * * multiline -  Bool that determines if the input box is much larger. Good for large messages, laws, etc.
 * * encode - Toggling this determines if input is filtered via html_encode. Setting this to FALSE gives raw input.
 * * timeout - The timeout of the textbox, after which the modal will close and qdel itself. Set to zero for no timeout.
 */
/proc/tgui_case_editor_ru(mob/user, message = "", title = "Text Input", default, max_length = INFINITY, multiline = FALSE, encode = FALSE, timeout = 0, prevent_enter = FALSE)
	if (istext(user))
		stack_trace("tgui_case_editor_ru() received text for user instead of mob")
		return
	if (!user)
		user = usr
	if (!istype(user))
		if (istype(user, /client))
			var/client/client = user
			user = client.mob
		else
			return
	// Client does NOT have tgui_input on: Returns regular input
	if(!user.client.prefs.tgui_input_mode)
		if(encode)
			if(multiline)
				return stripped_multiline_input(user, message, title, default, max_length)
			else
				return stripped_input(user, message, title, default, max_length)
		else
			if(multiline)
				return input(user, message, title, default) as message|null
			else
				return input(user, message, title, default) as text|null
	var/datum/tgui_case_editor_ru/case_editor_ru = new(user, message, title, default, max_length, multiline, encode, timeout, prevent_enter)
	case_editor_ru.tgui_interact(user)
	case_editor_ru.wait()
	to_chat(user, "Что-то случилось!")
	if (case_editor_ru)
		. = case_editor_ru.entry
		qdel(case_editor_ru)

/**
 * tgui_case_editor_ru
 *
 * Datum used for instantiating and using a TGUI-controlled text input that prompts the user with
 * a message and has an input for text entry.
 */
/datum/tgui_case_editor_ru
	/// Boolean field describing if the tgui_case_editor_ru was closed by the user.
	var/closed
	/// The default (or current) value, shown as a default.
	var/default
	/// Whether the input should be stripped using html_encode
	var/encode
	/// The entry that the user has return_typed in.
	var/entry
	/// The maximum length for text entry
	var/max_length
	/// The prompt's body, if any, of the TGUI window.
	var/message
	/// Multiline input for larger input boxes.
	var/multiline
	/// The time at which the text input was created, for displaying timeout progress.
	var/start_time
	/// The lifespan of the text input, after which the window will close and delete itself.
	var/timeout
	/// The title of the TGUI window
	var/title

	var/prevent_enter

/datum/tgui_case_editor_ru/New(mob/user, message, title, default, max_length, multiline, encode, timeout, prevent_enter)
	src.default = default
	src.encode = encode
	src.max_length = max_length
	src.message = message
	src.multiline = multiline
	src.title = title
	if (timeout)
		src.timeout = timeout
		start_time = world.time
		QDEL_IN(src, timeout)
	src.prevent_enter = prevent_enter

/datum/tgui_case_editor_ru/Destroy(force, ...)
	SStgui.close_uis(src)
	. = ..()

/**
 * Waits for a user's response to the tgui_case_editor_ru's prompt before returning. Returns early if
 * the window was closed by the user.
 */
/datum/tgui_case_editor_ru/proc/wait()
	while (!entry && !closed)
		stoplag(1)

/datum/tgui_case_editor_ru/tgui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "CaseEditorRU")
		ui.open()

/datum/tgui_case_editor_ru/tgui_close(mob/user)
	. = ..()
	closed = TRUE

/datum/tgui_case_editor_ru/tgui_state(mob/user)
	return GLOB.tgui_always_state

/datum/tgui_case_editor_ru/tgui_static_data(mob/user)
	var/list/data = list()
	data["large_buttons"] = user.client.prefs.tgui_large_buttons
	data["max_length"] = max_length
	data["message"] = message
	data["multiline"] = multiline
	data["placeholder"] = default // Default is a reserved keyword
	data["swapped_buttons"] = !user.client.prefs.tgui_swapped_buttons
	// CHOMPedit - prevent_enter should be completely removed in the future
	data["title"] = title
	return data

/datum/tgui_case_editor_ru/tgui_data(mob/user)
	var/list/data = list()
	if(timeout)
		data["timeout"] = clamp((timeout - (world.time - start_time) - 1 SECONDS) / (timeout - 1 SECONDS), 0, 1)
	return data

/datum/tgui_case_editor_ru/tgui_act(action, list/params)
	. = ..()
	if (.)
		return
	switch(action)
		if("submit")
			/* Bastion of Endeavor Translation
			if(length(params["entry"]) > max_length)
			*/
			if(length_char(params["entry"]) > max_length)
			// End of Bastion of Endeavor Translation
				return
			/* Bastion of Endeavor Translation
			if(encode && (length(html_encode(params["entry"])) > max_length))
				to_chat(usr, span_notice("Your message was clipped due to special character usage."))
			*/
			if(encode && (length_char(html_encode(params["entry"])) > max_length))
				to_chat(usr, span_notice("Ваше сообщение было укорочено в связи с использованием особых символов."))
			// End of Bastion of Endeavor Translation
			set_entry(params["entry"])
			closed = TRUE
			SStgui.close_uis(src)
			return TRUE
		if("cancel")
			SStgui.close_uis(src)
			closed = TRUE
			return TRUE

/datum/tgui_case_editor_ru/proc/set_entry(entry)
	if(!isnull(entry))
		var/converted_entry = encode ? html_encode(entry) : entry
		//converted_entry = readd_quotes(converted_entry)
		src.entry = trim(converted_entry, max_length)
