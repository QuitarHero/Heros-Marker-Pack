--Top-level Category
local HMP_MainMenu = Menu:Add("Hero's Pack Info", nil, false, false, nil)
HMP_MainMenu:Add("Developer: QuitarHero.1645", nil, false, false, "Additional assistance from wulfy.6251,\nNoro.2879 and my [TKoJ] guildmates.")
--Marker Pack Links
HMP_MainMenu:Add("Latest Marker Release (v2.7.10)", function (Copy) User.SetClipboard("https://github.com/QuitarHero/Heros-Marker-Pack/releases/latest", "Marker Pack Release Log copied to clipboard.") end, false, false, "Copies the latest marker pack\nrelease log to your clipboard.")
HMP_MainMenu:Add("Marker Pack Wiki", function (Copy) User.SetClipboard("https://github.com/QuitarHero/Heros-Marker-Pack/wiki", "Marker Wiki's Home Page copied to clipboard.") end, false, false, "Copies the marker wiki's Home\npage to your clipboard.")
--Timer Pack Links
HMP_MainMenu:Add("Latest Timer Release", function (Copy) User.SetClipboard("https://github.com/QuitarHero/Hero-Timers/releases/latest", "Timer Pack Release Log copied to clipboard.") end, false, false, "Copies the latest timer pack\nrelease log to your clipboard.")
HMP_MainMenu:Add("Timer Pack Wiki", function (Copy) User.SetClipboard("https://github.com/QuitarHero/Hero-Timers/wiki", "Timer Wiki's Home Page copied to clipboard.") end, false, false, "Copies the timer wiki's Home\npage to your clipboard.")
--Pack Script Toggle
HMP_MainMenu:Add("Pack Script Toggle", TogglePackScriptToggle, true, GetBool("PackScriptToggle"), "If enabled, allows all pack scripts to run.\nIf disabled, prevents most pack scripts from running.\nRequires a Blish HUD restart or 'Reload Markers' to take effect.")