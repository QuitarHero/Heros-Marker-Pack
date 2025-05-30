--Dependencies
Pack:Require("scripts/Utility/Time")

--[[
for i = 76, 100 do
  Pack:Require("scripts/Fractals/Instabs/" .. i .. "/" .. os.date("!%m") .. ".lua")
  local someVar = tostring("_" .. i .. os.date("!%m"))
  Debug:Print("File: " .. someVar .. " and Max Entries: " .. #HMP.FracInstabs[someVar])
end
--]]

HMP_FractalDailies = {
  CurDayOfYear = HMPtime.GetUtcTime(365),
  
  T4_and_CM = {
    T4_Title = { World:MarkerByGuid("HhGgdWL9yESOC7j0q0nWog=="), World:MarkerByGuid("ICHD0UV5P02KdQrmxBWPlg=="), World:MarkerByGuid("divyfIMstkejRUsUJzdb5g==") },
    T4_Instabs = {
      Names = {
        { World:MarkerByGuid("l4oTq2/dmkW/ECmII4Mixg=="), World:MarkerByGuid("4g+eIRRCGUGLWe7Ocb+icg=="), World:MarkerByGuid("RcYAy2cgQEadsgvp0gBOOg==") },
        { World:MarkerByGuid("qn2dMqNnEUex/BXk0rpwLg=="), World:MarkerByGuid("QB0tg3P93EOFG1AgEjtvpg=="), World:MarkerByGuid("/Nz+BCKpEU+IJhLiT7wnfg==") },
        { World:MarkerByGuid("0wOkWYB7mkG7Ng20f5we5Q=="), World:MarkerByGuid("VMSX53Y/CEeRGH/6kZbnBg=="), World:MarkerByGuid("kKY/hnXxIEe6ONdHeyS2FA==") }
      },
      Icons = {
        { World:MarkerByGuid("IE+NktzH5kqFCLzicjNWsQ=="), World:MarkerByGuid("as5HDwuoH0+2kqu7XY8SbA=="), World:MarkerByGuid("KMjopgfUs0KgWNYZssdrNw==") },
        { World:MarkerByGuid("1pYGG423xkijtwmbKO1Syg=="), World:MarkerByGuid("8FVktJMidUqbjRAD4Qf3wg=="), World:MarkerByGuid("6FPF5id/WkyTB9QSQ7kkCw==") },
        { World:MarkerByGuid("wglfDZsdS02vt2TyITLvhw=="), World:MarkerByGuid("T3qKNEkGM029tny2deOwyw=="), World:MarkerByGuid("2LtHGUTcUU2Sym85W+C0SA==") }
      }
    },
    CM_Instabs = {
      Names = {
        { World:MarkerByGuid("RQDSAVR0IUy19jKh9pF/6g=="), World:MarkerByGuid("Q1KQiNTGM06Er6E91x+Vcw=="), World:MarkerByGuid("PYNB9BeaV0uCWLFo3/iqNw==") },
        { World:MarkerByGuid("JHjvsK1YK0iyPe8pk/gL7A=="), World:MarkerByGuid("Yj4legNhzEKJNyFRtIWeKQ=="), World:MarkerByGuid("Q4Gg/hDamEaM7gDvWRk2rQ==") },
        { World:MarkerByGuid("LlhoCegvK0aHMuMJGLwfwg=="), World:MarkerByGuid("K0mkPjX/D0KHFqNehqehaQ=="), World:MarkerByGuid("7HLbXuUDREuJ/7hF2iZUuw==") },
        { World:MarkerByGuid("2f1o4KGlYU2o2K/bczBPmw=="), World:MarkerByGuid("IQam7KU8BUSoMTmfQMeAXg=="), World:MarkerByGuid("bzi+hifZmk+egPcRcFhBQw==") },
        { World:MarkerByGuid("jiloRg7YCECx8QelubktuQ=="), World:MarkerByGuid("i3q7kCs4hUO8z3v2ViBccA=="), World:MarkerByGuid("Z5hnUrOiDEWAOkw+/OKG3A==") },
        { World:MarkerByGuid("86aIzQzz+UyzXFc02SW4OA=="), World:MarkerByGuid("Tz2cp1ZSiUarw2LOrXFtBQ=="), World:MarkerByGuid("tr9hUJhD6EySH1Tri6QEPw==") }
      },
      Icons = {
        { World:MarkerByGuid("dgbkJswTQ0+7sZQNQQxpug=="), World:MarkerByGuid("vMkVN1syYUS+TatRh7kIhw=="), World:MarkerByGuid("Z24UaJVZ20ivMBoXgRlnog==") },
        { World:MarkerByGuid("nCq0mfnP/k+6hfkOXwtpQw=="), World:MarkerByGuid("Fq8cTi/wLkmCLV3zs+n+oQ=="), World:MarkerByGuid("Y7vnYUlqw0qITADB8JQklA==") },
        { World:MarkerByGuid("iKRWKaCuyE6+6bhDN0f5sQ=="), World:MarkerByGuid("Ty1Mutuh40ytf+GiiTzvsA=="), World:MarkerByGuid("ZfBmbo3wpEGniuAEgD109w==") },
        { World:MarkerByGuid("tdjb5UwUKESnEONDo6J2jA=="), World:MarkerByGuid("bqCK7RYnWkCfRdlxHwN4DQ=="), World:MarkerByGuid("eer4ysZKiE+MjGMel1WzDw==") },
        { World:MarkerByGuid("puaA6Gtp2kG+eCiWeevl5w=="), World:MarkerByGuid("P1SXeH92G0uvn+ZHqFYcfw=="), World:MarkerByGuid("mOBNq1oC1kOtxfdEZdHfPg==") },
        { World:MarkerByGuid("7JmmuljCA0yRntsbWnJdFA=="), World:MarkerByGuid("wYz/ocJULEWISizE6nbm5g=="), World:MarkerByGuid("Sg+GZuxheEq+JFr7LLxi1A==") }
      }
    }
  },
  
  T4_and_Recs = {
    T4_Title = { World:MarkerByGuid("j7/i7AYJs0yDB4dbk88/1g=="), World:MarkerByGuid("uyN1nCX5ykeAREAgFjn6dg=="), World:MarkerByGuid("if4EzJE4dEWCOmOUYjlInA==") },
    Rec_Title = { World:MarkerByGuid("tb6jPM7g+EadZxrLtwZuUQ=="), World:MarkerByGuid("sLpsoQup5EGtlxINvRR70A=="), World:MarkerByGuid("CYraBwUSpEua5rO7obK0Hg==") },
    Rec_Number = { World:MarkerByGuid("gVelhAPLFkS4sAFQSgwdvw=="), World:MarkerByGuid("+bhr+xFFkE6IbjHFa8uT1Q=="), World:MarkerByGuid("jGxgN+77nkG+afcwYykbeQ==") },
    T4_Instabs = {
      Names = {
        { World:MarkerByGuid("HOnEkbn4J06NyrraeLkpHg=="), World:MarkerByGuid("2UVo4Nf3s0mmq6mOsdCykA=="), World:MarkerByGuid("KihjplR/Skq9HYE138W6zw==") },
        { World:MarkerByGuid("Cb/D8L2sw02OYjv/IiCWSg=="), World:MarkerByGuid("GnJnKOXiSka7QrtuwZBmOQ=="), World:MarkerByGuid("tXobATiLCUGjFIp43+pf/A==") },
        { World:MarkerByGuid("eVQNCha4nUmVeP8OkBU4kQ=="), World:MarkerByGuid("eVQNCha4nUmVeP8OkBU4kQ=="), World:MarkerByGuid("C37fCushdkenMcT2lvURvA==") }
      },
      Icons = {
        { World:MarkerByGuid("h0lWkL9NJEeyimMjJUEopw=="), World:MarkerByGuid("Elf7DTYfCEaNz1UZBxm3eQ=="), World:MarkerByGuid("u2W7xoN7nkK+QNDYrjccVw==") },
        { World:MarkerByGuid("SXEWtAgRiUSGvN+NcAPE6Q=="), World:MarkerByGuid("tsGv3cRnzE2PFRc/K0mDag=="), World:MarkerByGuid("p/Jx2/G1GEmozCj3s6dgiw==") },
        { World:MarkerByGuid("t/ivnTvAr0y7erqkscKfNA=="), World:MarkerByGuid("tSocjU2lC0y9al8hl7HPDg=="), World:MarkerByGuid("/MElFvZuLkyKALRS1EX+Kg==") }
      }
    }
  },
  
  T4_Only = {
    T4_Title = { World:MarkerByGuid("qhZF3SxRQ0mV+E7RQf6Haw=="), World:MarkerByGuid("HMydTh5KvUCjhCKetqoxLg=="), World:MarkerByGuid("S4lRtPqJs0Wli7/VlHtMug==") },
    T4_Instabs = {
      Names = {
        { World:MarkerByGuid("pLkBxDG6F0GbVpfcCTIsqA=="), World:MarkerByGuid("flDMaQ5qSkGVCPKf0MEVPw=="), World:MarkerByGuid("AJgkQrEvcEWjrHoGyGHz9A==") },
        { World:MarkerByGuid("FTDT+BKKe0+l8wSwD5UIXA=="), World:MarkerByGuid("DkzBwEm5q0OoUTQYZ6NxTg=="), World:MarkerByGuid("h6v6owvdxU2dYF9Y3q4h8w==") },
        { World:MarkerByGuid("MCImqhw2IkeekkAvHtQhlw=="), World:MarkerByGuid("qYwPeotorUaO8e7vwPQF2Q=="), World:MarkerByGuid("B2ytz8bKekaK56raPulXxw==") }
      },
      Icons = {
        { World:MarkerByGuid("QttUAPNC706VeTIB1o5eMg=="), World:MarkerByGuid("Bgo0djIN8Uu3T+p9DKD6kw=="), World:MarkerByGuid("/3uUL9xwIUmbrfsD1E4IxA==") },
        { World:MarkerByGuid("23O5MSu2b0WjNtzw9lsQYg=="), World:MarkerByGuid("0kkTd1Y9OkuQlwJXe8l6IA=="), World:MarkerByGuid("szQeZCLuLEOQCvXZwRLlAQ==") },
        { World:MarkerByGuid("Hpsb4CnmdkuGcVzMB5w4xQ=="), World:MarkerByGuid("EH44cWODN06kSctDvWzq2g=="), World:MarkerByGuid("iGAdEsuUtUyB25BRLLR7VQ==") }
      }
    }
  },
  
  Fractal_Set = { World:MarkerByGuid("xO1yHv8CR0SlVZKkdzZ8gw=="), World:MarkerByGuid("IdZhDQJ/K06zN4zHnPheJA==") },
  
  Sets = { --UPDATE after June 3rd !!!!!
    T4 = {
      {96, 92, 86}, {93, 91, 82}, {94,  88, 87}, {99, 95, 84}, {96,  86, 80},
      {91, 88, 85}, {84, 83, 78}, {90,  87, 81}, {99, 92, 89}, {100, 82, 76},
      {98, 85, 81}, {96, 93, 88}, {100, 94, 78}, {89, 84, 80}, {97,  95, 90}
    },
    Recs = {
      {53, 37, 2},  {61, 28, 6},  {65, 32, 10}, {74, 34, 14}, {57, 50, 19},
      {60, 41, 15}, {66, 35, 24}, {75, 36, 21}, {67, 40, 12}, {54, 31, 8},
      {59, 39, 11}, {64, 27, 18}, {58, 30, 4},  {62, 42, 16}, {68, 47, 5}
    }
  },
  Fractals = { --Fractal strings must directly correlate to file name (without -title.png).
    --UPDATE after June 3rd !!!!!
    {"Aetherblade",           {93,  70, 65, 45, 14} },
    {"Aquatic_Ruins",         {76,  61, 26, 7} },
    {"Captain_Mai_Trin",      {95,  71, 42, 18} },
    {"Chaos",                 {88,  63, 38, 30, 13} },
    {"Cliffside",             {94,  68, 46, 6} },
    {"Deepstone",             {84,  67, 33, 11} },
    {"Lonely_Tower",          {100, 75, 50, 25} },
    {"Molten_Boss",           {90,  69, 40, 10} },
    {"Molten_Furnace",        {83,  58, 39, 17, 9} },
    {"Nightmare",             {96,  72, 47, 22} },
    {"Shattered_Observatory", {97,  73, 48, 23} },
    {"Silent_Surf",           {99,  66, 43, 21} },
    {"Sirens_Reef",           {78,  54, 37, 12} },
    {"Snowblind",             {86,  51, 27, 3} },
    {"Solid_Ocean",           {80,  60, 44, 35, 20} },
    {"Sunqua_Peak",           {98,  74, 49, 24} },
    {"Swampland",             {89,  77, 56, 32, 5} },
    {"Thaumanova_Reactor",    {82,  64, 55, 34, 15} },
    {"Twilight_Oasis",        {87,  59, 41, 16} },
    {"Uncategorized",         {91,  79, 62, 36, 2} },
    {"Underground_Facility",  {81,  53, 29, 8} },
    {"Urban_Battleground",    {85,  57, 31, 4} },
    {"Volcanic",              {92,  52, 28, 19, 1} },
  },
  Names = {"Adrenaline_Rush", "Afflicted",  "Boon_Overload",     "Flux_Bomb",       "Fractal_Vindicators", "Frailty",
           "Hamstrung",       "Last_Laugh", "Mists_Convergence", "No_Pain_No_Gain", "Outflanked",          "Social_Awkwardness",
           "Stick_Together",  "Sugar_Rush", "Toxic_Trail",       "Vengeance",       "We_Bleed_Fire",       "Toxic_Sickness"}
}

local Fotm = HMP_FractalDailies

local function Set_T4_Dailies(Set)
  local ComboSet = { Fotm.T4_and_CM, Fotm.T4_and_Recs, Fotm.T4_Only }
  
  for a,b in ipairs(Fotm.Sets.T4[Set]) do
    for c,d in ipairs(Fotm.Fractals) do
      if(Fotm.Sets.T4[Set][a] == Fotm.Fractals[c][2][1]) then
        --Load the required lua "database" file
        Pack:Require("scripts/Fractals/Instabs/" .. Fotm.Fractals[c][2][1] .. "/" .. os.date("!%m") .. ".lua")
        
        --Sets T4 Title
        for i = 1, #ComboSet do
          ComboSet[i].T4_Title[a]:SetTexture("Assets/Fracs/DailyBoard/Title Text/" .. Fotm.Fractals[c][1] .. "-title.png")
        end
        
        --Sets T4 Instabilities
        for i = 1, 3 do
          local instab = 1 + ( HMP.FracInstabs["_" .. Fotm.Sets.T4[Set][a] .. os.date("!%m")][tonumber(os.date("!%d"))][i] )
          
          for j = 1, #ComboSet do
            ComboSet[j].T4_Instabs.Names[a][i]:SetTexture("Assets/Fracs/DailyBoard/Instabilities/" .. Fotm.Names[instab] .. ".png")
            ComboSet[j].T4_Instabs.Icons[a][i]:SetTexture("Assets/Fracs/DailyBoard/Instabilities/" .. Fotm.Names[instab] .. "-Icon.png")
          end
        end
        
        break
      end
    end
  end
end

local function Set_CM_Dailies()
  for i = 1, 6 do
    --Load the required lua "database" file
    Pack:Require("scripts/Fractals/Instabs/" .. (101-i) .. "/" .. os.date("!%m") .. ".lua")
    
    --Sets CM Instabilities
    for j = 1, 3 do
      local instab = 1 + ( HMP.FracInstabs["_" .. (101-i) .. os.date("!%m")][tonumber(os.date("!%d"))][j] )
      
      Fotm.T4_and_CM.CM_Instabs.Names[i][j]:SetTexture("Assets/Fracs/DailyBoard/Instabilities/" .. Fotm.Names[instab] .. ".png")
      Fotm.T4_and_CM.CM_Instabs.Icons[i][j]:SetTexture("Assets/Fracs/DailyBoard/Instabilities/" .. Fotm.Names[instab] .. "-Icon.png")
    end
  end
end

local function Set_Rec_Dailies(Set)
  for a,b in ipairs(Fotm.Sets.Recs[Set]) do
    for c,d in ipairs(Fotm.Fractals) do
      for i = 2, #Fotm.Fractals[c][2] do
        if(Fotm.Sets.Recs[Set][a] == Fotm.Fractals[c][2][i]) then
          --Sets Rec Title
          Fotm.T4_and_Recs.Rec_Title[a]:SetTexture("Assets/Fracs/DailyBoard/Title Text/" .. Fotm.Fractals[c][1] .. "-title.png")
          Fotm.T4_and_Recs.Rec_Number[a]:SetTexture("Assets/Numbers/" .. Fotm.Fractals[c][2][i] .. ".png")
          
          break
        end
      end
    end
  end
end

local function Set_Fractal_Set(Set)
  if( Set < 10 ) then
    Fotm.Fractal_Set[1]:SetTexture("Assets/Numbers/0.png")
    Fotm.Fractal_Set[2]:SetTexture("Assets/Numbers/" .. Set .. ".png")
  else
    Fotm.Fractal_Set[1]:SetTexture("Assets/Numbers/1.png")
    Fotm.Fractal_Set[2]:SetTexture("Assets/Numbers/" .. (Set - 10) .. ".png")
  end
end

function SetFractalDailies()
  local FractalSet = HMPtime.GetUtcTime(14)
  Debug:Print("Current FractalSet: " .. FractalSet)
  
  Set_CM_Dailies()
  --Time function and generally accepted fractal "set" order have offsets. Conditional checks account for this.
  --DOUBLE CHECK after June 3rd !!!!!
  for i = 0, 14 do
    if(FractalSet == i) then
      if(i < 8) then
        Set_T4_Dailies(FractalSet + 8)
        Set_Rec_Dailies(FractalSet + 8)
        Set_Fractal_Set(FractalSet + 8)
      else
        Set_T4_Dailies(FractalSet - 7)
        Set_Rec_Dailies(FractalSet - 7)
        Set_Fractal_Set(FractalSet - 7)
      end
      break
    end
  end
end