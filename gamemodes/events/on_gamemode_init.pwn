
initDatabaseConnection()
{
    // Conn = mysql_connect(HOST, USER, PWD, DB);
	// if(mysql_errno(Conn) != 0) {
	// 	new errorStr[255];
	// 	mysql_error(errorStr, sizeof(errorStr), Conn);
	// 	printf("[SERVER] Database connection failure: %s", errorStr);
	// } 

    print("initiating database");
}

public OnGameModeInit()
{
    initDatabaseConnection();
}