#include <a_samp>
#include <zcmd>
#include <sscanf>
#include <dof2>
#include <dudb>
#include <dutils>

#pragma unused ret_memcpy

#define DialogVehicle 1
#define Avioes 2
#define Helicopteros 3
#define Motos 4
#define Conversiveis 5
#define Industriais 6
#define Lowriders 7
#define OffRoads 8
#define Serviços_Publicos 9
#define Saloons 10
#define Esportivos 11
#define Peruas 12
#define Barcos 13
#define Unicos 14
#define Veiculos_RC 15
#define Trailers 16
#define Register 17
#define Register2 18
#define Login 19
#define Login2 20
#define DialogPaint 21
#define DialogWeapons 22
#define DialogAdmin 23
#define DialogPistol 24
#define DialogSMG 25
#define DialogShotgun 26
#define DialogAssault 27
#define DialogRifles 28
#define DialogExplosivos 29
#define DialogPesadas 30
#define DialogBrancas 31
#define DialogOthers 32

#define COR_ERRO 0xff352bFF
#define COR_VERMELHO 0xff0000ff
#define COR_VERDE 0x12d800ff
#define COR_ADM 0x168fadFF
#define COR_AMARELO 0xffbf00ff
#define COR_VERDEAZUL 0x168fadff
#define COR_PM 0xffb200ff
#define COR_PM2 0xdbb869ff
#define COR_BRANCO 0xffffffff

#define PATH "/Players/%s.ini"
#define WORD "gtasanandreas"

enum pInfo
{
    pAdmin,
    pMoney,
    pScore,
    pKills,
    pDeaths
}

new PlayerInfo[MAX_PLAYERS][pInfo];
new gPlayerLogged[MAX_PLAYERS];
new veiculo[MAX_PLAYERS];
new bool:Freeze[MAX_PLAYERS];

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

new playerColors[500] = {
0xFF8C13AA,0xC715FFAA,0x20B2AAAA,0xDC143CAA,0x6495EDAA,0xf0e68cAA,0x778899AA,0xFF1493AA,0xF4A460AA,0xEE82EEAA,0xFFD720AA,
0x8b4513AA,0x4949A0AA,0x148b8bAA,0x14ff7fAA,0x556b2fAA,0x0FD9FAAA,0x10DC29AA,0x534081AA,0x0495CDAA,0xEF6CE8AA,0xBD34DAAA,
0x247C1BAA,0x0C8E5DAA,0x635B03AA,0xCB7ED3AA,0x65ADEBAA,0x5C1ACCAA,0xF2F853AA,0x11F891AA,0x7B39AAAA,0x53EB10AA,0x54137DAA,
0x275222AA,0xF09F5BAA,0x3D0A4FAA,0x22F767AA,0xD63034AA,0x9A6980AA,0xDFB935AA,0x3793FAAA,0x90239DAA,0xE9AB2FAA,0xAF2FF3AA,
0x057F94AA,0xB98519AA,0x388EEAAA,0x028151AA,0xA55043AA,0x0DE018AA,0x93AB1CAA,0x95BAF0AA,0x369976AA,0x18F71FAA,0x4B8987AA,
0x491B9EAA,0x829DC7AA,0xBCE635AA,0xCEA6DFAA,0x20D4ADAA,0x2D74FDAA,0x3C1C0DAA,0x12D6D4AA,0x48C000AA,0x2A51E2AA,0xE3AC12AA,
0xFC42A8AA,0x2FC827AA,0x1A30BFAA,0xB740C2AA,0x42ACF5AA,0x2FD9DEAA,0xFAFB71AA,0x05D1CDAA,0xC471BDAA,0x94436EAA,0xC1F7ECAA,
0xCE79EEAA,0xBD1EF2AA,0x93B7E4AA,0x3214AAAA,0x184D3BAA,0xAE4B99AA,0x7E49D7AA,0x4C436EAA,0xFA24CCAA,0xCE76BEAA,0xA04E0AAA,
0x9F945CAA,0xDCDE3DAA,0x10C9C5AA,0x70524DAA,0x0BE472AA,0x8A2CD7AA,0x6152C2AA,0xCF72A9AA,0xE59338AA,0xEEDC2DAA,0xD8C762AA,
0x3FE65CAA,0xFF8C13AA,0xC715FFAA,0x20B2AAAA,0xDC143CAA,0x6495EDAA,0xf0e68cAA,0x778899AA,0xFF1493AA,0xF4A460AA,0xEE82EEAA,0xFFD720AA,
0x8b4513AA,0x4949A0AA,0x148b8bAA,0x14ff7fAA,0x556b2fAA,0x0FD9FAAA,0x10DC29AA,0x534081AA,0x0495CDAA,0xEF6CE8AA,0xBD34DAAA,
0x247C1BAA,0x0C8E5DAA,0x635B03AA,0xCB7ED3AA,0x65ADEBAA,0x5C1ACCAA,0xF2F853AA,0x11F891AA,0x7B39AAAA,0x53EB10AA,0x54137DAA,
0x275222AA,0xF09F5BAA,0x3D0A4FAA,0x22F767AA,0xD63034AA,0x9A6980AA,0xDFB935AA,0x3793FAAA,0x90239DAA,0xE9AB2FAA,0xAF2FF3AA,
0x057F94AA,0xB98519AA,0x388EEAAA,0x028151AA,0xA55043AA,0x0DE018AA,0x93AB1CAA,0x95BAF0AA,0x369976AA,0x18F71FAA,0x4B8987AA,
0x491B9EAA,0x829DC7AA,0xBCE635AA,0xCEA6DFAA,0x20D4ADAA,0x2D74FDAA,0x3C1C0DAA,0x12D6D4AA,0x48C000AA,0x2A51E2AA,0xE3AC12AA,
0xFC42A8AA,0x2FC827AA,0x1A30BFAA,0xB740C2AA,0x42ACF5AA,0x2FD9DEAA,0xFAFB71AA,0x05D1CDAA,0xC471BDAA,0x94436EAA,0xC1F7ECAA,
0xCE79EEAA,0xBD1EF2AA,0x93B7E4AA,0x3214AAAA,0x184D3BAA,0xAE4B99AA,0x7E49D7AA,0x4C436EAA,0xFA24CCAA,0xCE76BEAA,0xA04E0AAA,
0x9F945CAA,0xDCDE3DAA,0x10C9C5AA,0x70524DAA,0x0BE472AA,0x8A2CD7AA,0x6152C2AA,0xCF72A9AA,0xE59338AA,0xEEDC2DAA,0xD8C762AA,
0x3FE65CAA,0xFF8C13AA,0xC715FFAA,0x20B2AAAA,0xDC143CAA,0x6495EDAA,0xf0e68cAA,0x778899AA,0xFF1493AA,0xF4A460AA,0xEE82EEAA,0xFFD720AA,
0x8b4513AA,0x4949A0AA,0x148b8bAA,0x14ff7fAA,0x556b2fAA,0x0FD9FAAA,0x10DC29AA,0x534081AA,0x0495CDAA,0xEF6CE8AA,0xBD34DAAA,
0x247C1BAA,0x0C8E5DAA,0x635B03AA,0xCB7ED3AA,0x65ADEBAA,0x5C1ACCAA,0xF2F853AA,0x11F891AA,0x7B39AAAA,0x53EB10AA,0x54137DAA,
0x275222AA,0xF09F5BAA,0x3D0A4FAA,0x22F767AA,0xD63034AA,0x9A6980AA,0xDFB935AA,0x3793FAAA,0x90239DAA,0xE9AB2FAA,0xAF2FF3AA,
0x057F94AA,0xB98519AA,0x388EEAAA,0x028151AA,0xA55043AA,0x0DE018AA,0x93AB1CAA,0x95BAF0AA,0x369976AA,0x18F71FAA,0x4B8987AA,
0x491B9EAA,0x829DC7AA,0xBCE635AA,0xCEA6DFAA,0x20D4ADAA,0x2D74FDAA,0x3C1C0DAA,0x12D6D4AA,0x48C000AA,0x2A51E2AA,0xE3AC12AA,
0xFC42A8AA,0x2FC827AA,0x1A30BFAA,0xB740C2AA,0x42ACF5AA,0x2FD9DEAA,0xFAFB71AA,0x05D1CDAA,0xC471BDAA,0x94436EAA,0xC1F7ECAA,
0xCE79EEAA,0xBD1EF2AA,0x93B7E4AA,0x3214AAAA,0x184D3BAA,0xAE4B99AA,0x7E49D7AA,0x4C436EAA,0xFA24CCAA,0xCE76BEAA,0xA04E0AAA,
0x9F945CAA,0xDCDE3DAA,0x10C9C5AA,0x70524DAA,0x0BE472AA,0x8A2CD7AA,0x6152C2AA,0xCF72A9AA,0xE59338AA,0xEEDC2DAA,0xD8C762AA,
0x3FE65CAA,0xFF8C13AA,0xC715FFAA,0x20B2AAAA,0xDC143CAA,0x6495EDAA,0xf0e68cAA,0x778899AA,0xFF1493AA,0xF4A460AA,0xEE82EEAA,0xFFD720AA,
0x8b4513AA,0x4949A0AA,0x148b8bAA,0x14ff7fAA,0x556b2fAA,0x0FD9FAAA,0x10DC29AA,0x534081AA,0x0495CDAA,0xEF6CE8AA,0xBD34DAAA,
0x247C1BAA,0x0C8E5DAA,0x635B03AA,0xCB7ED3AA,0x65ADEBAA,0x5C1ACCAA,0xF2F853AA,0x11F891AA,0x7B39AAAA,0x53EB10AA,0x54137DAA,
0x275222AA,0xF09F5BAA,0x3D0A4FAA,0x22F767AA,0xD63034AA,0x9A6980AA,0xDFB935AA,0x3793FAAA,0x90239DAA,0xE9AB2FAA,0xAF2FF3AA,
0x057F94AA,0xB98519AA,0x388EEAAA,0x028151AA,0xA55043AA,0x0DE018AA,0x93AB1CAA,0x95BAF0AA,0x369976AA,0x18F71FAA,0x4B8987AA,
0x491B9EAA,0x829DC7AA,0xBCE635AA,0xCEA6DFAA,0x20D4ADAA,0x2D74FDAA,0x3C1C0DAA,0x12D6D4AA,0x48C000AA,0x2A51E2AA,0xE3AC12AA,
0xFC42A8AA,0x2FC827AA,0x1A30BFAA,0xB740C2AA,0x42ACF5AA,0x2FD9DEAA,0xFAFB71AA,0x05D1CDAA,0xC471BDAA,0x94436EAA,0xC1F7ECAA,
0xCE79EEAA,0xBD1EF2AA,0x93B7E4AA,0x3214AAAA,0x184D3BAA,0xAE4B99AA,0x7E49D7AA,0x4C436EAA,0xFA24CCAA,0xCE76BEAA,0xA04E0AAA,
0x9F945CAA,0xDCDE3DAA,0x10C9C5AA,0x70524DAA,0x0BE472AA,0x8A2CD7AA,0x6152C2AA,0xCF72A9AA,0xE59338AA,0xEEDC2DAA,0xD8C762AA,
0x3FE65CAA,0xFF8C13AA,0xC715FFAA,0x20B2AAAA,0xDC143CAA,0x6495EDAA,0xf0e68cAA,0x778899AA,0xFF1493AA,0xF4A460AA,0xEE82EEAA,0xFFD720AA,
0x8b4513AA,0x4949A0AA,0x148b8bAA,0x14ff7fAA,0x556b2fAA,0x0FD9FAAA,0x10DC29AA,0x534081AA,0x0495CDAA,0xEF6CE8AA,0xBD34DAAA,
0x247C1BAA,0x0C8E5DAA,0x635B03AA,0xCB7ED3AA,0x65ADEBAA,0x5C1ACCAA,0xF2F853AA,0x11F891AA,0x7B39AAAA,0x53EB10AA,0x54137DAA,
0x275222AA,0xF09F5BAA,0x3D0A4FAA,0x22F767AA,0xD63034AA,0x9A6980AA,0xDFB935AA,0x3793FAAA,0x90239DAA,0xE9AB2FAA,0xAF2FF3AA,
0x057F94AA,0xB98519AA,0x388EEAAA,0x028151AA,0xA55043AA,0x0DE018AA,0x93AB1CAA,0x95BAF0AA,0x369976AA,0x18F71FAA,0x4B8987AA,
0x491B9EAA,0x829DC7AA,0xBCE635AA,0xCEA6DFAA,0x20D4ADAA,0x2D74FDAA,0x3C1C0DAA,0x12D6D4AA,0x48C000AA,0x2A51E2AA,0xE3AC12AA,
0xFC42A8AA,0x2FC827AA,0x1A30BFAA,0xB740C2AA,0x42ACF5AA,0x2FD9DEAA,0xFAFB71AA,0x05D1CDAA,0xC471BDAA,0x94436EAA,0xC1F7ECAA,
0xCE79EEAA,0xBD1EF2AA,0x93B7E4AA,0x3214AAAA,0x184D3BAA,0xAE4B99AA,0x7E49D7AA,0x4C436EAA,0xFA24CCAA,0xCE76BEAA,0xA04E0AAA,
0x9F945CAA,0xDCDE3DAA,0x10C9C5AA,0x70524DAA,0x0BE472AA,0x8A2CD7AA,0x6152C2AA,0xCF72A9AA,0xE59338AA,0xEEDC2DAA,0xD8C762AA,
0x3FE65CAA
};

stock PlaySoundForAll(soundid)
{
for(new i = 0; i < MAX_PLAYERS; i++){
if(IsPlayerConnected(i)){
PlayerPlaySound(i,soundid,0,0,0);}}
return 1;
}

stock GetPlayerNameEx(playerid)
{
new Nome[MAX_PLAYER_NAME];
GetPlayerName(playerid, Nome, sizeof(Nome));
return Nome;
}

stock GetPlayerIdFromName(playername[])
{
for(new i = 0; i <= MAX_PLAYERS; i++){
if(IsPlayerConnected(i)){
new playername2[MAX_PLAYER_NAME];
GetPlayerName(i, playername2, sizeof(playername2));
if(strcmp(playername2, playername, true, strlen(playername)) == 0){
return i;}}}
return INVALID_PLAYER_ID;
}

stock GetVehicleModelIDFromName(vname[])
{
for(new i = 0; i < 211; i++){
if ( strfind(VehicleNames[i], vname, true) != -1 )
return i + 400;}
return -1;
}

forward CriarVeiculoParaPlayer(playerid, modelo);
public CriarVeiculoParaPlayer(playerid, modelo)
{
if(veiculo[playerid] != 0){DestroyVehicle(veiculo[playerid]);veiculo[playerid] = 0;}
new Float:X, Float:Y, Float:Z, Float:A;
GetPlayerPos(playerid,X,Y,Z);
GetPlayerFacingAngle(playerid,A);
veiculo[playerid] = CreateVehicle(modelo,X,Y,Z+2,A,-1,-1,120);
PutPlayerInVehicle(playerid,veiculo[playerid],0);
LinkVehicleToInterior(veiculo[playerid], GetPlayerInterior(playerid));
SetVehicleVirtualWorld(veiculo[playerid], GetPlayerVirtualWorld(playerid));
return 1;
}

forward GetPlayerAdminLevel(playerid);
public GetPlayerAdminLevel(playerid) return PlayerInfo[playerid][pAdmin];

forward SetPlayerAdminLevel(playerid, level);
public SetPlayerAdminLevel(playerid, level) return PlayerInfo[playerid][pAdmin] = level;

main(){print("  Executing Server GameMode...");}

public OnGameModeInit()
{
SetGameModeText("FR");
for(new i=0; i < 311; i++){
AddPlayerClass(i,1958.3783,1343.1572,15.3746,270.1425,0,0,0,0,0,0);}
UsePlayerPedAnims();
EnableStuntBonusForAll(0);
return 1;
}

public OnGameModeExit()
{
DOF2_Exit();
return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
SetPlayerVirtualWorld(playerid,1);
SetPlayerInterior(playerid, 14);
SetPlayerPos(playerid,258.4893,-41.4008,1002.0234);
SetPlayerFacingAngle(playerid, 270.0);
SetPlayerCameraPos(playerid,256.0815,-43.0475,1004.0234);
SetPlayerCameraLookAt(playerid,258.4893,-41.4008,1002.0234);
return 1;
}

public OnPlayerConnect(playerid)
{
gPlayerLogged[playerid] = 0;
Freeze[playerid] = false;
new file[256], string2[128];
new rand = random(sizeof(playerColors));
format(string2,sizeof string2,"%s has joined the game",GetPlayerNameEx(playerid));
format(file, sizeof(file), PATH, GetPlayerNameEx(playerid));
if (!DOF2_FileExists(file)){
ShowPlayerDialog(playerid, Register, DIALOG_STYLE_PASSWORD, "{ff0000} Conta", " Bem-vindo!\n\n {ffffff}Status da Conta: {ff0000}Não registrado\n\n {ffffff}Informe uma senha:", "Registrar", "Sair");}
if(DOF2_FileExists(file)){
ShowPlayerDialog(playerid, Login, DIALOG_STYLE_PASSWORD, "{ff0000} Conta", " Bem-vindo!\n\n {ffffff}Status da Conta: {12d800}Registrada\n\n {ffffff}Entre com sua senha abaixo:", "Login", "Sair");}
SetPlayerColor(playerid, playerColors[rand]);
SendDeathMessage(INVALID_PLAYER_ID,playerid,200);
SendClientMessageToAll(0xB9C9BFff, string2);
return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
gPlayerLogged[playerid] = 0;
Freeze[playerid] = false;
new string2[128],file[256];
format(string2,sizeof string2,"%s has left the game",GetPlayerNameEx(playerid));
format(file, sizeof(file), PATH, GetPlayerNameEx(playerid));
if(gPlayerLogged[playerid] == 1){
if(DOF2_FileExists(file)){
DOF2_SetInt(file, "Score", PlayerInfo[playerid][pScore] = GetPlayerScore(playerid));
DOF2_SetInt(file, "Money", PlayerInfo[playerid][pMoney] = GetPlayerMoney(playerid));
DOF2_SetInt(file, "AdminLevel", PlayerInfo[playerid][pAdmin] = GetPlayerAdminLevel(playerid));
DOF2_SetInt(file, "Kills", PlayerInfo[playerid][pKills]);
DOF2_SetInt(file, "Deaths", PlayerInfo[playerid][pDeaths]);
DOF2_SaveFile();}}
SendDeathMessage(INVALID_PLAYER_ID,playerid,201);
SendClientMessageToAll(0xB9C9BFff, string2);
return 1;
}

public OnPlayerSpawn(playerid)
{
SetPlayerVirtualWorld(playerid,0);
SetPlayerInterior(playerid,0);
return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
PlayerInfo[playerid][pDeaths] ++;
PlayerInfo[killerid][pKills]  ++;
SendDeathMessage(killerid,playerid,reason);
GameTextForPlayer(playerid, "Wasted", 5000, 2);
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
if(GetPlayerAdminLevel(playerid) == 3){
new string[128];
format(string, sizeof(string), "%s{ffffff}: [{b21818}DONO{ffffff}] [%i] %s ",GetPlayerNameEx(playerid), GetPlayerIdFromName(GetPlayerNameEx(playerid)), text);
SendClientMessageToAll(GetPlayerColor(playerid), string);
return 0;}
if(GetPlayerAdminLevel(playerid) == 2){
new string[128];
format(string, sizeof(string), "%s{ffffff}: [{ff0000}ADM{ffffff}] [%i] %s ",GetPlayerNameEx(playerid), GetPlayerIdFromName(GetPlayerNameEx(playerid)), text);
SendClientMessageToAll(GetPlayerColor(playerid), string);
return 0;}
if(GetPlayerAdminLevel(playerid) == 1){
new string[128];
format(string, sizeof(string), "%s{ffffff}: [{00bfff}MOD{ffffff}] [%i] %s ",GetPlayerNameEx(playerid), GetPlayerIdFromName(GetPlayerNameEx(playerid)), text);
SendClientMessageToAll(GetPlayerColor(playerid), string);
return 0;}
if(GetPlayerAdminLevel(playerid) == 0){
new string[128];
format(string, sizeof(string), "%s{ffffff}: [%i] %s ",GetPlayerNameEx(playerid), GetPlayerIdFromName(GetPlayerNameEx(playerid)), text);
SendClientMessageToAll(GetPlayerColor(playerid), string);
return 0;}
return 1;
}

//------------------------------COMANDS---------------------------------------//
CMD:ls(playerid)
{
SetPlayerInterior(playerid,0);
SetPlayerVirtualWorld(playerid,0);
GameTextForPlayer(playerid,"LOS SANTOS",6000,6);
if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
SetVehicleVirtualWorld(GetPlayerVehicleID(playerid), 0);
LinkVehicleToInterior(GetPlayerVehicleID(playerid), 0);
SetVehiclePos(GetPlayerVehicleID(playerid),2500.9519,-1668.9618,13.3554+10);
SetVehicleZAngle(GetPlayerVehicleID(playerid),81.020889);
SetCameraBehindPlayer(playerid);}else{
SetPlayerPos(playerid,2500.9519,-1668.9618,13.3554);
SetPlayerFacingAngle(playerid,81.020889);
SetCameraBehindPlayer(playerid);}
return 1;
}

CMD:sf(playerid)
{
SetPlayerVirtualWorld(playerid,0);
SetPlayerInterior(playerid,0);
GameTextForPlayer(playerid,"SAN FIERRO",6000,6);
if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
SetVehicleVirtualWorld(GetPlayerVehicleID(playerid), 0);
LinkVehicleToInterior(GetPlayerVehicleID(playerid), 0);
SetVehiclePos(GetPlayerVehicleID(playerid),-1994.1210,108.9522,27.5391+10);
SetVehicleZAngle(GetPlayerVehicleID(playerid),87.9631);
SetCameraBehindPlayer(playerid);}else{
SetPlayerPos(playerid,-1994.1210,108.9522,27.5391);
SetPlayerFacingAngle(playerid,87.9631);
SetCameraBehindPlayer(playerid);}
return 1;
}

CMD:lv(playerid)
{
SetPlayerVirtualWorld(playerid,0);
SetPlayerInterior(playerid,0);
if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
SetVehicleVirtualWorld(GetPlayerVehicleID(playerid), 0);
LinkVehicleToInterior(GetPlayerVehicleID(playerid), 0);
SetVehiclePos(GetPlayerVehicleID(playerid),2022.7225,1343.2141,20.8203+10);
SetVehicleZAngle(GetPlayerVehicleID(playerid),270.3270);
SetCameraBehindPlayer(playerid);}else{
SetPlayerPos(playerid,2022.7225,1343.2141,10.8203);
SetPlayerFacingAngle(playerid,270.3270);
SetCameraBehindPlayer(playerid);}
return 1;
}

CMD:jetpack(playerid)
{
if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid, COR_ERRO, "| ERRO | Você está em um veiculo");
if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_USEJETPACK)return SendClientMessage(playerid, COR_ERRO, "| ERRO | Voce já está usando um jetpack");
PlayerPlaySound(playerid,1058,0.0,0.0,0.0);
GameTextForPlayer(playerid,"~g~JETPACK~g~",3000,6);
SetPlayerSpecialAction(playerid, 2);
return 1;
}

CMD:kill(playerid)
{
SetPlayerHealth(playerid, 0.0);
SetPlayerArmour(playerid, 0.0);
return 1;
}

CMD:armas(playerid)
{
ShowPlayerDialog(playerid,DialogWeapons,DIALOG_STYLE_LIST,"Armas","1\tPistolas\n2\tSMGs\n3\tShotguns\n4\tAssault\n5\tRifles\n6\tExplosivos\n6\tPesadas\n7\tBrancas\n8\tOutros","Selecionar","Sair");
return 1;
}

CMD:v(playerid)
{
if(IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid, COR_ERRO, "| ERRO | Voce já está em um veiculo!");
new allvehicles[] = "1\tAvioes\n2\tHelicopteros\n3\tMotos\n4\tConversiveis\n5\tIndustriais\n6\tLowriders\n7\tOffRoad\n8\tServiços Publicos\n9\tSaloons\n10\tEsportivos\n11\tPeruas\n12\tBarcos\n13\tUnicos\n14\tVeiculos RC\n15\tTrailers";
ShowPlayerDialog(playerid,DialogVehicle,DIALOG_STYLE_LIST,"{ff0000} Veiculos",allvehicles,"Selecionar","Sair");
return 1;
}

CMD:cs(playerid)
{
return cmd_v(playerid);
}

CMD:reparar(playerid)
{
if(!IsPlayerInAnyVehicle(playerid))return SendClientMessage(playerid, COR_ERRO, "| ERRO | Voce Precisa estar em um veiculo!");
if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)return SendClientMessage(playerid, COR_ERRO, "| ERRO | Voce Precisa estar dirigindo!");
PlayerPlaySound(playerid, 1133, 0.0, 0.0, 10.0);
RepairVehicle(GetPlayerVehicleID(playerid));
return 1;
}

CMD:f(playerid)
{
if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)return 0;
new Float: X, Float: Y, Float: Z, Float: A;
GetPlayerPos(playerid,X,Y,Z);
GetVehicleZAngle(GetPlayerVehicleID(playerid),A);
SetVehiclePos(GetPlayerVehicleID(playerid),X,Y,Z+2);
SetVehicleZAngle(GetPlayerVehicleID(playerid),A);
return 1;
}

CMD:pm(playerid, params[])
{
new PlayerID, string[256], string2[256], Mensagem[256];
if(sscanf(params, "us", PlayerID, Mensagem))return SendClientMessage(playerid, COR_ERRO, "| ERRO | Digite: /pm [id] [mensagem]");
if(PlayerID == playerid)return SendClientMessage(playerid, COR_ERRO, "| ERRO | Voce não pode mandar uma mensagem para você mesmo");
if(!IsPlayerConnected(PlayerID))return SendClientMessage(playerid, COR_ERRO,"| ERRO | Player invalido!");
format(string,sizeof(string), "| PM | Mensagem recebida de %s[%d] ( %s )",GetPlayerNameEx(playerid),playerid,Mensagem);
format(string2,sizeof(string2), "| PM | Mensagem enviada para o %s[%d] ( %s )",GetPlayerNameEx(PlayerID),PlayerID,Mensagem);
PlayerPlaySound(PlayerID,1057,0.0,0.0,0.0);
GameTextForPlayer(PlayerID, "~b~~h~~h~~h~PM RECEBIDA", 3000, 1);
SendClientMessage(PlayerID,COR_PM,string);
SendClientMessage(playerid,COR_PM2,string2);
return 1;
}

CMD:tempo(playerid, params[])
{
if(GetPlayerAdminLevel(playerid) >= 1){
new string[100], WeatherID;
if(sscanf(params, "i", WeatherID))return SendClientMessage( playerid, COR_ERRO, "| ERRO | Digite: /tempo [weatherid]");
format(string,sizeof string,"| CLIMA | O clima foi alterado para o ID: %d", WeatherID);
SendClientMessageToAll(COR_AMARELO,string);
SetWeather(WeatherID);}
else return SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem permissão!");
return 1;
}

CMD:clear(playerid)
{
if(GetPlayerAdminLevel(playerid) >= 1){
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
SendClientMessageToAll( -1, " ");
new string[100], string2[100];
if(GetPlayerAdminLevel(playerid) == 1){
format(string,sizeof string,"| ADMIN | O(A) Moderador(a) %s limpou o chat",GetPlayerNameEx(playerid));
SendClientMessageToAll(0x15ff00ff,string);}
if(GetPlayerAdminLevel(playerid) >= 2){
format(string2,sizeof string2,"| ADMIN | O(A) Adminitrador(a) %s limpou o chat",GetPlayerNameEx(playerid));
SendClientMessageToAll(0x15ff00ff,string2);}}
else return SendClientMessage(playerid, COR_ERRO, "| ERRO | Voce não tem permissão!");
return 1;
}

CMD:anuncio(playerid, params[])
{
if(GetPlayerAdminLevel(playerid) >= 1){
if (!strlen(params))return SendClientMessage(playerid,COR_ERRO,"| ERRO | Digite: /anuncio [mensagem]");
PlaySoundForAll(1057);
SendClientMessage(playerid, -1, "{ffffff}| INFO |{15ff00} Voce fez um anuncio");
GameTextForAll(params,8000,3);}
else return SendClientMessage(playerid, COR_ERRO, "| ERRO | Voce não tem permissão!");
return 1;
}

CMD:kick(playerid, params[])
{
if(GetPlayerAdminLevel(playerid) >= 2){
new PlayerIDKickado, Motivo[50], Mensagem[256], Mensagem2[256];
if(sscanf(params, "is", PlayerIDKickado, Motivo))return SendClientMessage(playerid, COR_ERRO, "| ERRO | Digite: /kick [id] [motivo]");
if(PlayerIDKickado == playerid)return SendClientMessage(playerid, COR_ERRO, "| ERRO | Voce não pode kickar você mesmo");
if(!IsPlayerConnected(PlayerIDKickado))return SendClientMessage(playerid, COR_ERRO,"| ERRO | Player invalido");
format(Mensagem,sizeof(Mensagem), "| ADMIN | O(A) Administrador(a) %s kickou o jogador(a) %s ( Motivo: %s )",GetPlayerNameEx(playerid), GetPlayerNameEx(PlayerIDKickado), Motivo);
SendClientMessageToAll(0xff0000ff,Mensagem);
format(Mensagem2,sizeof(Mensagem2), "| ADMIN | Voce foi kickado! ( Motivo: %s )",Motivo);
SendClientMessage(PlayerIDKickado, 0xff0000ff, Mensagem2);
Kick(PlayerIDKickado);}
else return SendClientMessage(playerid, COR_ERRO, "| ERRO | Voce não tem permissão!");
return 1;
}

CMD:ban(playerid, params[])
{
if(GetPlayerAdminLevel(playerid) == 3){
new PlayerIDBanido, Motivo[50], Mensagem[256], Mensagem2[256];
if(sscanf(params, "is", PlayerIDBanido, Motivo))return SendClientMessage(playerid, COR_ERRO, "| ERRO | Digite: /ban [id] [motivo]");
if(PlayerIDBanido == playerid)return SendClientMessage(playerid, COR_ERRO, "| ERRO | Voce não pode banir você mesmo");
if(!IsPlayerConnected(PlayerIDBanido))return SendClientMessage(playerid, COR_ERRO,"| ERRO | Player invalido!");
format(Mensagem,sizeof(Mensagem), "| ADMIN | O(A) Administrador(a) %s baniu o jogador(a) %s ( Motivo: %s )",GetPlayerNameEx(playerid), GetPlayerNameEx(PlayerIDBanido), Motivo);
SendClientMessageToAll(0xff0000ff,Mensagem);
format(Mensagem2,sizeof(Mensagem2), "| ADMIN | Voce foi Banido! ( Motivo: %s )",Motivo);
SendClientMessage(PlayerIDBanido, 0xff0000ff, Mensagem2);
Ban(PlayerIDBanido);}
else return SendClientMessage(playerid, COR_ERRO, "| ERRO | Voce não tem permissão");
return 1;
}

CMD:setadmin(playerid,params[])
{
if(GetPlayerAdminLevel(playerid) != 3)return SendClientMessage(playerid, COR_ERRO, "| ERRO | Voce não tem permissão");
new ID,levels,string[256],string2[256],string3[256],string4[256];
if(sscanf(params,"ui",ID,levels))return SendClientMessage(playerid, COR_ERRO, "| ERRO | Digite: /setadmin [id] [level]");
if(levels > 3)return SendClientMessage(playerid, COR_ERRO, "| ERRO | Level invalido [0-3]");
if(!IsPlayerConnected(ID))return SendClientMessage(playerid, COR_ERRO, "| ERRO | Player invalido");
if(GetPlayerAdminLevel(ID) == levels)return SendClientMessage(playerid, COR_ERRO, "| ERRO | Este player já possui esse level de permissão");
if(levels == 0){
format(string3,sizeof(string3),"| ADMIN | O(A) Administrador(a) %s removeu sua permissão de Admin!",GetPlayerNameEx(playerid));
format(string4,sizeof(string4),"| INFO | Você removeu a permissão de Admin de %s",GetPlayerNameEx(ID));
SendClientMessage(ID,COR_ADM,string3);
SendClientMessage(playerid,-1,string4);
SetPlayerAdminLevel(ID,levels);}else{
format(string,sizeof(string),"| AMDIN | O(A) Administrador(a) %s deu level %d de Admin para você!",GetPlayerNameEx(playerid),levels);
format(string2,sizeof(string2),"| INFO | Você deu level %d de Admin para %s",levels,GetPlayerNameEx(ID));
SendClientMessage(ID,COR_ADM,string);
SendClientMessage(playerid,-1,string2);
SetPlayerAdminLevel(ID,levels);}
return 1;
}

CMD:viraradmin(playerid)
{
if(!IsPlayerAdmin(playerid))return SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem permissão!");
ShowPlayerDialog(playerid,DialogAdmin, DIALOG_STYLE_PASSWORD, "{ff0000}Admin", "{ffffff}Logar como {b21818}DONO{ffffff} do server\n\nEntre com uma senha:\n", "Confirmar", "Cancelar");
return 1;
}

CMD:restart(playerid)
{
if(GetPlayerAdminLevel(playerid) == 3){
SendClientMessageToAll(-1, "| SERVER | {15ff00}O server está reiniciando!");
SendRconCommand("gmx");}
else return SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem permissão!");
return 1;
}

CMD:minigun(playerid)
{
if(GetPlayerAdminLevel(playerid) >= 2){
PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
GivePlayerWeapon(playerid, 38, 9999);}
else return SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem permissão!");
return 1;
}

CMD:congelar(playerid, params[])
{
if(GetPlayerAdminLevel(playerid) >= 2){
new PlayerIDFreeze, string[256];
if(sscanf(params, "u", PlayerIDFreeze))return SendClientMessage(playerid, COR_ERRO, "| ERRO | Digite: /congelar [id]");
if(PlayerIDFreeze == playerid)return SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não pode congelar você mesmo!");
if(Freeze[PlayerIDFreeze] == true)return SendClientMessage(playerid, COR_ERRO, "| ERRO | Este player ja está congelado!");
if(!IsPlayerConnected(PlayerIDFreeze))return SendClientMessage(playerid, COR_ERRO,"| ERRO | Player invalido");
SendClientMessage(playerid, -1,"| INFO | {15ff00}Você congelou um player!");
format(string,sizeof(string), "| ADMIN | O(A) Administrador(a) %s congelou voce!",GetPlayerNameEx(playerid));
SendClientMessage(PlayerIDFreeze, COR_VERDEAZUL, string);
Freeze[PlayerIDFreeze] = true;
TogglePlayerControllable(PlayerIDFreeze, 0);}
else return SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem permissão!");
return 1;
}

CMD:descongelar(playerid, params[])
{
if(GetPlayerAdminLevel(playerid) >= 2){
new PlayerIDFreeze, string[256];
if(sscanf(params, "u", PlayerIDFreeze))return SendClientMessage(playerid, COR_ERRO, "| ERRO | Digite: /descongelar [id]");
if(Freeze[PlayerIDFreeze] == false)return SendClientMessage(playerid, COR_ERRO, "| ERRO | Este player não está congelado!");
if(!IsPlayerConnected(PlayerIDFreeze))return SendClientMessage(playerid, COR_ERRO,"| ERRO | Player invalido!");
SendClientMessage(playerid, -1,"| INFO | {15ff00}Voce congelou um player");
format(string,sizeof(string), "| ADMIN | O(A) Administrador(a) %s descongelou voce!",GetPlayerNameEx(playerid));
SendClientMessage(PlayerIDFreeze, COR_VERDEAZUL, string);
Freeze[PlayerIDFreeze] = false;
TogglePlayerControllable(PlayerIDFreeze, 1);}
else return SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem permissão!");
return 1;
}

CMD:limpararmas(playerid, params[])
{
if(GetPlayerAdminLevel(playerid) >= 2){
new PlayerID, string[256];
if(sscanf(params, "i", PlayerID))return SendClientMessage(playerid, COR_ERRO, "| ERRO | Digite: /limpararmas [id]");
if(!IsPlayerConnected(PlayerID))return SendClientMessage(playerid, COR_ERRO,"| ERRO | Player inválido!");
format(string,sizeof(string), "| ADMIN | O(A) Administrador(a) %s removeu suas armas!",GetPlayerNameEx(playerid));
SendClientMessage(PlayerID, COR_VERDEAZUL, string);
ResetPlayerWeapons(PlayerID);}
else return SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem permissão!");
return 1;
}

CMD:givemoney(playerid, params[])
{
if(GetPlayerAdminLevel(playerid) == 3){
new PlayerID, Quantidade, string[256];
if(sscanf(params, "ii", PlayerID, Quantidade))return SendClientMessage(playerid, COR_ERRO, "| ERRO | Digite: /givemoney [id] [quantidade]");
if(!IsPlayerConnected(PlayerID))return SendClientMessage(playerid, COR_ERRO,"| ERRO | Player inválido");
format(string,sizeof(string), "| ADMIN | O(A) Administrador(a) %s deu {12d800}$%d {168fad}para você!",GetPlayerNameEx(playerid),Quantidade);
SendClientMessage(PlayerID, COR_ADM, string);
PlayerPlaySound(PlayerID,1150,0.0,0.0,0.0);
GivePlayerMoney(playerid, Quantidade);}
else return SendClientMessage(playerid, COR_ERRO, "| ERRO | Você não tem permissão!");
return 1;
}

//------------------------------COMANDS---------------------------------------//

public OnPlayerCommandPerformed(playerid, cmdtext[], success)
{
if(!success){
SendClientMessage(playerid,COR_ERRO,"| ERRO | Comando inválido");}
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
if(newstate == PLAYER_STATE_DRIVER && oldstate != PLAYER_STATE_DRIVER){
new str[50];
format(str, sizeof(str), "~g~%s",VehicleNames[GetVehicleModel(GetPlayerVehicleID(playerid))-400]);
GameTextForPlayer(playerid, str, 6000, 1);}
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

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
new file[256];
format(file, sizeof(file), PATH, GetPlayerNameEx(playerid));

if(dialogid == DialogWeapons)
{
  if(response)
  {
	if(listitem == 0)
	{
	ShowPlayerDialog(playerid,DialogPistol,DIALOG_STYLE_LIST,"Pistolas","1\t9mm Pistol\n2\t9mm Silenced Pistol\n3\tDesert Eagle","Selecionar","Voltar");
	}
	if(listitem == 1)
	{
	ShowPlayerDialog(playerid,DialogSMG,DIALOG_STYLE_LIST,"SubMachineGuns","1\tMicro SMG/Uzi\n2\tTec-9\n3\tMP5","Selecionar","Voltar");
	}
	if(listitem == 2)
	{
	ShowPlayerDialog(playerid,DialogShotgun,DIALOG_STYLE_LIST,"Shotguns","1\tShotgun\n2\tSawoff Shotgun\n3\tCombat Shotgun","Selecionar","Voltar");
	}
	if(listitem == 3)
	{
	ShowPlayerDialog(playerid,DialogAssault,DIALOG_STYLE_LIST,"Assault Rifles","1\tAK-47\n2\tM4","Selecionar","Voltar");
	}
	if(listitem == 4)
	{
	ShowPlayerDialog(playerid,DialogRifles,DIALOG_STYLE_LIST,"Rifles","1\tCountry-Rifle\n2\tSniper","Selecionar","Voltar");
	}
	if(listitem == 5)
	{
	ShowPlayerDialog(playerid,DialogExplosivos,DIALOG_STYLE_LIST,"Explosivos","1\tGrenade\n2\tMolotov\n3\tSmoke Grenade\n4\tC4?","Selecionar","Voltar");
	}
	if(listitem == 6)
	{
	ShowPlayerDialog(playerid,DialogPesadas,DIALOG_STYLE_LIST,"Armas Pesadas","1\tRPG\n2\tHS Rocket\n3\tFlamethrower\n4\tMinigun\t\t\t{ff0000}Admin Only","Selecionar","Voltar");
	}
	if(listitem == 7)
	{
	ShowPlayerDialog(playerid,DialogBrancas,DIALOG_STYLE_LIST,"Armas Brancas","1\tSoco Inglês\n2\tTaco de Golf\n3\tCassetete\n4\tFaca\n5\tTaco de Baseball\n6\tPá\n7\tTaco de Bilhar\n8\tKatana\n9\tMoto Serra\n10\tDildo\n11\tDildo 2\n12\tVibrador\n13\tVibrador 2\n14\tFlores\n15\tBengala","Selecionar","Voltar");
	}
	if(listitem == 8)
	{
	ShowPlayerDialog(playerid,DialogOthers,DIALOG_STYLE_LIST,"Outros/Diversos","1\tSpray\n2\tExtintor\n3\tCamera\n4\tParaquedas","Selecionar","Voltar");
	}
  }
}

if(dialogid == DialogPistol)
{
  if(response)
  {
    PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
	if(listitem == 0)
	{
	GivePlayerWeapon(playerid, 22, 500);
	}
	else if(listitem == 1)
	{
	GivePlayerWeapon(playerid, 23, 500);
	}
	else if(listitem == 2)
	{
	GivePlayerWeapon(playerid, 24, 500);
	}
  }
  else
  {
  ShowPlayerDialog(playerid,DialogWeapons,DIALOG_STYLE_LIST,"Armas","1\tPistolas\n2\tSMGs\n3\tShotguns\n4\tAssault\n5\tRifles\n6\tExplosivos\n6\tPesadas\n7\tBrancas\n8\tOutros","Selecionar","Sair");
  }
}

if(dialogid == DialogSMG)
{
  if(response)
  {
    PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
    if(listitem == 0)
    {
    GivePlayerWeapon(playerid, 28, 500);
    }
    if(listitem == 1)
    {
    GivePlayerWeapon(playerid, 32, 500);
    }
    if(listitem == 2)
    {
    GivePlayerWeapon(playerid, 29, 500);
    }
  }
  else
  {
  ShowPlayerDialog(playerid,DialogWeapons,DIALOG_STYLE_LIST,"Armas","1\tPistolas\n2\tSMGs\n3\tShotguns\n4\tAssault\n5\tRifles\n6\tExplosivos\n6\tPesadas\n7\tBrancas\n8\tOutros","Selecionar","Sair");
  }
}

if(dialogid == DialogShotgun)
{
  if(response)
  {
    PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
    if(listitem == 0)
    {
    GivePlayerWeapon(playerid, 25, 500);
    }
    if(listitem == 1)
    {
    GivePlayerWeapon(playerid, 26, 500);
    }
    if(listitem == 2)
    {
    GivePlayerWeapon(playerid, 27, 500);
    }
  }
  else
  {
  ShowPlayerDialog(playerid,DialogWeapons,DIALOG_STYLE_LIST,"Armas","1\tPistolas\n2\tSMGs\n3\tShotguns\n4\tAssault\n5\tRifles\n6\tExplosivos\n6\tPesadas\n7\tBrancas\n8\tOutros","Selecionar","Sair");
  }
}

if(dialogid == DialogAssault)
{
  if(response)
  {
    PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
    if(listitem == 0)
    {
    GivePlayerWeapon(playerid, 30, 500);
    }
    if(listitem == 1)
    {
    GivePlayerWeapon(playerid, 31, 500);
    }
  }
  else
  {
  ShowPlayerDialog(playerid,DialogWeapons,DIALOG_STYLE_LIST,"Armas","1\tPistolas\n2\tSMGs\n3\tShotguns\n4\tAssault\n5\tRifles\n6\tExplosivos\n6\tPesadas\n7\tBrancas\n8\tOutros","Selecionar","Sair");
  }
}

if(dialogid == DialogRifles)
{
  if(response)
  {
    PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
    if(listitem == 0)
    {
    GivePlayerWeapon(playerid, 33, 50);
    }
    if(listitem == 1)
    {
    GivePlayerWeapon(playerid, 34, 50);
    }
  }
  else
  {
  ShowPlayerDialog(playerid,DialogWeapons,DIALOG_STYLE_LIST,"Armas","1\tPistolas\n2\tSMGs\n3\tShotguns\n4\tAssault\n5\tRifles\n6\tExplosivos\n6\tPesadas\n7\tBrancas\n8\tOutros","Selecionar","Sair");
  }
}

if(dialogid == DialogExplosivos)
{
  if(response)
  {
    PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
    if(listitem == 0)
    {
    GivePlayerWeapon(playerid, 16, 20);
    }
    if(listitem == 1)
    {
    GivePlayerWeapon(playerid, 18, 20);
    }
    if(listitem == 2)
    {
    GivePlayerWeapon(playerid, 17, 20);
    }
    if(listitem == 3)
    {
    GivePlayerWeapon(playerid, 39, 20);
    }
  }
  else
  {
  ShowPlayerDialog(playerid,DialogWeapons,DIALOG_STYLE_LIST,"Armas","1\tPistolas\n2\tSMGs\n3\tShotguns\n4\tAssault\n5\tRifles\n6\tExplosivos\n6\tPesadas\n7\tBrancas\n8\tOutros","Selecionar","Sair");
  }
}

if(dialogid == DialogPesadas)
{
  if(response)
  {
    if(listitem == 0)
    {
    PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
    GivePlayerWeapon(playerid, 35, 10);
    }
    if(listitem == 1)
    {
    PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
    GivePlayerWeapon(playerid, 36, 10);
    }
    if(listitem == 2)
    {
    PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
    GivePlayerWeapon(playerid, 37, 100);
    }
    if(listitem == 3)
    {
    if(PlayerInfo[playerid][pAdmin] >= 2){
    PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
    GivePlayerWeapon(playerid, 38, 9999);}
    else return SendClientMessage(playerid, COR_ERRO, "| ERRO | Voce não tem permissão");
    }
  }
  else
  {
  ShowPlayerDialog(playerid,DialogWeapons,DIALOG_STYLE_LIST,"Armas","1\tPistolas\n2\tSMGs\n3\tShotguns\n4\tAssault\n5\tRifles\n6\tExplosivos\n6\tPesadas\n7\tBrancas\n8\tOutros","Selecionar","Sair");
  }
}

if(dialogid == DialogBrancas)
{
  if(response)
  {
    PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
    if(listitem == 0)
    {
    GivePlayerWeapon(playerid,1,1);
    }
    if(listitem == 1)
    {
    GivePlayerWeapon(playerid,2,1);
    }
    if(listitem == 2)
    {
    GivePlayerWeapon(playerid,3,1);
    }
    if(listitem == 3)
    {
    GivePlayerWeapon(playerid,4,1);
    }
    if(listitem == 4)
    {
    GivePlayerWeapon(playerid,5,1);
    }
    if(listitem == 5)
    {
    GivePlayerWeapon(playerid,6,1);
    }
    if(listitem == 6)
    {
    GivePlayerWeapon(playerid,7,1);
    }
    if(listitem == 7)
    {
    GivePlayerWeapon(playerid,8,1);
    }
    if(listitem == 8)
    {
    GivePlayerWeapon(playerid,9,1);
    }
    if(listitem == 9)
    {
    GivePlayerWeapon(playerid,10,1);
    }
    if(listitem == 10)
    {
    GivePlayerWeapon(playerid,11,1);
    }
    if(listitem == 11)
    {
    GivePlayerWeapon(playerid,12,1);
    }
    if(listitem == 12)
    {
    GivePlayerWeapon(playerid,13,1);
    }
    if(listitem == 13)
    {
    GivePlayerWeapon(playerid,14,1);
    }
    if(listitem == 14)
    {
    GivePlayerWeapon(playerid,15,1);
    }
  }
  else
  {
  ShowPlayerDialog(playerid,DialogWeapons,DIALOG_STYLE_LIST,"Armas","1\tPistolas\n2\tSMGs\n3\tShotguns\n4\tAssault\n5\tRifles\n6\tExplosivos\n6\tPesadas\n7\tBrancas\n8\tOutros","Selecionar","Sair");
  }
}

if(dialogid == DialogOthers)
{
  if(response)
  {
    PlayerPlaySound(playerid,1052,0.0,0.0,0.0);
    if(listitem == 0)
    {
    GivePlayerWeapon(playerid,41,1000);
    }
    if(listitem == 1)
    {
    GivePlayerWeapon(playerid,42,1000);
    }
    if(listitem == 2)
    {
    GivePlayerWeapon(playerid,43,50);
    }
    if(listitem == 3)
    {
    GivePlayerWeapon(playerid,46,1);
    }
  }
  else
  {
  ShowPlayerDialog(playerid,DialogWeapons,DIALOG_STYLE_LIST,"Armas","1\tPistolas\n2\tSMGs\n3\tShotguns\n4\tAssault\n5\tRifles\n6\tExplosivos\n6\tPesadas\n7\tBrancas\n8\tOutros","Selecionar","Sair");
  }
}

if(dialogid == DialogVehicle)
{
  if(response)
  {
	if(listitem == 0)
	{
	new allvehicles[] = "1\tAndromada\n2\tAT-400\n3\tBeagle\n4\tCropduster\n5\tDodo\n6\tHydra\n7\tNevada\n8\tRustler\n9\tShamal\n10\tSkimmer\n11\tStunt Plane";
	ShowPlayerDialog(playerid,Avioes,DIALOG_STYLE_LIST,"{ff0000} Avioes",allvehicles,"Selecionar","Voltar");
	}
	if(listitem == 1)
	{
	new allvehicles[] = "1\tCargobob\n2\tHunter\n3\tLeviathan\n4\tMaverick\n5\tNews Maverick\n6\tPolice Maverick\n7\tRaindance\n8\tSeasparrow\n9\tSparrow";
	ShowPlayerDialog(playerid,Helicopteros,DIALOG_STYLE_LIST,"{ff0000} Helicopteros",allvehicles,"Selecionar","Voltar");
	}
	if(listitem == 2)
	{
	new allvehicles[] = "1\tBF-400\n2\tBike\n3\tBMX\n4\tFaggio\n5\tFCR-900\n6\tFreeway\n7\tMountain Bike\n8\tNRG-500\n9\tPCJ-600\n10\tPizzaBoy\n11\tQuad\n12\tSanchez\n13\tWayfarer";
	ShowPlayerDialog(playerid,Motos,DIALOG_STYLE_LIST,"{ff0000} Motos",allvehicles,"Selecionar","Voltar");
	}
	if(listitem == 3)
	{
	new allvehicles[] = "1\tComet\n2\tFeltzer\n3\tStallion\n4\tWindsor";
	ShowPlayerDialog(playerid,Conversiveis,DIALOG_STYLE_LIST,"{ff0000} Conversiveis",allvehicles,"Selecionar","Voltar");
	}
	if(listitem == 4)
	{
	new allvehicles[] = "1\tBenson\n2\tBobcat\n3\tBurrito\n4\tBoxville\n5\tBoxburg\n6\tCement Truck\n7\tDFT-300\n8\tFlatbed\n9\tLinerunner\n10\tMule\n11\tNews Van\n12\tPacker\n13\tPetrol Tanker\n14\tPicador\n15\tPony\n16\tRoad Train\n17\tRumpo\n18\tSadler\n19\tSadler Shit( Ghost Car )\n20\tTopfun\n21\tTractor\n22\tTrashmaster\n23\tUtility Van\n24\tWalton\n25\tYankee\n26\tYosemite";
	ShowPlayerDialog(playerid,Industriais,DIALOG_STYLE_LIST,"{ff0000} Industriais",allvehicles,"Selecionar","Voltar");
	}
	if(listitem == 5)
	{
	new allvehicles[] = "1\tBlade\n2\tBroadway\n3\tRemington\n4\tSavanna\n5\tSlamvan\n6\tTahoma\n7\tTornado\n8\tVoodoo";
	ShowPlayerDialog(playerid,Lowriders,DIALOG_STYLE_LIST,"{ff0000} Lowriders",allvehicles,"Selecionar","Voltar");
	}
	if(listitem == 6)
	{
	new allvehicles[] = "1\tBandito\n2\tBF Injection\n3\tDune\n4\tHuntley\n5\tLandstalker\n6\tMesa\n7\tMonster Truck\n8\tMonster Truck 'A'\n9\tMonster Truck 'B'\n10\tPatriot\n11\tRancher 'A'\n12\tRancher 'B'\n13\tSandking";
	ShowPlayerDialog(playerid,OffRoads,DIALOG_STYLE_LIST,"{ff0000} Off Road",allvehicles,"Selecionar","Voltar");
	}
	if(listitem == 7)
	{
	new allvehicles[] = "1\tAmbulance\n2\tBarracks\n3\tBus\n4\tCabbie\n5\tCoach\n6\tHPV-1000 ( Cop Bike )\n7\tEnforcer\n8\tF.B.I Rancher\n9\tF.B.I Truck\n10\tFiretruck\n11\tFireTruck LA\n12\tPolice Car ( LSPD )\n13\tPolice Car ( LVPD )\n14\tPolice Car ( SFPD )\n15\tRanger\n16\tS.W.A.T\n17\tTaxi\n18\tRhino";
	ShowPlayerDialog(playerid,Serviços_Publicos,DIALOG_STYLE_LIST,"{ff0000} Serviços Publicos",allvehicles,"Selecionar","Voltar");
	}
	if(listitem == 8)
	{
	new allvehicles[] = "1\tAdmiral\n2\tBloodring Banger\n3\tBravura\n4\tBuccaneer\n5\tCadrona\n6\tClover\n7\tElegant\n8\tElegy\n9\tEmperor\n10\tEsperanto\n11\tFortune\n12\tGlendale Shit ( Ghost Car )\n13\tGlendale\n14\tGreenwood\n15\tHermes\n16\tIntruder\n17\tMajestic\n18\tMananal\n19\tMerit\n20\tNebula\n21\tOceanic\n22\tPremier\n23\tPrevion\n24\tPrimo\n25\tSentinel\n26\tStafford\n27\tSultan \n28\tSunrise\n29\tTampa\n30\tVicent\n31\tVirgo\n32\tWillard\n33\tWashington";
	ShowPlayerDialog(playerid,Saloons,DIALOG_STYLE_LIST,"{ff0000} Saloons",allvehicles,"Selecionar","Voltar");
	}
	if(listitem == 9)
	{
	new allvehicles[] = "1\tAlpha\n2\tBanshee\n3\tBlista Compact\n4\tBuffalo\n5\tBullet\n6\tCheetah\n7\tClub\n8\tEuros\n9\tFlash\n10\tHotring Racer 'A'\n11\tHotring Racer 'B'\n12\tHotring Racer 'C'\n13\tInfernus\n14\tJester\n15\tPhoenix\n16\tSabre\n17\tSuper GT\n18\tTurismo\n19\tUranus\n20\tZR-350";
	ShowPlayerDialog(playerid,Esportivos,DIALOG_STYLE_LIST,"{ff0000} Esportivos",allvehicles,"Selecionar","Voltar");
	}
	if(listitem == 10)
	{
	new allvehicles[] = "1\tMoonbeam\n2\tPerenniel\n3\tRegina\n4\tSolair\n5\tStratum";
	ShowPlayerDialog(playerid,Peruas,DIALOG_STYLE_LIST,"{ff0000} Peruas",allvehicles,"Selecionar","Voltar");
	}
	if(listitem == 11)
	{
	new allvehicles[] = "1\tCoastguard\n2\tDinghy\n3\tJetmax\n4\tLaunch\n5\tMarquis\n6\tPredator\n7\tReefer\n8\tSpeeder\n9\tSquallo\n10\tTropic";
	ShowPlayerDialog(playerid,Barcos,DIALOG_STYLE_LIST,"{ff0000} Barcos",allvehicles,"Selecionar","Voltar");
	}
	if(listitem == 12)
	{
	new allvehicles[] = "1\tBaggage\n2\tCaddy\n3\tCamper 'A'\n4\tCamper 'B'\n5\tCobine Harvester\n6\tDozer\n7\tDumper\n8\tForklift\n9\tHotknife\n10\tHustler\n11\tHotdog\n12\tKart\n13\tMower\n14\tMr. Whoopee\n15\tRomero\n16\tSecuricar\n17\tStretch\n18\tSweeper\n19\tTowtruck\n20\tTug\n21\tVortex";
	ShowPlayerDialog(playerid,Unicos,DIALOG_STYLE_LIST,"{ff0000} Unicos",allvehicles,"Selecionar","Voltar");
	}
	if(listitem == 13)
	{
	new allvehicles[] = "1\tRC Bandit\n2\tRC Baron\n3\tRC Raider'\n4\tRC Goblin'\n5\tRC Tiger\n6\tRC Cam";
	ShowPlayerDialog(playerid,Veiculos_RC,DIALOG_STYLE_LIST,"{ff0000} Veiculos RC",allvehicles,"Selecionar","Voltar");
	}
	if(listitem == 14)
	{
	new allvehicles[] = "1\tArticle Trailer\n2\tArticle Trailer 2\n3\tArticle Trailer 3'\n4\tBaggage Trailer 'A''\n5\tBaggage Trailer 'B'\n6\tFarm Trailer\n7\tFreight Frat Trailer(Train)\n8\tFreight Box Trailer(Train)\n9\tPetrol Trailer\n10\tStreak Trailer(Train)\n11\tStairs Trailer\n12\tUitlity Trailer";
	ShowPlayerDialog(playerid,Trailers,DIALOG_STYLE_LIST,"{ff0000} Trailers",allvehicles,"Selecionar","Voltar");
	}
  }
}
if(dialogid == Avioes)
{
  if(response)
  {
    if(listitem == 0)//ANDROMADA
    {
    CriarVeiculoParaPlayer(playerid, 592);
    }
    else if(listitem == 1)//AT-400
    {
    CriarVeiculoParaPlayer(playerid, 577);
    }
    else if(listitem == 2)//BEAGLE
    {
    CriarVeiculoParaPlayer(playerid, 511);
    }
    else if(listitem == 3)//CROPDUSTER
    {
    CriarVeiculoParaPlayer(playerid, 512);
    }
    else if(listitem == 4)//DODO
    {
    CriarVeiculoParaPlayer(playerid, 593);
    }
    else if(listitem == 5)//HYDRA
    {
    if(PlayerInfo[playerid][pAdmin] >= 2){
    CriarVeiculoParaPlayer(playerid, 520);}
    else return SendClientMessage(playerid, COR_ERRO, "| ERRO | Voce não tem permissão");
    }
    else if(listitem == 6)//NEVADA
    {
    CriarVeiculoParaPlayer(playerid, 553);
    }
    else if(listitem == 7)//RUSTLER
    {
    CriarVeiculoParaPlayer(playerid, 476);
    }
    else if(listitem == 8)//SHAMAL
    {
    CriarVeiculoParaPlayer(playerid, 519);
    }
    else if(listitem == 9)//SKIMMER
    {
    CriarVeiculoParaPlayer(playerid, 460);
    }
    else if(listitem == 10)//STUNT PLANE
    {
    CriarVeiculoParaPlayer(playerid, 513);
    }
  }
  else
  {
  new allvehicles[] = "1\tAvioes\n2\tHelicopteros\n3\tMotos\n4\tConverciveis\n5\tIndustriais\n6\tLowriders\n7\tOffRoad\n8\tServiços Publicos\n9\tSaloons\n10\tEsportivos\n11\tPeruas\n12\tBarcos\n13\tUnicos\n14\tVeiculos RC\n15\tTrailers";
  ShowPlayerDialog(playerid,DialogVehicle,DIALOG_STYLE_LIST,"{ff0000} Veiculos",allvehicles,"Selecionar","Sair");
  }
}
if(dialogid == Helicopteros)
{
  if(response)
  {
    if(listitem == 0)//CARGOBOB
    {
    CriarVeiculoParaPlayer(playerid, 548);
    }
    else if(listitem == 1)//HUNTER
    {
    if(PlayerInfo[playerid][pAdmin] >= 2){
    CriarVeiculoParaPlayer(playerid, 425);}
    else return SendClientMessage(playerid, COR_ERRO, "| ERRO | Voce não tem permissão");
    }
    else if(listitem == 2)//LEVIATHAN
    {
    CriarVeiculoParaPlayer(playerid, 417);
    }
    else if(listitem == 3)//MAVERICK
    {
    CriarVeiculoParaPlayer(playerid, 487);
    }
    else if(listitem == 4)//NEWS MAVERICK
    {
    CriarVeiculoParaPlayer(playerid, 488);
    }
    else if(listitem == 5)//POLICE MAVERICK
    {
    CriarVeiculoParaPlayer(playerid, 497);
    }
    else if(listitem == 6)//RAINDENCE
    {
    CriarVeiculoParaPlayer(playerid, 563);
    }
    else if(listitem == 7)//SEASPARROW
    {
    CriarVeiculoParaPlayer(playerid, 447);
    }
    else if(listitem == 8)//SPARROW
    {
    CriarVeiculoParaPlayer(playerid, 469);
    }
  }
  else
  {
  new allvehicles[] = "1\tAvioes\n2\tHelicopteros\n3\tMotos\n4\tConverciveis\n5\tIndustriais\n6\tLowriders\n7\tOffRoad\n8\tServiços Publicos\n9\tSaloons\n10\tEsportivos\n11\tPeruas\n12\tBarcos\n13\tUnicos\n14\tVeiculos RC\n15\tTrailers";
  ShowPlayerDialog(playerid,DialogVehicle,DIALOG_STYLE_LIST,"{ff0000} Veiculos",allvehicles,"Selecionar","Sair");
  }
}
if(dialogid == Motos)
{
  if(response)
  {
    if(listitem == 0)//BF-400
    {
    CriarVeiculoParaPlayer(playerid, 581);
    }
    else if(listitem == 1)//BIKE
    {
    CriarVeiculoParaPlayer(playerid, 509);
    }
    else if(listitem == 2)//BMX
    {
    CriarVeiculoParaPlayer(playerid, 481);
    }
    else if(listitem == 3)//FAGGIO
    {
    CriarVeiculoParaPlayer(playerid, 462);
    }
    else if(listitem == 4)//FCR-900
    {
    CriarVeiculoParaPlayer(playerid, 521);
    }
    else if(listitem == 5)//FREEWAY
    {
    CriarVeiculoParaPlayer(playerid, 463);
    }
    else if(listitem == 6)//MOUNTAIN BIKE
    {
    CriarVeiculoParaPlayer(playerid, 510);
    }
    else if(listitem == 7)//NRG-500
    {
    CriarVeiculoParaPlayer(playerid, 522);
    }
    else if(listitem == 8)//PCJ-600
    {
    CriarVeiculoParaPlayer(playerid, 461);
    }
    else if(listitem == 9)//PIZZA BOY
    {
    CriarVeiculoParaPlayer(playerid, 448);
    }
    else if(listitem == 10)//QUAD
    {
    CriarVeiculoParaPlayer(playerid, 471);
    }
    else if(listitem == 11)//SANCHEZ
    {
    CriarVeiculoParaPlayer(playerid, 468);
    }
    else if(listitem == 12)//WAYFARER
    {
    CriarVeiculoParaPlayer(playerid, 586);
    }
  }
  else
  {
  new allvehicles[] = "1\tAvioes\n2\tHelicopteros\n3\tMotos\n4\tConverciveis\n5\tIndustriais\n6\tLowriders\n7\tOffRoad\n8\tServiços Publicos\n9\tSaloons\n10\tEsportivos\n11\tPeruas\n12\tBarcos\n13\tUnicos\n14\tVeiculos RC\n15\tTrailers";
  ShowPlayerDialog(playerid,DialogVehicle,DIALOG_STYLE_LIST," {ff0000} Veiculos",allvehicles,"Selecionar","Sair");
  }
}
if(dialogid == Conversiveis)
{
  if(response)
  {
    if(listitem == 0)//COMET
    {
    CriarVeiculoParaPlayer(playerid, 480);
    }
    else if(listitem == 1)//FELTZER
    {
    CriarVeiculoParaPlayer(playerid, 533);
    }
    else if(listitem == 2)//STALLION
    {
    CriarVeiculoParaPlayer(playerid, 439);
    }
    else if(listitem == 3)//WINDSOR
    {
    CriarVeiculoParaPlayer(playerid, 555);
    }
  }
  else
  {
  new allvehicles[] = "1\tAvioes\n2\tHelicopteros\n3\tMotos\n4\tConverciveis\n5\tIndustriais\n6\tLowriders\n7\tOffRoad\n8\tServiços Publicos\n9\tSaloons\n10\tEsportivos\n11\tPeruas\n12\tBarcos\n13\tUnicos\n14\tVeiculos RC\n15\tTrailers";
  ShowPlayerDialog(playerid,DialogVehicle,DIALOG_STYLE_LIST," {ff0000}Veiculos",allvehicles,"Selecionar","Sair");
  }
}
if(dialogid == Industriais)
{
  if(response)
  {
    if(listitem == 0)//BENSON
    {
    CriarVeiculoParaPlayer(playerid, 499);
    }
    else if(listitem == 1)//BOBCAT
    {
    CriarVeiculoParaPlayer(playerid, 422);
    }
    else if(listitem == 2)//BURRITO
    {
    CriarVeiculoParaPlayer(playerid, 482);
    }
    else if(listitem == 3)//BOXVILLE
    {
    CriarVeiculoParaPlayer(playerid, 498);
    }
    else if(listitem == 4)//BOX BURG
    {
    CriarVeiculoParaPlayer(playerid, 609);
    }
    else if(listitem == 5)//CEMENT TRUCK
    {
    CriarVeiculoParaPlayer(playerid, 524);
    }
    else if(listitem == 6)//DFT-300
    {
    CriarVeiculoParaPlayer(playerid, 578);
    }
    else if(listitem == 7)//FLATBED
    {
    CriarVeiculoParaPlayer(playerid, 455);
    }
    else if(listitem == 8)//LINERUNNER
    {
    CriarVeiculoParaPlayer(playerid, 403);
    }
    else if(listitem == 9)//MULE
    {
    CriarVeiculoParaPlayer(playerid, 414);
    }
    else if(listitem == 10)//NEWS VAN
    {
    CriarVeiculoParaPlayer(playerid, 582);
    }
    else if(listitem == 11)//PACKER
    {
    CriarVeiculoParaPlayer(playerid, 443);
    }
    else if(listitem == 12)//PETROL TANKER
    {
    CriarVeiculoParaPlayer(playerid, 514);
    }
    else if(listitem == 13)//PICADOR
    {
    CriarVeiculoParaPlayer(playerid, 600);
    }
    else if(listitem == 14)//PONY
    {
    CriarVeiculoParaPlayer(playerid, 413);
    }
    else if(listitem == 15)//ROAD TRAIN
    {
    CriarVeiculoParaPlayer(playerid, 515);
    }
    else if(listitem == 16)//RUMPO
    {
    CriarVeiculoParaPlayer(playerid, 440);
    }
    else if(listitem == 17)//SADLER
    {
    CriarVeiculoParaPlayer(playerid, 543);
    }
    else if(listitem == 18)//SADLER SHIT
    {
    CriarVeiculoParaPlayer(playerid, 605);
    }
    else if(listitem == 19)//TOPFUN
    {
    CriarVeiculoParaPlayer(playerid, 459);
    }
    else if(listitem == 20)//TRACTOR
    {
    CriarVeiculoParaPlayer(playerid, 531);
    }
    else if(listitem == 21)//TRASHMASTER
    {
    CriarVeiculoParaPlayer(playerid, 408);
    }
    else if(listitem == 22)//UTILITY VAN
    {
    CriarVeiculoParaPlayer(playerid, 552);
    }
    else if(listitem == 23)//WALTON
    {
    CriarVeiculoParaPlayer(playerid, 478);
    }
    else if(listitem == 24)//YANKEE
    {
    CriarVeiculoParaPlayer(playerid, 556);
    }
    else if(listitem == 25)//YOSEMITE
    {
    CriarVeiculoParaPlayer(playerid, 554);
    }
  }
  else
  {
  new allvehicles[] = "1\tAvioes\n2\tHelicopteros\n3\tMotos\n4\tConverciveis\n5\tIndustriais\n6\tLowriders\n7\tOffRoad\n8\tServiços Publicos\n9\tSaloons\n10\tEsportivos\n11\tPeruas\n12\tBarcos\n13\tUnicos\n14\tVeiculos RC\n15\tTrailers";
  ShowPlayerDialog(playerid,DialogVehicle,DIALOG_STYLE_LIST," {ff0000}Veiculos",allvehicles,"Selecionar","Sair");
  }
}
if(dialogid == Lowriders)
{
  if(response)
  {
    if(listitem == 0)//BLADE
    {
    CriarVeiculoParaPlayer(playerid, 536);
    }
    else if(listitem == 1)//BRAODWAY
    {
    CriarVeiculoParaPlayer(playerid, 575);
    }
    else if(listitem == 2)//REMINGTON
    {
    CriarVeiculoParaPlayer(playerid, 534);
    }
    else if(listitem == 3)//SAVANNA
    {
    CriarVeiculoParaPlayer(playerid, 567);
    }
    else if(listitem == 4)//SLAMVAN
    {
    CriarVeiculoParaPlayer(playerid, 535);
    }
    else if(listitem == 5)//TAHOMA
    {
    CriarVeiculoParaPlayer(playerid, 566);
    }
    else if(listitem == 6)//TORNADO
    {
    CriarVeiculoParaPlayer(playerid, 576);
    }
    else if(listitem == 7)//VOODOO
    {
    CriarVeiculoParaPlayer(playerid, 412);
    }
  }
  else
  {
  new allvehicles[] = "1\tAvioes\n2\tHelicopteros\n3\tMotos\n4\tConverciveis\n5\tIndustriais\n6\tLowriders\n7\tOffRoad\n8\tServiços Publicos\n9\tSaloons\n10\tEsportivos\n11\tPeruas\n12\tBarcos\n13\tUnicos\n14\tVeiculos RC\n15\tTrailers";
  ShowPlayerDialog(playerid,DialogVehicle,DIALOG_STYLE_LIST," {ff0000}Veiculos",allvehicles,"Selecionar","Sair");
  }
}
if(dialogid == OffRoads)
{
  if(response)
  {
    if(listitem == 0)//BANDITO
    {
    CriarVeiculoParaPlayer(playerid, 568);
    }
    else if(listitem == 1)//BF INJECTION
    {
    CriarVeiculoParaPlayer(playerid, 424);
    }
    else if(listitem == 2)
    {
    CriarVeiculoParaPlayer(playerid, 573);
    }
    else if(listitem == 3)
    {
    CriarVeiculoParaPlayer(playerid, 579);
    }
    else if(listitem == 4)
    {
    CriarVeiculoParaPlayer(playerid, 400);
    }
    else if(listitem == 5)
    {
    CriarVeiculoParaPlayer(playerid, 500);
    }
    else if(listitem == 6)
    {
    CriarVeiculoParaPlayer(playerid, 444);
    }
    else if(listitem == 7)
    {
    CriarVeiculoParaPlayer(playerid, 556);
    }
    else if(listitem == 8)
    {
    CriarVeiculoParaPlayer(playerid, 557);
    }
    else if(listitem == 9)
    {
    CriarVeiculoParaPlayer(playerid, 470);
    }
    else if(listitem == 10)
    {
    CriarVeiculoParaPlayer(playerid, 489);
    }
    else if(listitem == 11)
    {
    CriarVeiculoParaPlayer(playerid, 505);
    }
    else if(listitem == 12)
    {
    CriarVeiculoParaPlayer(playerid, 495);
    }
  }
  else
  {
  new allvehicles[] = "1\tAvioes\n2\tHelicopteros\n3\tMotos\n4\tConverciveis\n5\tIndustriais\n6\tLowriders\n7\tOffRoad\n8\tServiços Publicos\n9\tSaloons\n10\tEsportivos\n11\tPeruas\n12\tBarcos\n13\tUnicos\n14\tVeiculos RC\n15\tTrailers";
  ShowPlayerDialog(playerid,DialogVehicle,DIALOG_STYLE_LIST," {ff0000}Veiculos",allvehicles,"Selecionar","Sair");
  }
}
if(dialogid == Serviços_Publicos)
{
  if(response)
  {
    if(listitem == 0)
    {
    CriarVeiculoParaPlayer(playerid, 416);
    }
    else if(listitem == 1)
    {
    CriarVeiculoParaPlayer(playerid, 433);
    }
    else if(listitem == 2)
    {
    CriarVeiculoParaPlayer(playerid, 431);
    }
    else if(listitem == 3)
    {
    CriarVeiculoParaPlayer(playerid, 438);
    }
	else if(listitem == 4)
	{
	CriarVeiculoParaPlayer(playerid, 437);
	}
	else if(listitem == 5)
	{
	CriarVeiculoParaPlayer(playerid, 523);
	}
	else if(listitem == 6)
	{
	CriarVeiculoParaPlayer(playerid, 427);
	}
	else if(listitem == 7)
	{
	CriarVeiculoParaPlayer(playerid, 490);
	}
	else if(listitem == 8)
	{
	CriarVeiculoParaPlayer(playerid, 528);
	}
	else if(listitem == 9)
	{
	CriarVeiculoParaPlayer(playerid, 407);
	}
	else if(listitem == 10)
	{
	CriarVeiculoParaPlayer(playerid, 544);
	}
	else if(listitem == 11)
	{
	CriarVeiculoParaPlayer(playerid, 596);
	}
	else if(listitem == 12)
	{
	CriarVeiculoParaPlayer(playerid, 598);
	}
	else if(listitem == 13)
	{
	CriarVeiculoParaPlayer(playerid, 597);
	}
	else if(listitem == 14)
	{
	CriarVeiculoParaPlayer(playerid, 599);
	}
	else if(listitem == 15)
	{
	CriarVeiculoParaPlayer(playerid, 601);
	}
	else if(listitem == 16)
	{
	CriarVeiculoParaPlayer(playerid, 420);
	}
	else if(listitem == 17)
	{
	if(PlayerInfo[playerid][pAdmin] >= 2){
	CriarVeiculoParaPlayer(playerid, 432);}
	else return SendClientMessage(playerid, COR_ERRO, "| ERRO | Voce não tem permissão");
	}
  }
  else
  {
  new allvehicles[] = "1\tAvioes\n2\tHelicopteros\n3\tMotos\n4\tConverciveis\n5\tIndustriais\n6\tLowriders\n7\tOffRoad\n8\tServiços Publicos\n9\tSaloons\n10\tEsportivos\n11\tPeruas\n12\tBarcos\n13\tUnicos\n14\tVeiculos RC\n15\tTrailers";
  ShowPlayerDialog(playerid,DialogVehicle,DIALOG_STYLE_LIST," {ff0000}Veiculos",allvehicles,"Selecionar","Sair");
  }
}
if(dialogid == Saloons)
{
  if(response)
  {
    if(listitem == 0)
	{
	CriarVeiculoParaPlayer(playerid, 445);
	}
	else if(listitem == 1)
	{
	CriarVeiculoParaPlayer(playerid, 504);
	}
	else if(listitem == 2)
	{
	CriarVeiculoParaPlayer(playerid, 401);
	}
	else if(listitem == 3)
	{
	CriarVeiculoParaPlayer(playerid, 518);
	}
	else if(listitem == 4)
	{
	CriarVeiculoParaPlayer(playerid, 527);
	}
	else if(listitem == 5)
	{
    CriarVeiculoParaPlayer(playerid, 542);
	}
	else if(listitem == 6)
	{
	CriarVeiculoParaPlayer(playerid, 507);
	}
	else if(listitem == 7)
	{
	CriarVeiculoParaPlayer(playerid, 562);
	}
	else if(listitem == 8)
	{
    CriarVeiculoParaPlayer(playerid, 585);
	}
	else if(listitem == 9)
	{
	CriarVeiculoParaPlayer(playerid, 419);
	}
	else if(listitem == 10)
	{
	CriarVeiculoParaPlayer(playerid, 526);
	}
	else if(listitem == 11)
	{
    CriarVeiculoParaPlayer(playerid, 604);
	}
	else if(listitem == 12)
	{
	CriarVeiculoParaPlayer(playerid, 466);
	}
	else if(listitem == 13)
	{
	CriarVeiculoParaPlayer(playerid, 492);
    }
	else if(listitem == 14)
	{
	CriarVeiculoParaPlayer(playerid, 474);
	}
	else if(listitem == 15)
	{
	CriarVeiculoParaPlayer(playerid, 546);
	}
	else if(listitem == 16)
	{
    CriarVeiculoParaPlayer(playerid, 517);
	}
	else if(listitem == 17)
	{
	CriarVeiculoParaPlayer(playerid, 310);
	}
	else if(listitem == 18)
	{
	CriarVeiculoParaPlayer(playerid, 551);
	}
	else if(listitem == 19)
	{
	CriarVeiculoParaPlayer(playerid, 516);
	}
	else if(listitem == 20)
	{
    CriarVeiculoParaPlayer(playerid, 467);
	}
	else if(listitem == 21)
	{
    CriarVeiculoParaPlayer(playerid, 426);
	}
	else if(listitem == 22)
	{
	CriarVeiculoParaPlayer(playerid, 436);
	}
	else if(listitem == 23)
	{
    CriarVeiculoParaPlayer(playerid, 547);
	}
	else if(listitem == 24)
	{
	CriarVeiculoParaPlayer(playerid, 405);
	}
	else if(listitem == 25)
	{
	CriarVeiculoParaPlayer(playerid, 580);
	}
	else if(listitem == 26)
	{
	CriarVeiculoParaPlayer(playerid, 560);
	}
	else if(listitem == 27)
	{
	CriarVeiculoParaPlayer(playerid, 550);
	}
	else if(listitem == 28)
	{
	CriarVeiculoParaPlayer(playerid, 549);
	}
	else if(listitem == 29)
	{
    CriarVeiculoParaPlayer(playerid, 540);
	}
	else if(listitem == 30)
	{
	CriarVeiculoParaPlayer(playerid, 560);
	}
	else if(listitem == 31)
	{
	CriarVeiculoParaPlayer(playerid, 529);
	}
	else if(listitem == 32)
	{
	CriarVeiculoParaPlayer(playerid, 421);
	}
  }
  else
  {
  new allvehicles[] = "1\tAvioes\n2\tHelicopteros\n3\tMotos\n4\tConverciveis\n5\tIndustriais\n6\tLowriders\n7\tOffRoad\n8\tServiços Publicos\n9\tSaloons\n10\tEsportivos\n11\tPeruas\n12\tBarcos\n13\tUnicos\n14\tVeiculos RC\n15\tTrailers";
  ShowPlayerDialog(playerid,DialogVehicle,DIALOG_STYLE_LIST," {ff0000}Veiculos",allvehicles,"Selecionar","Sair");
  }
}
if(dialogid == Esportivos)
{
  if(response)
  {
    if(listitem == 0)
    {
	CriarVeiculoParaPlayer(playerid, 602);
	}
	else if(listitem == 1)
	{
	CriarVeiculoParaPlayer(playerid, 429);
	}
	else if(listitem == 2)
	{
	CriarVeiculoParaPlayer(playerid, 496);
	}
	else if(listitem == 3)
	{
	CriarVeiculoParaPlayer(playerid, 402);
	}
	else if(listitem == 4)
	{
	CriarVeiculoParaPlayer(playerid, 541);
	}
	else if(listitem == 5)
	{
	CriarVeiculoParaPlayer(playerid, 415);
	}
	else if(listitem == 6)
	{
	CriarVeiculoParaPlayer(playerid, 589);
	}
	else if(listitem == 7)
	{
	CriarVeiculoParaPlayer(playerid, 587);
	}
	else if(listitem == 8)
	{
	CriarVeiculoParaPlayer(playerid, 565);
	}
	else if(listitem == 9)
	{
	CriarVeiculoParaPlayer(playerid, 494);
	}
	else if(listitem == 10)
	{
	CriarVeiculoParaPlayer(playerid, 502);
	}
	else if(listitem == 11)
	{
	CriarVeiculoParaPlayer(playerid, 503);
	}
	else if(listitem == 12)
	{
	CriarVeiculoParaPlayer(playerid, 411);
	}
	else if(listitem == 13)
	{
	CriarVeiculoParaPlayer(playerid, 559);
	}
	else if(listitem == 14)
	{
	CriarVeiculoParaPlayer(playerid, 603);
	}
	else if(listitem == 15)
	{
	CriarVeiculoParaPlayer(playerid, 475);
	}
	else if(listitem == 16)
	{
	CriarVeiculoParaPlayer(playerid, 506);
	}
	else if(listitem == 17)
	{
	CriarVeiculoParaPlayer(playerid, 451);
	}
	else if(listitem == 18)
	{
	CriarVeiculoParaPlayer(playerid, 558);
	}
	else if(listitem == 19)
	{
	CriarVeiculoParaPlayer(playerid, 477);
	}
  }
  else
  {
  new allvehicles[] = "1\tAvioes\n2\tHelicopteros\n3\tMotos\n4\tConverciveis\n5\tIndustriais\n6\tLowriders\n7\tOffRoad\n8\tServiços Publicos\n9\tSaloons\n10\tEsportivos\n11\tPeruas\n12\tBarcos\n13\tUnicos\n14\tVeiculos RC\n15\tTrailers";
  ShowPlayerDialog(playerid,DialogVehicle,DIALOG_STYLE_LIST," {ff0000}Veiculos",allvehicles,"Selecionar","Sair");
  }
}
if(dialogid == Peruas)
{
  if(response)
  {
    if(listitem == 0)
    {
    CriarVeiculoParaPlayer(playerid, 418);
    }
    else if(listitem == 1)
    {
    CriarVeiculoParaPlayer(playerid, 404);
    }
    else if(listitem == 2)
    {
    CriarVeiculoParaPlayer(playerid, 479);
    }
    else if(listitem == 3)
    {
    CriarVeiculoParaPlayer(playerid, 458);
    }
    else if(listitem == 4)
    {
    CriarVeiculoParaPlayer(playerid, 561);
    }
  }
  else
  {
  new allvehicles[] = "1\tAvioes\n2\tHelicopteros\n3\tMotos\n4\tConverciveis\n5\tIndustriais\n6\tLowriders\n7\tOffRoad\n8\tServiços Publicos\n9\tSaloons\n10\tEsportivos\n11\tPeruas\n12\tBarcos\n13\tUnicos\n14\tVeiculos RC\n15\tTrailers";
  ShowPlayerDialog(playerid,DialogVehicle,DIALOG_STYLE_LIST," {ff0000}Veiculos",allvehicles,"Selecionar","Sair");
  }
}
if(dialogid == Barcos)
{
  if(response)
  {
    if(listitem == 0)
	{
	CriarVeiculoParaPlayer(playerid, 472);
	}
	else if(listitem == 1)
	{
	CriarVeiculoParaPlayer(playerid, 473);
	}
	else if(listitem == 2)
	{
    CriarVeiculoParaPlayer(playerid, 493);
	}
	else if(listitem == 3)
	{
	CriarVeiculoParaPlayer(playerid, 595);
	}
	else if(listitem == 4)
	{
	CriarVeiculoParaPlayer(playerid, 484);
	}
	else if(listitem == 5)
	{
	CriarVeiculoParaPlayer(playerid, 430);
	}
	else if(listitem == 6)
	{
    CriarVeiculoParaPlayer(playerid, 453);
	}
	else if(listitem == 7)
	{
	CriarVeiculoParaPlayer(playerid, 452);
	}
	else if(listitem == 8)
	{
	CriarVeiculoParaPlayer(playerid, 446);
	}
	else if(listitem == 9)
	{
    CriarVeiculoParaPlayer(playerid, 454);
	}
  }
  else
  {
  new allvehicles[] = "1\tAvioes\n2\tHelicopteros\n3\tMotos\n4\tConverciveis\n5\tIndustriais\n6\tLowriders\n7\tOffRoad\n8\tServiços Publicos\n9\tSaloons\n10\tEsportivos\n11\tPeruas\n12\tBarcos\n13\tUnicos\n14\tVeiculos RC\n15\tTrailers";
  ShowPlayerDialog(playerid,DialogVehicle,DIALOG_STYLE_LIST," {ff0000}Veiculos",allvehicles,"Selecionar","Sair");
  }
}
if(dialogid == Unicos)
{
  if(response)
  {
    if(listitem == 0)
	{
	CriarVeiculoParaPlayer(playerid, 485);
	}
	else if(listitem == 1)
	{
	CriarVeiculoParaPlayer(playerid, 457);
	}
	else if(listitem == 2)
	{
	CriarVeiculoParaPlayer(playerid, 483);
	}
	else if(listitem == 3)
	{
	CriarVeiculoParaPlayer(playerid, 508);
	}
	else if(listitem == 4)
	{
	CriarVeiculoParaPlayer(playerid, 532);
	}
	else if(listitem == 5)
	{
	CriarVeiculoParaPlayer(playerid, 486);
	}
	else if(listitem == 6)
	{
	CriarVeiculoParaPlayer(playerid, 406);
	}
	else if(listitem == 7)
	{
	CriarVeiculoParaPlayer(playerid, 530);
	}
	else if(listitem == 8)
	{
	CriarVeiculoParaPlayer(playerid, 434);
	}
	else if(listitem == 9)
	{
	CriarVeiculoParaPlayer(playerid, 545);
	}
	else if(listitem == 10)
	{
	CriarVeiculoParaPlayer(playerid, 588);
	}
	else if(listitem == 11)
	{
	CriarVeiculoParaPlayer(playerid, 571);
	}
	else if(listitem == 12)
	{
	CriarVeiculoParaPlayer(playerid, 572);
	}
	else if(listitem == 13)
	{
	CriarVeiculoParaPlayer(playerid, 423);
	}
	else if(listitem == 14)
	{
	CriarVeiculoParaPlayer(playerid, 442);
	}
	else if(listitem == 15)
	{
    CriarVeiculoParaPlayer(playerid, 428);
	}
    else if(listitem == 16)
	{
    CriarVeiculoParaPlayer(playerid, 409);
	}
	else if(listitem == 17)
	{
	CriarVeiculoParaPlayer(playerid, 574);
	}
	else if(listitem == 18)
	{
	CriarVeiculoParaPlayer(playerid, 525);
	}
	else if(listitem == 19)
	{
	CriarVeiculoParaPlayer(playerid, 583);
	}
	else if(listitem == 20)
	{
	CriarVeiculoParaPlayer(playerid, 539);
	}
  }
  else
  {
  new allvehicles[] = "1\tAvioes\n2\tHelicopteros\n3\tMotos\n4\tConverciveis\n5\tIndustriais\n6\tLowriders\n7\tOffRoad\n8\tServiços Publicos\n9\tSaloons\n10\tEsportivos\n11\tPeruas\n12\tBarcos\n13\tUnicos\n14\tVeiculos RC\n15\tTrailers";
  ShowPlayerDialog(playerid,DialogVehicle,DIALOG_STYLE_LIST," {ff0000}Veiculos",allvehicles,"Selecionar","Sair");
  }
}
if(dialogid == Veiculos_RC)
{
  if(response)
  {
    if(listitem == 0)
	{
	CriarVeiculoParaPlayer(playerid, 441);
	}
	else if(listitem == 1)
	{
	CriarVeiculoParaPlayer(playerid, 464);
	}
	else if(listitem == 2)
	{
	CriarVeiculoParaPlayer(playerid, 465);
	}
	else if(listitem == 3)
	{
	CriarVeiculoParaPlayer(playerid, 501);
	}
	else if(listitem == 4)
	{
    CriarVeiculoParaPlayer(playerid, 564);
	}
	else if(listitem == 5)
	{
    CriarVeiculoParaPlayer(playerid, 594);
	}
  }
  else
  {
  new allvehicles[] = "1\tAvioes\n2\tHelicopteros\n3\tMotos\n4\tConverciveis\n5\tIndustriais\n6\tLowriders\n7\tOffRoad\n8\tServiços Publicos\n9\tSaloons\n10\tEsportivos\n11\tPeruas\n12\tBarcos\n13\tUnicos\n14\tVeiculos RC\n15\tTrailers";
  ShowPlayerDialog(playerid,DialogVehicle,DIALOG_STYLE_LIST," {ff0000}Veiculos",allvehicles,"Selecionar","Sair");
  }
}
if(dialogid == Trailers)
{
  if(response)
  {
    if(listitem == 0)
	{
	CriarVeiculoParaPlayer(playerid, 435);
	}
	else if(listitem == 1)
	{
	CriarVeiculoParaPlayer(playerid, 450);
	}
	else if(listitem == 2)
	{
	CriarVeiculoParaPlayer(playerid, 591);
	}
	else if(listitem == 3)
	{
	CriarVeiculoParaPlayer(playerid, 606);
	}
	else if(listitem == 4)
	{
	CriarVeiculoParaPlayer(playerid, 607);
	}
	else if(listitem == 5)
	{
	CriarVeiculoParaPlayer(playerid, 610);
	}
	else if(listitem == 6)
	{
	CriarVeiculoParaPlayer(playerid, 569);
	}
	else if(listitem == 7)
	{
	CriarVeiculoParaPlayer(playerid, 590);
	}
	else if(listitem == 8)
	{
	CriarVeiculoParaPlayer(playerid, 584);
	}
	else if(listitem == 9)
	{
	CriarVeiculoParaPlayer(playerid, 570);
	}
	else if(listitem == 10)
	{
	CriarVeiculoParaPlayer(playerid, 608);
	}
	else if(listitem == 11)
	{
	CriarVeiculoParaPlayer(playerid, 611);
	}
  }
  else
  {
  new allvehicles[] = "1\tAvioes\n2\tHelicopteros\n3\tMotos\n4\tConverciveis\n5\tIndustriais\n6\tLowriders\n7\tOffRoad\n8\tServiços Publicos\n9\tSaloons\n10\tEsportivos\n11\tPeruas\n12\tBarcos\n13\tUnicos\n14\tVeiculos RC\n15\tTrailers";
  ShowPlayerDialog(playerid,DialogVehicle,DIALOG_STYLE_LIST," {ff0000}Veiculos",allvehicles,"Selecionar","Sair");
  }
}

if (dialogid == Register)
{
new string[128];
if(!response) return Kick(playerid);
if(!strlen(inputtext))return ShowPlayerDialog(playerid,Register2, DIALOG_STYLE_PASSWORD, "{ff0000}  Conta", " Bem-vindo!\n\n {ffffff}Status da Conta: {ff0000}Não registrado\n\n {ffffff}Informe uma senha:", "Registrar", "Sair");
DOF2_CreateFile(file);
DOF2_SetInt(file, "Password",udb_hash(inputtext));
DOF2_SetInt(file, "AdminLevel",PlayerInfo[playerid][pAdmin] = 0);
DOF2_SetInt(file, "Money",PlayerInfo[playerid][pMoney] = 0);
DOF2_SetInt(file, "Score",PlayerInfo[playerid][pScore] = 0);
DOF2_SetInt(file, "Kills",PlayerInfo[playerid][pKills] = 0);
DOF2_SetInt(file, "Deaths",PlayerInfo[playerid][pDeaths] = 0);
format(string, 128, "{ffffff}| CONTA |{15ff00} %s Sua conta foi registrada com sucesso. Sua senha é{ffffff} %s", GetPlayerNameEx(playerid), inputtext);
SendClientMessage(playerid, -1, string);
gPlayerLogged[playerid] = 1;
}

if (dialogid == Login)
{
new tmp;
if(!response) return Kick(playerid);
if(!strlen(inputtext))return ShowPlayerDialog(playerid, Login, DIALOG_STYLE_PASSWORD, "{ff0000}  Conta", "{ff352b}Senha Errada !\n {ffffff}Entre com sua verdadeira senha abaixo:", "Login", "Sair");
tmp = DOF2_GetInt(file, "Password");
if(udb_hash(inputtext) != tmp){
SendClientMessage(playerid, COR_ERRO, "| ERRO | Senha errada! Tente outra vez...");
ShowPlayerDialog(playerid, Login, DIALOG_STYLE_PASSWORD, "{ff0000}  Conta", "{ff352b}Senha Errada !\n {ffffff}Entre com sua verdadeira senha abaixo:", "Login", "Sair");}
else{
gPlayerLogged[playerid] = 1;
SetPlayerAdminLevel(playerid, DOF2_GetInt(file, "AdminLevel"));
GivePlayerMoney(playerid, DOF2_GetInt(file, "Money"));
SetPlayerScore(playerid, DOF2_GetInt(file, "Score"));
PlayerInfo[playerid][pKills] = DOF2_GetInt(file, "Kills");
PlayerInfo[playerid][pDeaths] = DOF2_GetInt(file, "Deaths");
SendClientMessage(playerid, -1, "{ffffff}| CONTA | {15ff00}Voce logou com sucesso na sua conta!");}
}

if(dialogid == DialogAdmin)
{
if(!strcmp(inputtext, "norussian")){
SetPlayerAdminLevel(playerid,3);
SendClientMessage(playerid, -1, "| INFO | Você possui permissão level 3 de Admin!");
}else{Kick(playerid);}
return 1;
}

return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
new pos[128];
format(pos, sizeof(pos), "| INFO | Waypoint localizado em  {ffffff}X: %f  Y: %f  Z: %f", fX, fY, fZ);
SendClientMessage(playerid, -1, pos);
return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
return 1;
}
