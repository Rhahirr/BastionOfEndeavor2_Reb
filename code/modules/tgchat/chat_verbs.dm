/client/verb/export_chat()
	/* Bastion of Endeavor Translation
	set category = "OOC.Chat" //CHOMPEdit
	set name = "Export Chatlog"
	set desc = "Allows to trigger the chat export"
	*/
	set category = "OOC.Чат"
	set name = "Сохранить историю чата"
	set desc = "Сохранить текущую историю чата на компьютер."
	// End of Bastion of Endeavor Translation

	tgui_panel.window.send_message("saveToDiskCommand")
