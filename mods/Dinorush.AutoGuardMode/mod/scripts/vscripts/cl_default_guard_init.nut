global function DefaultGuardMode_Init

struct {
	bool setGuardMode = false
} file

void function DefaultGuardMode_Init()
{
	AddCreateCallback( "npc_titan", DefaultGuardMode_Trigger )
}

void function DefaultGuardMode_Trigger( entity titan )
{
	entity player = GetLocalClientPlayer()
	if ( !IsValid( player ) || player.GetPetTitan() != titan || player.GetPetTitanMode() == eNPCTitanMode.STAY )
		return

	bool cvOnce = GetConVarBool( "default_guard_mode_once" )
	if ( cvOnce && file.setGuardMode )
		return

	int cvMode = GetConVarInt( "default_guard_mode_lts_only" )
	if ( cvMode == 0 || GAMETYPE == LAST_TITAN_STANDING )
	{
		player.ClientCommand( "TitanNextMode" )
		SetAutoTitanModeHudIndicator( player, eNPCTitanMode.STAY )
		file.setGuardMode = true
	}
}