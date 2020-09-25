#include <a_samp>
#include <a_mysql>
#include <bcrypt>
#include <zcmd>
#include <sscanf2>

#define HOST 	"127.0.0.1"
#define USER 	"root"
#define PWD 	""	
#define DB 		"sampserver"

#define BCRYPT_COST		12

new MySQL: Conn;
new vehicleActive[MAX_PLAYERS];
new PlayerText:SpeedoCarInfo[MAX_PLAYERS] = {PlayerText:INVALID_TEXT_DRAW, ...};
new bool:SpeedoShown[MAX_PLAYERS] = {false, ...};
new SpeedoStatusTimer = -1;

enum pInfo {
	pIP[16],
	pID,
	pScore,
	pKills,
	pDeaths,
	pMoney,
	pAdminLevel,
	Password[BCRYPT_HASH_LENGTH],
	bool:pLoggedIn
};
new PlayerInfo[MAX_PLAYERS][pInfo];

new VehicleNames[212][] = {
	"Landstalker","Bravura","Buffalo","Linerunner","Pereniel","Sentinel","Dumper","Firetruck","Trashmaster","Stretch","Manana","Infernus",
	"Voodoo","Pony","Mule","Cheetah","Ambulance","Leviathan","Moonbeam","Esperanto","Taxi","Washington","Bobcat","Mr Whoopee","BF Injection",
	"Hunter","Premier","Enforcer","Securicar","Banshee","Predator","Bus","Rhino","Barracks","Hotknife","Trailer","Previon","Coach","Cabbie",
	"Stallion","Rumpo","RC Bandit","Romero","Packer","Monster","Admiral","Squalo","Seasparrow","Pizzaboy","Tram","Trailer","Turismo","Speeder",
	"Reefer","Tropic","Flatbed","Yankee","Caddy","Solair","Berkley's RC Van","Skimmer","PCJ-600","Faggio","Freeway","RC Baron","RC Raider",
	"Glendale","Oceanic","Sanchez","Sparrow","Patriot","Quad","Coastguard","Dinghy","Hermes","Sabre","Rustler","ZR 350","Walton","Regina",
	"Comet","BMX","Burrito","Camper","Marquis","Baggage","Dozer","Maverick","News Chopper","Rancher","FBI Rancher","Virgo","Greenwood",
	"Jetmax","Hotring","Sandking","Blista Compact","Police Maverick","Boxville","Benson","Mesa","RC Goblin","Hotring Racer A","Hotring Racer B",
	"Bloodring Banger","Rancher","Super GT","Elegant","Journey","Bike","Mountain Bike","Beagle","Cropdust","Stunt","Tanker","RoadTrain",
	"Nebula","Majestic","Buccaneer","Shamal","Hydra","FCR-900","NRG-500","HPV1000","Cement Truck","Tow Truck","Fortune","Cadrona","FBI Truck",
	"Willard","Forklift","Tractor","Combine","Feltzer","Remington","Slamvan","Blade","Freight","Streak","Vortex","Vincent","Bullet","Clover",
	"Sadler","Firetruck","Hustler","Intruder","Primo","Cargobob","Tampa","Sunrise","Merit","Utility","Nevada","Yosemite","Windsor","Monster A",
	"Monster B","Uranus","Jester","Sultan","Stratum","Elegy","Raindance","RC Tiger","Flash","Tahoma","Savanna","Bandito","Freight","Trailer",
	"Kart","Mower","Duneride","Sweeper","Broadway","Tornado","AT-400","DFT-30","Huntley","Stafford","BF-400","Newsvan","Tug","Trailer A","Emperor",
	"Wayfarer","Euros","Hotdog","Club","Trailer B","Trailer C","Andromada","Dodo","RC Cam","Launch","Police Car (LSPD)","Police Car (SFPD)",
	"Police Car (LVPD)","Police Ranger","Picador","S.W.A.T. Van","Alpha","Phoenix","Glendale","Sadler","Luggage Trailer A","Luggage Trailer B",
	"Stair Trailer","Boxville","Farm Plow","Utility Trailer"
};

MySQL_register(playerid, pwdString[]) {
	new query[255];
	format(query, sizeof(query), "INSERT INTO users(nick, score, kills, deaths, money, adminlevel, pwd) VALUES('%s', 100, 0, 0, 10000, 0, '%s')", getName(playerid), pwdString);
	mysql_query(Conn, query, true);
	SendClientMessage(playerid, -1, "| INFO | {00ff00}Conta registrada com sucesso!");
	ShowPlayerDialog(playerid, 1501, DIALOG_STYLE_PASSWORD, "{ff0000} Conta", " Bem-vindo!\n\n {ffffff}Status da Conta: {12d800}Registrada\n\n {ffffff}Entre com sua senha abaixo:", "Login", "Sair");
	return 1;
}

createVehicleForPlayer(playerid, modelID) {
	if(modelID == INVALID_VEHICLE_ID) return INVALID_VEHICLE_ID;
	if(vehicleActive[playerid] != 0) {
		DestroyVehicle(vehicleActive[playerid]);
		vehicleActive[playerid] = 0;
	}
	new Float:X, Float:Y, Float:Z, Float:A;
	GetPlayerPos(playerid, X, Y, Z);
	GetPlayerFacingAngle(playerid, A);
	vehicleActive[playerid] = CreateVehicle(modelID, X, Y, Z+1, A, -1, -1, -1);
	LinkVehicleToInterior(vehicleActive[playerid], GetPlayerInterior(playerid));
	SetVehicleVirtualWorld(vehicleActive[playerid], GetPlayerVirtualWorld(playerid));
	PutPlayerInVehicle(playerid, vehicleActive[playerid], 0);
	return 1;
}

getVehicleIDByName(vName[]) {
	for(new i; i < 211; i++) if(strfind(VehicleNames[i], vName, true) != -1) return i + 400;
	return INVALID_VEHICLE_ID;
}

getVehicleSpeed(vehicleid) {
	new Float:vX, Float:vY, Float:vZ, vel;
	GetVehicleVelocity(vehicleid, vX, vY, vZ);
	vel = floatround( floatsqroot(vX*vX + vY*vY + vZ*vZ) * 180 );
	return vel;
}

forward SpeedoStatus();
public SpeedoStatus() {
	for(new i; i < MAX_PLAYERS; i++) {
		if(IsPlayerConnected(i)) {
			if(GetPlayerState(i) == PLAYER_STATE_DRIVER) {
				if(!SpeedoShown[i]) {
					PlayerTextDrawShow(i, SpeedoCarInfo[i]);
					SpeedoShown[i] = true;
				}
				new string[10];
				format(string, sizeof(string), "%i KM/H", getVehicleSpeed(GetPlayerVehicleID(i)) );
				PlayerTextDrawSetString(i, SpeedoCarInfo[i], string);
			}
			else {
				if(SpeedoShown[i]) {
					PlayerTextDrawHide(i, SpeedoCarInfo[i]);
					SpeedoShown[i] = false;
				}
			}
		}
	}
}

teleportPlayer(playerid, interiorid, virtualworldid, Float:fX, Float:fY, Float:fZ, Float:fA) {
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) {
		LinkVehicleToInterior(GetPlayerVehicleID(playerid), interiorid);
		SetVehicleVirtualWorld(GetPlayerVehicleID(playerid), virtualworldid);
		SetVehiclePos(GetPlayerVehicleID(playerid), fX, fY, fZ+5);
		SetVehicleZAngle(GetPlayerVehicleID(playerid), fA);
		SetCameraBehindPlayer(playerid);
	}
	else {
		SetPlayerInterior(playerid, interiorid);
		SetPlayerVirtualWorld(playerid, virtualworldid);
		SetPlayerPos(playerid, fX, fY, fZ);
		SetPlayerFacingAngle(playerid, fA);
		SetCameraBehindPlayer(playerid);
	}
	return 1;
}

getName(playerid) {
	new pname[MAX_PLAYER_NAME];
	GetPlayerName(playerid, pname, sizeof(pname));
	return pname;
}

getPlayerAdminLevel(playerid) {
	return PlayerInfo[playerid][pAdminLevel];
}

main()
{
	print("\n----------------------------------");
	print("Aviao Brutal created by Mr_Robott");
	print("----------------------------------\n");
}

public OnGameModeInit()
{
	Conn = mysql_connect(HOST, USER, PWD, DB);
	if(mysql_errno(Conn) != 0) {
		new errorStr[255];
		mysql_error(errorStr, sizeof(errorStr), Conn);
		printf("[SERVER] Database connection failure: %s", errorStr);
	} 
	else {
		print("[SERVER] Successful database connection!");
	}

	for(new i = 1; i < 311; i++) AddPlayerClass(i,1958.3783,1343.1572,15.3746,270.1425,24,0,300,0,0,0);
	UsePlayerPedAnims();
	SetGameModeText("4FUN");

	SpeedoStatusTimer = SetTimer("SpeedoStatus", 50, 1);

	return 1;
}

public OnGameModeExit()
{
	mysql_close(Conn);

	KillTimer(SpeedoStatusTimer);
	SpeedoStatusTimer = -1;
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	if(PlayerInfo[playerid][pLoggedIn] != true) {
		TogglePlayerSpectating(playerid, true);
		TogglePlayerSpectating(playerid, false);
		return 0;
	}
	SetPlayerVirtualWorld(playerid,1);
	SetPlayerInterior(playerid, 14);
	SetPlayerPos(playerid,258.4893,-41.4008,1002.0234);
	SetPlayerFacingAngle(playerid, -270.0);
	SetPlayerCameraPos(playerid,256.0815,-43.0475,1004.0234);
	SetPlayerCameraLookAt(playerid,258.4893,-41.4008,1002.0234);
	return 1;
}

public OnPlayerConnect(playerid)
{
	new query[255], string[64];
	PlayerInfo[playerid][pLoggedIn] = false;
	PlayerInfo[playerid][Password] = 0;
	PlayerInfo[playerid][pKills] = 0;
	PlayerInfo[playerid][pDeaths] = 0;
	PlayerInfo[playerid][pMoney] = 0;
	PlayerInfo[playerid][pAdminLevel] = 0;

	mysql_format(Conn, query, sizeof(query), "SELECT * FROM `users` WHERE `nick` = '%s'", getName(playerid));
	mysql_tquery(Conn, query, "CheckAccount", "d", playerid);

	format(string, sizeof(string), "** %s Joined the server", getName(playerid));
	SendClientMessageToAll(0xc1c1c1AA, string);

	SpeedoCarInfo[playerid] = CreatePlayerTextDraw(playerid, 87.0, 310.0, "_");
	PlayerTextDrawBackgroundColor(playerid, SpeedoCarInfo[playerid], 0x000000ff);
	PlayerTextDrawAlignment(playerid, SpeedoCarInfo[playerid],2);
	PlayerTextDrawFont(playerid, SpeedoCarInfo[playerid], 1);
	PlayerTextDrawLetterSize(playerid, SpeedoCarInfo[playerid], 0.5, 2.0);
	PlayerTextDrawColor(playerid, SpeedoCarInfo[playerid], 0xffffffff);
	PlayerTextDrawSetOutline(playerid, SpeedoCarInfo[playerid], 1);
	PlayerTextDrawSetProportional(playerid, SpeedoCarInfo[playerid], 1);
	PlayerTextDrawSetShadow(playerid, SpeedoCarInfo[playerid], 1);
	SpeedoShown[playerid] = false;

	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	new query[255], string[64];
	mysql_format(Conn, query, sizeof(query), "UPDATE `users` SET `score` = '%i', `kills` = '%i', `deaths` = '%i', `money` = '%i', `adminlevel` = '%i' WHERE `id` = '%i'", GetPlayerScore(playerid), PlayerInfo[playerid][pKills], PlayerInfo[playerid][pDeaths], GetPlayerMoney(playerid), getPlayerAdminLevel(playerid), PlayerInfo[playerid][pID]);
	mysql_query(Conn, query);

	format(string, sizeof(string), "** %s Left the server", getName(playerid));
	SendClientMessageToAll(0xc1c1c1AA, string);

	PlayerTextDrawDestroy(playerid, SpeedoCarInfo[playerid]);
	SpeedoCarInfo[playerid] = PlayerText:INVALID_TEXT_DRAW;
	SpeedoShown[playerid] = false;

	return 1;
}

public OnPlayerSpawn(playerid)
{
	SetPlayerInterior(playerid, 0);
	SetPlayerVirtualWorld(playerid,0);

	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	if(killerid != INVALID_PLAYER_ID) {
		PlayerInfo[killerid][pKills]++;
		SetPlayerScore(killerid, GetPlayerScore(killerid) + 5);
	}
	PlayerInfo[playerid][pDeaths]++;
	SetPlayerScore(playerid, GetPlayerScore(playerid) - 10);

	SendDeathMessage(killerid,playerid,reason);
	GameTextForPlayer(playerid, "Wasted", 5000, 2);
	return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	if(issuerid != INVALID_PLAYER_ID && weaponid != 0 && bodypart == 9) {
		SetPlayerHealth(playerid, 0.0);
	}
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if (newstate == PLAYER_STATE_DRIVER && oldstate != PLAYER_STATE_DRIVER) {
		new str[24];
		format(str, sizeof(str), "~g~%s", VehicleNames[GetVehicleModel( GetPlayerVehicleID(playerid) ) -400 ]);
		GameTextForPlayer(playerid, str, 6000, 1);
	}

	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	ChangeVehicleColor(GetPlayerVehicleID(playerid), -1, -1);
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	if(PlayerInfo[playerid][pLoggedIn] == true) {
		new string[255], Float:KD;
		KD = floatdiv(PlayerInfo[clickedplayerid][pKills], PlayerInfo[clickedplayerid][pDeaths]);
		GetPlayerIp(clickedplayerid, PlayerInfo[clickedplayerid][pIP], 16);
		format(string, sizeof(string), "{ffffff}Player:\t\t%s\nKills:\t\t%i\nDeaths:\t\t%i\nK/D:\t\t%.1f\nScore:\t\t%i\nMoney:\t\t$%i\nPing:\t\t%ims\nIP:\t\t%s", 
		getName(clickedplayerid), PlayerInfo[clickedplayerid][pKills], PlayerInfo[clickedplayerid][pDeaths], KD, GetPlayerScore(clickedplayerid), 
		GetPlayerMoney(clickedplayerid), GetPlayerPing(clickedplayerid), PlayerInfo[clickedplayerid][pIP]);
		ShowPlayerDialog(playerid, 0, DIALOG_STYLE_MSGBOX, "Estatisticas", string, "Fechar", "");
	}
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch (dialogid) {	
		//login dialog
		case 1501: {
			if(response) {
				new query[255], pwd[BCRYPT_HASH_LENGTH];
				mysql_format(Conn, query, sizeof(query), "SELECT `pwd` FROM `users` WHERE `nick` = '%e'", getName(playerid));
				mysql_query(Conn, query);
				cache_get_value_name(0, "pwd", pwd, BCRYPT_HASH_LENGTH);
				bcrypt_check(inputtext, pwd, "OnPasswordChecked", "d", playerid);
			}
			else {
				Kick(playerid);
			}
		}

		//register dialog
		case 1500: {
			if(response) {
				if(strlen(inputtext)) {
					format(PlayerInfo[playerid][Password], BCRYPT_HASH_LENGTH, "%s", inputtext);
					ShowPlayerDialog(playerid, 1502, DIALOG_STYLE_PASSWORD, "{ff0000} Registrar Conta", "{ffffff}Repita sua senha:", "Confirmar", "Voltar");
				}
				else {
					ShowPlayerDialog(playerid, 1500, DIALOG_STYLE_PASSWORD, "{ff0000} Registrar Conta", " Bem-vindo!\n\n {ffffff}Status da Conta: {ff0000}Nao registrado\n\n {ff0000}Voce deve informar uma senha para se registrar!", "Registrar", "Sair");
				}
			}
			else {
				Kick(playerid);
			}
		}

		//register repeat password dialog
		case 1502: {
			if(response) {
				if(strlen(inputtext)) {
					if(strcmp(PlayerInfo[playerid][Password], inputtext, false) == 0) {
						bcrypt_hash(inputtext, BCRYPT_COST, "OnPasswordHashed", "d", playerid);
					}
					else {
						ShowPlayerDialog(playerid, 1500, DIALOG_STYLE_PASSWORD, "{ff0000} Registrar Conta", " Bem-vindo!\n\n {ffffff}Status da Conta: {ff0000}Nao registrado\n\n {ff0000}Senhas nao coincidem!", "Registrar", "Sair");
					}
				}
				else {
					ShowPlayerDialog(playerid, 1500, DIALOG_STYLE_PASSWORD, "{ff0000} Registrar Conta", " Bem-vindo!\n\n {ffffff}Status da Conta: {ff0000}Nao registrado\n\n {ff0000}Senhas nao coincidem!", "Registrar", "Sair");
				}
			}
			else {
				ShowPlayerDialog(playerid, 1500, DIALOG_STYLE_PASSWORD, "{ff0000} Registrar Conta", " Bem-vindo!\n\n {ffffff}Status da Conta: {ff0000}Nao registrado\n\n {ffffff}Registre uma senha:", "Registrar", "Sair");
			}
		}
	}

	return 1;
}

forward CheckAccount(playerid);
public CheckAccount(playerid)
{
	if(cache_num_rows()){
		ShowPlayerDialog(playerid, 1501, DIALOG_STYLE_PASSWORD, "{ff0000} Conta", " Bem-vindo!\n\n {ffffff}Status da Conta: {12d800}Registrada\n\n {ffffff}Entre com sua senha abaixo:", "Login", "Sair");
	}
	else {
		ShowPlayerDialog(playerid, 1500, DIALOG_STYLE_PASSWORD, "{ff0000} Registrar Conta", " Bem-vindo!\n\n {ffffff}Status da Conta: {ff0000}Nao Registrada\n\n {ffffff}Informe uma senha para se registrar:", "Login", "Sair");
	}
	return 1;
}

forward OnPasswordHashed(playerid);
public OnPasswordHashed(playerid)
{
	new hash[BCRYPT_HASH_LENGTH];
	bcrypt_get_hash(hash);
	MySQL_register(playerid, hash);
	return 1;
}

forward OnPasswordChecked(playerid);
public OnPasswordChecked(playerid)
{
	new bool:match = bcrypt_is_equal();
	if(match == true) {
		new query[300];
		mysql_format(Conn, query, sizeof(query), "SELECT * FROM `users` WHERE `nick` = '%e'", getName(playerid));
		mysql_tquery(Conn, query, "OnPlayerLoad", "d", playerid);
	}
	else {
		ShowPlayerDialog(playerid, 1501, DIALOG_STYLE_PASSWORD, "Conta", "{ff0000}Senha incorreta!", "Login", "Sair");
	}
	return 1;
}

forward OnPlayerLoad(playerid);
public OnPlayerLoad(playerid)
{
	SendClientMessage(playerid, -1, "| INFO | {00ff00}Conta logada com sucesso");
	PlayerInfo[playerid][pLoggedIn] = true;
	SetPlayerVirtualWorld(playerid,1);
	SetPlayerInterior(playerid, 14);
	SetPlayerPos(playerid,258.4893,-41.4008,1002.0234);
	SetPlayerFacingAngle(playerid, -270.0);
	SetPlayerCameraPos(playerid,256.0815,-43.0475,1004.0234);
	SetPlayerCameraLookAt(playerid,258.4893,-41.4008,1002.0234);

	cache_get_value_name_int(0, "id", PlayerInfo[playerid][pID]);
	cache_get_value_name_int(0, "score", PlayerInfo[playerid][pScore]);
	cache_get_value_name_int(0, "money", PlayerInfo[playerid][pMoney]);
	cache_get_value_name_int(0, "kills", PlayerInfo[playerid][pKills]);
	cache_get_value_name_int(0, "deaths", PlayerInfo[playerid][pDeaths]);
	cache_get_value_name_int(0, "adminlevel", PlayerInfo[playerid][pAdminLevel]);

	GivePlayerMoney(playerid, PlayerInfo[playerid][pMoney]);
	SetPlayerScore(playerid, PlayerInfo[playerid][pScore]);

	return 1;
}

//---------------------------------------COMANDS------------------------------------------------//

public OnPlayerCommandReceived(playerid, cmdtext[]) 
{
	return 1;
}

public OnPlayerCommandPerformed(playerid, cmdtext[], success) 
{
	if(!success) {
		SendClientMessage(playerid, 0xff0000AA, "| ERRO | Comando desconhecido");
	}
	return 1;
}

CMD:ls(playerid) {
	GameTextForPlayer(playerid, "LOS SANTOS", 3000, 6);
	teleportPlayer(playerid, 0, 0, 2500.9519,-1668.9618,13.3554, 81.020889);
	return 1;
}

CMD:sf(playerid) {
	GameTextForPlayer(playerid, "SAN FIERRO", 3000, 6);
	teleportPlayer(playerid, 0, 0, -1994.1210,108.9522,27.5391, 87.9631);
	return 1;
}

CMD:lv(playerid) {
	GameTextForPlayer(playerid, "LAS VENTURAS", 3000, 6);
	teleportPlayer(playerid, 0, 0, 2022.7225,1343.2141,10.8203, 270.3270);
	return 1;
}

CMD:v(playerid, params[]) {
	new VehID;
	if(sscanf(params, "i", VehID)) return SendClientMessage(playerid, 0xff0000AA, "| ERRO | Uso: /v [id do veiculo]");
	createVehicleForPlayer(playerid, VehID);
	return 1;
}

CMD:vm(playerid, params[]) {
	new vehicleName[24];
	if(sscanf(params, "s[24]", vehicleName)) return SendClientMessage(playerid, 0xff0000FF, "| ERRO | Uso: /vm [nome do veiculo]");
	if(getVehicleIDByName(vehicleName) == INVALID_VEHICLE_ID) return SendClientMessage(playerid, 0xff0000AA, "| ERRO | Nome invalido");
	createVehicleForPlayer(playerid, getVehicleIDByName(vehicleName));
	return 1;
}

CMD:clearvehicles(playerid) {
	for(new i; i < MAX_PLAYERS; i++) {
		DestroyVehicle(vehicleActive[i]);
	}
	return 1;
}

CMD:kill(playerid) {
	SetPlayerHealth(playerid, 0.0);
	SetPlayerArmour(playerid, 0.0);
	return 1;
}
