global function DefaultGuardMode_AddModSettings

void function DefaultGuardMode_AddModSettings()
{
    ModSettings_AddModTitle( "Default Guard Mode" )
    ModSettings_AddModCategory( "Options" )
    ModSettings_AddEnumSetting( "default_guard_mode_lts_only", "LTS Only", ["Disabled", "Enabled"] )
    ModSettings_AddEnumSetting( "default_guard_mode_once", "Only on First Drop", ["Disabled", "Enabled"] )
}