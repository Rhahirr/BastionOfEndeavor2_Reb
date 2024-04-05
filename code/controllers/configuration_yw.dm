/datum/configuration
	var/shipping_auth = "memes"
	var/list/authedservers = list()

// Example line in the config:
// 192.168.1.1:1234 ServerName;ServerPW (The PW of that server, ask them for it)
/datum/configuration/proc/loadshippinglist(filename)
	var/list/Lines = file2list(filename)
	for (var/t in Lines)
		if(!t)	continue
		t = trim(t)
		/* Bastion of Endeavor Unicode Edit
		if (length(t) == 0)
		*/
		if (length_char(t) == 0)
		// End of Bastion of Endeavor Unicode Edit
			continue
		/* Bastion of Endeavor Unicode Edit
		else if (copytext(t, 1, 2) == "#")
		*/
		else if (copytext_char(t, 1, 2) == "#")
		// End of Bastion of Endeavor Unicode Edit
			continue

		/* Bastion of Endeavor Unicode Edit
		var/pos = findtext(t, " ")
		*/
		var/pos = findtext_char(t, " ")
		// End of Bastion of Endeavor Unicode Edit
		var/ip = null
		var/value = null

		if (pos)
			/* Bastion of Endeavor Unicode Edit
			ip = lowertext(copytext(t, 1, pos))
			value = copytext(t, pos + 1)
			*/
			ip = lowertext(copytext_char(t, 1, pos))
			value = copytext_char(t, pos + 1)
			// End of Bastion of Endeavor Unicode Edit
		else
			ip = lowertext(t)

		if (!ip)
			continue

		var/name
		var/auth
		/* Bastion of Endeavor Unicode Edit
		pos = findtext(value, ";")
		*/
		pos = findtext_char(value, ";")
		// End of Bastion of Endeavor Unicode Edit
		if (pos)
			/* Bastion of Endeavor Unicode Edit
			name = lowertext(copytext(value, 1, pos))
			auth = copytext(value, pos + 1)
			*/
			name = lowertext(copytext_char(value, 1, pos))
			auth = copytext_char(value, pos + 1)
			// End of Bastion of Endeavor Unicode Edit

		authedservers[ip] = new /datum/shippingservers(ip, name, auth)
		/* Bastion of Endeavor Unicode Edit
		world << "Added server: [ip] [name] [auth] to list"
		*/
		world << "В список добавлен сервер: [ip] [name] [auth]"
		// End of Bastion of Endeavor Unicode Edit


/datum/shippingservers
	var/serverip
	var/servername
	var/serverauth
	var/list/allowedshipids

/datum/shippingservers/New(_serverip, _servername, _serverauth)
	if(!_serverip || !_servername || !_serverauth)
		/* Bastion of Endeavor Unicode Edit
		throw EXCEPTION("Invalid arguments sent to shippingservers/New().")
		*/
		throw EXCEPTION("В shippingservers/New() отправлены недопустимые аргументы.")
		// End of Bastion of Endeavor Unicode Edit

	serverip = _serverip
	servername = _servername
	serverauth = _serverauth