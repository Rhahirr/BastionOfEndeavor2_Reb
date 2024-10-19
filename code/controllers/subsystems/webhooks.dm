SUBSYSTEM_DEF(webhooks)
	/* Bastion of Endeavor Translation
	name = "Webhooks"
	*/
	name = "Вебхуки"
	// End of Bastion of Endeavor Translation
	init_order = INIT_ORDER_WEBHOOKS
	flags = SS_NO_FIRE
	var/list/webhook_decls = list()

/datum/controller/subsystem/webhooks/Initialize()
	load_webhooks()
	return SS_INIT_SUCCESS // CHOMPEdit

/datum/controller/subsystem/webhooks/proc/load_webhooks()

	if(!fexists(HTTP_POST_DLL_LOCATION))
		/* Bastion of Endeavor Translation
		to_world_log("Unable to locate HTTP POST lib at [HTTP_POST_DLL_LOCATION], webhooks will not function on this run.")
		*/
		to_world_log("Не удалось обнаружить библиотеку HTTP POST в [HTTP_POST_DLL_LOCATION], вебхуки в этом запуске не будут действовать.")
		// End of Bastion of Endeavor Translation
		return

	var/list/all_webhooks_by_id = list()
	var/list/all_webhooks = decls_repository.get_decls_of_subtype(/decl/webhook)
	for(var/wid in all_webhooks)
		var/decl/webhook/webhook = all_webhooks[wid]
		if(webhook.id)
			all_webhooks_by_id[webhook.id] = webhook

	webhook_decls.Cut()
	var/webhook_config = safe_file2text("config/webhooks.json")
	if(webhook_config)
		for(var/webhook_data in cached_json_decode(webhook_config))
			var/wid = webhook_data["id"]
			var/wurl = webhook_data["url"]
			var/list/wmention = webhook_data["mentions"]
			if(wmention && !islist(wmention))
				wmention = list(wmention)
			/* Bastion of Endeavor Translation
			to_world_log("Setting up webhook [wid].")
			*/
			to_world_log("Установка вебхука [wid].")
			// End of Bastion of Endeavor Translation
			if(wid && wurl && all_webhooks_by_id[wid])
				var/decl/webhook/webhook = all_webhooks_by_id[wid]
				webhook.urls = islist(wurl) ? wurl : list(wurl)
				for(var/url in webhook.urls)
					if(!webhook.urls[url])
						webhook.urls[url] = list()
					else if(!islist(webhook.urls[url]))
						webhook.urls[url] = list(webhook.urls[url])
				if(wmention)
					webhook.mentions = wmention?.Copy()
				webhook_decls[wid] = webhook
				/* Bastion of Endeavor Translation
				to_world_log("Webhook [wid] ready.")
				*/
				to_world_log("Вебхук [wid] готов.")
				// End of Bastion of Endeavor Translation
			else
				/* Bastion of Endeavor Translation
				to_world_log("Failed to set up webhook [wid].")
				*/
				to_world_log("Не удалось подготовить вебхук [wid].")
				// End of Bastion of Endeavor Translation

/datum/controller/subsystem/webhooks/proc/send(var/wid, var/wdata)
	var/decl/webhook/webhook = webhook_decls[wid]
	if(webhook)
		if(webhook.send(wdata))
			/* Bastion of Endeavor Translation
			to_world_log("Sent webhook [webhook.id].")
			log_debug("Webhook sent: [webhook.id].")
			*/
			to_world_log("Отправлен вебхук [webhook.id].")
			log_debug("Отправлен вебхук: [webhook.id].")
			// End of Bastion of Endeavor Translation
		else
			/* Bastion of Endeavor Translation
			to_world_log("Failed to send webhook [webhook.id].")
			log_debug("Webhook failed to send: [webhook.id].")
			*/
			to_world_log("Не удалось отправить вебхук [webhook.id].")
			log_debug("Не удалось отправить вебхук: [webhook.id].")
			// End of Bastion of Endeavor Translation

/client/proc/reload_webhooks()
	/* Bastion of Endeavor Translation
	set name = "Reload Webhooks"
	set category = "Debug"
	*/
	set name = "Перезагрузить вебхуки"
	set category = "Отладка"
	// End of Bastion of Endeavor Translation

	if(!holder)
		return

	if(!SSwebhooks.subsystem_initialized)
		/* Bastion of Endeavor Translation
		to_chat(usr, span_warning("Let the webhook subsystem initialize before trying to reload it."))
		*/
		to_chat(usr, span_warning("Позвольте системе вебхуков инициализироваться, прежде чем пытаться её перезагрузить."))
		// End of Bastion of Endeavor Translation
		return

	/* Bastion of Endeavor Translation
	to_world_log("[usr.key] has reloaded webhooks.")
	log_and_message_admins("has reloaded webhooks.")
	*/
	to_world_log("[usr.key] перезагрузил вебхуки.")
	log_and_message_admins("[key_name_admin(usr)] перезагрузил вебхуки.")
	// End of Bastion of Endeavor Translation
	SSwebhooks.load_webhooks()

/client/proc/ping_webhook()
	/* Bastion of Endeavor Translation
	set name = "Ping Webhook"
	set category = "Debug"
	*/
	set name = "Пропинговать вебхук"
	set category = "Отладка"
	// End of Bastion of Endeavor Translation

	if(!holder)
		return

	if(!length(SSwebhooks.webhook_decls))
		/* Bastion of Endeavor Translation
		to_chat(usr, span_warning("Webhook list is empty; either webhooks are disabled, webhooks aren't configured, or the subsystem hasn't initialized."))
		*/
		to_chat(usr, span_warning("Список вебхуков пуст; вебхуки либо выключены, либо не настроены, либо подсистема ещё не инициализирована."))
		// End of Bastion of Endeavor Translation
		return

	/* Bastion of Endeavor Translation
	var/choice = tgui_input_list(usr, "Select a webhook to ping.", "Ping Webhook", SSwebhooks.webhook_decls)
	*/
	var/choice = tgui_input_list(usr, "Выберите нужный вебхук.", "Проверка вебхуков", SSwebhooks.webhook_decls)
	// End of Bastion of Endeavor Translation
	if(choice && SSwebhooks.webhook_decls[choice])
		var/decl/webhook/webhook = SSwebhooks.webhook_decls[choice]
		/* Bastion of Endeavor Translation
		log_and_message_admins("has pinged webhook [choice].", usr)
		to_world_log("[usr.key] has pinged webhook [choice].")
		*/
		log_and_message_admins("пропинговал вебхук [choice].", usr)
		to_world_log("Пользователь [usr.key] пропинговал вебхук [choice].")
		// End of Bastion of Endeavor Translation
		webhook.send()

/hook/roundstart/proc/run_webhook()
	SSwebhooks.send(WEBHOOK_ROUNDSTART, list("url" = get_world_url()))
	return 1
