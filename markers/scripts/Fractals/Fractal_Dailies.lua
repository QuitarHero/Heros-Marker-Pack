--Dependencies
Pack:Require("scripts/Utility/Time")

--[[
for i = 76, 100 do
  local month = "12"
  Pack:Require("scripts/Fractals/Instabs/" .. i .. "/" .. month .. ".lua")
  local someVar = tostring("_" .. i .. month)
  Debug:Print("File: " .. someVar .. " and Max Entries: " .. #HMP.FracInstabs[someVar])
end
--]]

HMP_FractalDailies = {
  CurDayOfYear = HMPtime.GetUtcTime(365),
  CurDay = os.date("!%d"),
  --Month, Day
  Tomorrow = {nil, nil},
  catStates = {
    { World:CategoryByType("HMPalpha.fractalBoard.c2.sc1"):IsVisible(), World:CategoryByType("HMPalpha.fractalBoard.c2.sc2"):IsVisible(), World:CategoryByType("HMPalpha.fractalBoard.c2.sc3"):IsVisible() },
    { World:CategoryByType("HMPalpha.fractalBoard.c3"):IsVisible() }
  },
  T4_and_CM = {
    T4_Title = {
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc1.allcmT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc2.allcmT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc3.allcmT4.c2.sc1"):GetMarkers()
    },
    T4_Instabs = {
      Names = {
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc1.allcmT4.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc2.allcmT4.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc3.allcmT4.c4.sc1"):GetMarkers()
      },
      Icons = {
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc1.allcmT4.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc2.allcmT4.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc3.allcmT4.c4.sc2"):GetMarkers()
      }
    },
    CM_Instabs = {
      Names = {
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc1.allcmT4.c5.sc1"):GetMarkers(),
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc2.allcmT4.c5.sc1"):GetMarkers(),
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc3.allcmT4.c5.sc1"):GetMarkers()
      },
      Icons = {
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc1.allcmT4.c5.sc2"):GetMarkers(),
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc2.allcmT4.c5.sc2"):GetMarkers(),
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc3.allcmT4.c5.sc2"):GetMarkers()
      }
    }
  },
  
  T4_and_Recs = {
    T4_Title = {
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc1.t4Recs.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc2.t4Recs.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc3.t4Recs.c2.sc1"):GetMarkers()
    },
    Rec_Title = {
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc1.t4Recs.c6.sc1"):GetMarkers(),
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc2.t4Recs.c6.sc1"):GetMarkers(),
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc3.t4Recs.c6.sc1"):GetMarkers()
    },
    Rec_Number = {
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc1.t4Recs.c6.sc2"):GetMarkers(),
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc2.t4Recs.c6.sc2"):GetMarkers(),
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc3.t4Recs.c6.sc2"):GetMarkers()
    },
    T4_Instabs = {
      Names = {
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc1.t4Recs.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc2.t4Recs.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc3.t4Recs.c4.sc1"):GetMarkers()
      },
      Icons = {
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc1.t4Recs.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc2.t4Recs.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc3.t4Recs.c4.sc2"):GetMarkers()
      }
    }
  },
  
  T4_Only = {
    T4_Title = {
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc1.onlyT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc2.onlyT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc3.onlyT4.c2.sc1"):GetMarkers()
    },
    T4_Instabs = {
      Names = {
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc1.onlyT4.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc2.onlyT4.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc3.onlyT4.c4.sc1"):GetMarkers(),
      },
      Icons = {
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc1.onlyT4.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc2.onlyT4.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc3.onlyT4.c4.sc2"):GetMarkers(),
      }
    }
  },
  
  Fractal_Set = {
    World:CategoryByType("HMPalpha.fractalBoard.c1.sc1.fracSet"):GetMarkers(),
    World:CategoryByType("HMPalpha.fractalBoard.c1.sc2.fracSet"):GetMarkers(),
    World:CategoryByType("HMPalpha.fractalBoard.c1.sc3.fracSet"):GetMarkers()
   },
  
  Sets = {
    T4 = {
      {96, 92, 86}, {93, 82, 79}, {94,  88, 87}, {99, 91, 84}, {96,  86, 80},
      {88, 85, 79}, {84, 83, 78}, {90,  87, 81}, {99, 92, 89}, {100, 82, 76},
      {98, 85, 81}, {96, 93, 88}, {100, 95, 94}, {89, 84, 80}, {97,  91, 90}
    },
    Recs = {
      {53, 37, 2},  {61, 28, 6},  {65, 32, 10}, {74, 34, 14}, {70, 50, 19},
      {60, 48, 15}, {66, 35, 24}, {75, 36, 21}, {67, 40, 7},  {54, 31, 8},
      {59, 39, 11}, {64, 27, 18}, {58, 30, 4},  {62, 42, 16}, {68, 47, 5}
    }
  },
  Fractals = { --Fractal strings must directly correlate to file name (without -title.png).
    {"Aetherblade",           {93,  65, 45, 14} },
    {"Aquatic_Ruins",         {76,  61, 26, 7} },
    {"Captain_Mai_Trin",      {91,  71, 42, 18} },
    {"Chaos",                 {88,  63, 30, 13} },
    {"Cliffside",             {94,  68, 46, 6} },
    {"Deepstone",             {84,  67, 33, 11} },
    {"Kinfall",               {95,  70, 38, 17} },
    {"Lonely_Tower",          {100, 75, 50, 25} },
    {"Molten_Boss",           {90,  69, 40, 10} },
    {"Molten_Furnace",        {83,  58, 39, 9} },
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
    {"Uncategorized",         {79,  62, 36, 2} },
    {"Underground_Facility",  {81,  53, 29, 8} },
    {"Urban_Battleground",    {85,  57, 31, 4} },
    {"Volcanic",              {92,  52, 28, 19, 1} },
  },
  Names = {"Adrenaline_Rush", "Afflicted",  "Boon_Overload",     "Flux_Bomb",       "Fractal_Vindicators", "Frailty",
           "Hamstrung",       "Last_Laugh", "Mists_Convergence", "No_Pain_No_Gain", "Outflanked",          "Social_Awkwardness",
           "Stick_Together",  "Sugar_Rush", "Toxic_Trail",       "Vengeance",       "We_Bleed_Fire",       "Toxic_Sickness"}
}

local Fotm = HMP_FractalDailies
Debug:Watch("Table Cat States", Fotm.T4_and_CM.T4_Title)

--Getting the "Correct" Fractal Set based on the end-user's Today / Tomorrow preferences
local function GetFractalSet(Set, dayOffset)
  if( Set + dayOffset > 14 ) then
    if( Set + dayOffset > 15 ) then
      Set = 2
    else
      Set = 1
    end
  else
    Set = Set + dayOffset
  end
  
  return Set
end

--dayOffset must be 0 (today), 1 (tomorrow), or 2 (following day)
local function Set_T4_Dailies(Set, dayOffset)
  local ComboSet = { Fotm.T4_and_CM, Fotm.T4_and_Recs, Fotm.T4_Only }
  local month, day = ( os.date("!%m", os.time() + (86400 * dayOffset) ) ), tonumber(os.date("!%d", os.time() + (86400 * dayOffset)))
  Set = GetFractalSet(Set, dayOffset)
  
  for a,b in ipairs(Fotm.Sets.T4[Set]) do
    for c,d in ipairs(Fotm.Fractals) do
      if(Fotm.Sets.T4[Set][a] == Fotm.Fractals[c][2][1]) then
        --Load the required lua "database" file
        Pack:Require("scripts/Fractals/Instabs/" .. Fotm.Fractals[c][2][1] .. "/" .. month .. ".lua")
        
        --Sets T4 Title
        for i = 1, #ComboSet do
          ComboSet[i].T4_Title[1+dayOffset][a]:SetTexture("Assets/Fracs/DailyBoard/Title Text/" .. Fotm.Fractals[c][1] .. "-title.png")
        end
        
        --Sets T4 Instabilities
        for i = 1, 3 do
          local instab = 1 + ( HMP.FracInstabs["_" .. Fotm.Sets.T4[Set][a] .. month][day][i] )
          
          for j = 1, #ComboSet do
            ComboSet[j].T4_Instabs.Names[1+dayOffset][i + ((a-1)*3) ]:SetTexture("Assets/Fracs/DailyBoard/Instabilities/" .. Fotm.Names[instab] .. ".png")
            ComboSet[j].T4_Instabs.Icons[1+dayOffset][i + ((a-1)*3) ]:SetTexture("Assets/Fracs/DailyBoard/Instabilities/" .. Fotm.Names[instab] .. "-Icon.png")
          end
        end
        
        break
      end
    end
  end
end

--dayOffset must be 0 (today), 1 (tomorrow), or 2 (following day)
local function Set_CM_Dailies(dayOffset)
  for i = 1, 6 do
    --Load the required lua "database" file
    Pack:Require("scripts/Fractals/Instabs/" .. (101-i) .. "/" .. ( os.date("!%m", os.time() + (86400 * dayOffset) ) ) .. ".lua")
    
    --Sets CM Instabilities
    for j = 1, 3 do
      local instab = 1 + ( HMP.FracInstabs["_" .. (101-i) .. os.date("!%m", os.time() + (86400 * dayOffset) )][tonumber(os.date("!%d", os.time() + (86400 * dayOffset) ))][j] )
      
      Fotm.T4_and_CM.CM_Instabs.Names[dayOffset+1][j + ((i-1)*3) ]:SetTexture("Assets/Fracs/DailyBoard/Instabilities/" .. Fotm.Names[instab] .. ".png")
      Fotm.T4_and_CM.CM_Instabs.Icons[dayOffset+1][j + ((i-1)*3) ]:SetTexture("Assets/Fracs/DailyBoard/Instabilities/" .. Fotm.Names[instab] .. "-Icon.png")
    end
  end
end

--dayOffset must be 0 (today), 1 (tomorrow), or 2 (following day)
local function Set_Rec_Dailies(Set, dayOffset)
  Set = GetFractalSet(Set, dayOffset)
  for a,b in ipairs(Fotm.Sets.Recs[Set]) do
    for c,d in ipairs(Fotm.Fractals) do
      for i = 2, #Fotm.Fractals[c][2] do
        if(Fotm.Sets.Recs[Set][a] == Fotm.Fractals[c][2][i]) then
          --Sets Rec Title
          Fotm.T4_and_Recs.Rec_Title[1+dayOffset][a]:SetTexture("Assets/Fracs/DailyBoard/Title Text/" .. Fotm.Fractals[c][1] .. "-title.png")
          Fotm.T4_and_Recs.Rec_Number[1+dayOffset][a]:SetTexture("Assets/Numbers/" .. Fotm.Fractals[c][2][i] .. ".png")
          
          break
        end
      end
    end
  end
end

--dayOffset must be 0 (today), 1 (tomorrow), or 2 (following day)
local function Set_Fractal_Set(Set, dayOffset)
  Set = GetFractalSet(Set, dayOffset)
  if( Set < 10 ) then
    Fotm.Fractal_Set[1+dayOffset][1]:SetTexture("Assets/Numbers/0.png")
    Fotm.Fractal_Set[1+dayOffset][2]:SetTexture("Assets/Numbers/" .. Set .. ".png")
  else
    Fotm.Fractal_Set[1+dayOffset][1]:SetTexture("Assets/Numbers/1.png")
    Fotm.Fractal_Set[1+dayOffset][2]:SetTexture("Assets/Numbers/" .. (Set - 10) .. ".png")
  end
end


--DEBUG FUNCTION
local function FindTomorrow()
  Fotm.Tomorrow[1] = os.date("!%m", os.time() + 86400)
  Fotm.Tomorrow[2] = os.date("!%d", os.time() + 86400)
  
  Debug:Print("Today M: " .. os.date("!%m") .. " | Tomorrow M: " .. Fotm.Tomorrow[1])
  Debug:Print("Today D: " .. os.date("!%d") .. " | Tomorrow D: " .. Fotm.Tomorrow[2])
end



function SetFractalDailies()
  local FractalSet = HMPtime.GetUtcTime(14)
  Debug:Print("Current FractalSet: " .. FractalSet)
  
  FindTomorrow()
  
  --Time function and generally accepted fractal "set" order have offsets. Conditional checks account for this.
  for i = 0, 14 do
    if(FractalSet == i) then
      if(i < 8) then
        FractalSet = FractalSet + 7
      else
        FractalSet = FractalSet - 6
      end
      break
    end
  end
  Set_CM_Dailies(0) Set_CM_Dailies(1) Set_CM_Dailies(2)
  Set_T4_Dailies(FractalSet, 0) Set_T4_Dailies(FractalSet, 1) Set_T4_Dailies(FractalSet, 2)
  Set_Rec_Dailies(FractalSet, 0) Set_Rec_Dailies(FractalSet, 1) Set_Rec_Dailies(FractalSet, 2)
  Set_Fractal_Set(FractalSet, 0) Set_Fractal_Set(FractalSet, 1) Set_Fractal_Set(FractalSet, 2)
end

--This should only run when the end-user has a real-life day change while inside the Mistlock Observatory
local function ChangeMarkerTextures()
  local ref = { Fotm.T4_and_CM.T4_Title, Fotm.T4_and_CM.T4_Instabs.Names, Fotm.T4_and_CM.T4_Instabs.Icons, Fotm.T4_and_CM.CM_Instabs.Names, Fotm.T4_and_CM.CM_Instabs.Icons, Fotm.T4_and_Recs.T4_Title, Fotm.T4_and_Recs.Rec_Title, Fotm.T4_and_Recs.Rec_Number, Fotm.T4_and_Recs.T4_Instabs.Names, Fotm.T4_and_Recs.T4_Instabs.Icons, Fotm.T4_Only.T4_Title, Fotm.T4_Only.T4_Instabs.Names, Fotm.T4_Only.T4_Instabs.Icons, Fotm.Fractal_Set }
  
  for a,b in ipairs(ref) do
    for c,d in ipairs(ref[a]) do
      if( c > 1 ) then
        for e,f in ipairs(ref[a][c]) do
          ref[a][(c-1)][e].Texture = ref[a][c][e].Texture
        end
      end
    end
  end
end

local function tick_CheckCategory(gameTime)
  local catCheck = { World:CategoryByType("HMPalpha.fractalBoard.c2.sc1"):IsVisible(), World:CategoryByType("HMPalpha.fractalBoard.c2.sc2"):IsVisible(), World:CategoryByType("HMPalpha.fractalBoard.c2.sc3"):IsVisible() }
  
  --Checks if the day has changed while the end-user has been in the Mistlock Observatory
  --If it has changed, we change the markers displayed
  if( os.date("!%d") ~= Fotm.CurDay ) then
    Fotm.CurDay = os.date("!%d")
    ChangeMarkerTextures()
  end
  
  --Checks Fractal Combo Category States
  for a,b in ipairs(catCheck) do
    if( catCheck[a] ~= Fotm.catStates[1][a] ) then
      local type = {"allcmT4", "t4Recs", "onlyT4"}
      Fotm.catStates[1][a] = catCheck[a]
      
      if( catCheck[a] ) then
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc1." .. type[a]):Show()
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc2." .. type[a]):Show()
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc3." .. type[a]):Show()
      else
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc1." .. type[a]):Hide()
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc2." .. type[a]):Hide()
        World:CategoryByType("HMPalpha.fractalBoard.c1.sc3." .. type[a]):Hide()
      end
    end
  end
  
  --Checks Fractal Set Category State
  if( World:CategoryByType("HMPalpha.fractalBoard.c3"):IsVisible() ~= Fotm.catStates[2][1] ) then
    Fotm.catStates[2][1] = World:CategoryByType("HMPalpha.fractalBoard.c3"):IsVisible()
    
    if( World:CategoryByType("HMPalpha.fractalBoard.c3"):IsVisible() ) then
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc1.fracSet"):Show()
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc2.fracSet"):Show()
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc3.fracSet"):Show()
    else
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc1.fracSet"):Hide()
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc2.fracSet"):Hide()
      World:CategoryByType("HMPalpha.fractalBoard.c1.sc3.fracSet"):Hide()
    end
  end
end

Event:OnTick(tick_CheckCategory)