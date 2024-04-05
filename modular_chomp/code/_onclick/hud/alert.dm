/obj/screen/alert/open_ticket
	icon = 'modular_chomp/icons/logo.dmi'
	/* Bastion of Endeavor Translation: Bastion of Endeavor TODO: This could use our own icon... once we get one
	name = "Admin Chat Request"
	desc = "A Administrator would like to chat with you. \
	Click here to begin."
	*/
	name = "Общение с администратором"
	desc = "С вами хочет поговорить администратор. Нажмите здесь, чтобы начать."
	// End of Bastion of Endeavor Translation
	icon_state = "32x32"

/obj/screen/alert/open_ticket/Click()
	if(!usr || !usr.client) return

	// Open a new chat with the user
	var/datum/ticket_chat/TC = new()
	TC.T = usr.client.current_ticket
	TC.tgui_interact(usr.client.mob)
