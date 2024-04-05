/proc/log_nsay(text, inside, mob/speaker)
	if (config.log_say)
		/* Bastion of Endeavor Translation
		WRITE_LOG(diary, "NSAY (NIF:[inside]): [speaker.simple_info_line()]: [html_decode(text)]")
		*/
		WRITE_LOG(diary, "НИФ-РЕЧЬ (НИФ:[inside]): [speaker.simple_info_line()]: [html_decode(text)]")
		// End of Bastion of Endeavor Edit
	//CHOMPEdit Begin
	if(speaker.client)
		if(!SSdbcore.IsConnected())
			establish_db_connection()
			if(!SSdbcore.IsConnected())
				return null
		var/datum/db_query/query_insert = SSdbcore.NewQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, NOW(), :sender_ckey, :sender_mob, :message_type, :message_content)", \
			list("sender_ckey" = speaker.ckey, "sender_mob" = speaker.real_name, "message_type" = "nsay", "message_content" = text))
		if(!query_insert.Execute())
			/* Bastion of Endeavor Translation
			log_debug("Error during logging: "+query_insert.ErrorMsg())
			*/
			log_debug("Ошибка во время логирования: "+query_insert.ErrorMsg())
			// End of Bastion of Endeavor Translation
			qdel(query_insert)
			return
		qdel(query_insert)
	//CHOMPEdit End

/proc/log_nme(text, inside, mob/speaker)
	if (config.log_emote)
		/* Bastion of Endeavor Translation
		WRITE_LOG(diary, "NME (NIF:[inside]): [speaker.simple_info_line()]: [html_decode(text)]")
		*/
		WRITE_LOG(diary, "НИФ-ДЕЙСТВИЕ (НИФ:[inside]): [speaker.simple_info_line()]: [html_decode(text)]")
		// End of Bastion of Endeavor Edit
	//CHOMPEdit Begin
	if(speaker.client)
		if(!SSdbcore.IsConnected())
			establish_db_connection()
			if(!SSdbcore.IsConnected())
				return null
		var/datum/db_query/query_insert = SSdbcore.NewQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, NOW(), :sender_ckey, :sender_mob, :message_type, :message_content)", \
			list("sender_ckey" = speaker.ckey, "sender_mob" = speaker.real_name, "message_type" = "nme", "message_content" = text))
		if(!query_insert.Execute())
			/* Bastion of Endeavor Translation
			log_debug("Error during logging: "+query_insert.ErrorMsg())
			*/
			log_debug("Ошибка во время логирования: "+query_insert.ErrorMsg())
			// End of Bastion of Endeavor Translation
			qdel(query_insert)
			return
		qdel(query_insert)
	//CHOMPEdit End

/proc/log_subtle(text, mob/speaker)
	if (config.log_emote)
		/* Bastion of Endeavor Translation
		WRITE_LOG(diary, "SUBTLE: [speaker.simple_info_line()]: [html_decode(text)]")
		*/
		WRITE_LOG(diary, "СКРЫТОЕ ДЕЙСТВИЕ: [speaker.simple_info_line()]: [html_decode(text)]")
		// End of Bastion of Endeavor Edit
	//CHOMPEdit Begin
	if(speaker.client)
		if(!SSdbcore.IsConnected())
			establish_db_connection()
			if(!SSdbcore.IsConnected())
				return null
		var/datum/db_query/query_insert = SSdbcore.NewQuery("INSERT INTO erro_dialog (mid, time, ckey, mob, type, message) VALUES (null, NOW(), :sender_ckey, :sender_mob, :message_type, :message_content)", \
			list("sender_ckey" = speaker.ckey, "sender_mob" = speaker.real_name, "message_type" = "subtle", "message_content" = text))
		if(!query_insert.Execute())
			/* Bastion of Endeavor Translation
			log_debug("Error during logging: "+query_insert.ErrorMsg())
			*/
			log_debug("Ошибка во время логирования: "+query_insert.ErrorMsg())
			// End of Bastion of Endeavor Translation
			qdel(query_insert)
			return
		qdel(query_insert)
	//CHOMPEdit End
