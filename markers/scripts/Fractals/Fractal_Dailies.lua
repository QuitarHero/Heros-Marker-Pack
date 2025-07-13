--Dependencies
Pack:Require("scripts/Utility/Time")

HMP_FractalDailies = {
  CurDay = os.date("!%d"),
  CurSet = 0,
  catStates = { -- Day State / Combo State / Fractal Set State / Slaying State
    { World:CategoryByType("HMP.Daily_Fractals.c1.sc1"):IsVisible(), World:CategoryByType("HMP.Daily_Fractals.c1.sc2"):IsVisible() },
    { World:CategoryByType("HMP.Daily_Fractals.c2.sc1"):IsVisible(), World:CategoryByType("HMP.Daily_Fractals.c2.sc2"):IsVisible(), World:CategoryByType("HMP.Daily_Fractals.c2.sc3"):IsVisible() },
    { World:CategoryByType("HMP.Daily_Fractals.c3.sc1"):IsVisible(), World:CategoryByType("HMP.Daily_Fractals.c3.sc2"):IsVisible(), World:CategoryByType("HMP.Daily_Fractals.c3.sc3"):IsVisible(), World:CategoryByType("HMP.Daily_Fractals.c3.sc4"):IsVisible() },
    { World:CategoryByType("HMP.Daily_Fractals.c4.sc1"):IsVisible() }
  },
  Dir = {
    "Assets/Fracs/Dailies/Title Text/", "Assets/Fracs/Dailies/Instabilities/", "Assets/Fracs/Dailies/Slaying/", "Assets/Numbers/Regular/"
  },
  T4_and_CM = {
    T4_Title = {
      World:CategoryByType("HMP.Daily_Fractals.hiddenC1.allcmT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC2.allcmT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC3.allcmT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC4.allcmT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC5.allcmT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC6.allcmT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC7.allcmT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC8.allcmT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC9.allcmT4.c2.sc1"):GetMarkers()
    },
    T4_Instabs = {
      Names = {
        World:CategoryByType("HMP.Daily_Fractals.hiddenC1.allcmT4.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC2.allcmT4.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC3.allcmT4.c4.sc1"):GetMarkers()
      },
      Icons = {
        World:CategoryByType("HMP.Daily_Fractals.hiddenC1.allcmT4.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC2.allcmT4.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC3.allcmT4.c4.sc2"):GetMarkers()
      }
    },
    T4_Slaying = {
      Names = {
        World:CategoryByType("HMP.Daily_Fractals.hiddenC4.allcmT4.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC5.allcmT4.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC6.allcmT4.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC7.allcmT4.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC8.allcmT4.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC9.allcmT4.c4.sc1"):GetMarkers()
      },
      Icons = {
        World:CategoryByType("HMP.Daily_Fractals.hiddenC4.allcmT4.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC5.allcmT4.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC6.allcmT4.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC7.allcmT4.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC8.allcmT4.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC9.allcmT4.c4.sc2"):GetMarkers()
      }
    },
    CM_Instabs = {
      Names = {
        World:CategoryByType("HMP.Daily_Fractals.hiddenC1.allcmT4.c5.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC2.allcmT4.c5.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC3.allcmT4.c5.sc1"):GetMarkers()
      },
      Icons = {
        World:CategoryByType("HMP.Daily_Fractals.hiddenC1.allcmT4.c5.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC2.allcmT4.c5.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC3.allcmT4.c5.sc2"):GetMarkers()
      }
    },
    CM_Slaying = {
      Names = {
        World:CategoryByType("HMP.Daily_Fractals.hiddenC4.allcmT4.c5.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC5.allcmT4.c5.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC6.allcmT4.c5.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC7.allcmT4.c5.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC8.allcmT4.c5.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC9.allcmT4.c5.sc1"):GetMarkers()
      },
      Icons = {
        World:CategoryByType("HMP.Daily_Fractals.hiddenC4.allcmT4.c5.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC5.allcmT4.c5.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC6.allcmT4.c5.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC7.allcmT4.c5.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC8.allcmT4.c5.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC9.allcmT4.c5.sc2"):GetMarkers()
      }
    }
  },
  
  T4_and_Recs = {
    T4_Title = {
      World:CategoryByType("HMP.Daily_Fractals.hiddenC1.t4Recs.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC2.t4Recs.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC3.t4Recs.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC4.t4Recs.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC5.t4Recs.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC6.t4Recs.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC7.t4Recs.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC8.t4Recs.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC9.t4Recs.c2.sc1"):GetMarkers()
    },
    Rec_Title = {
      World:CategoryByType("HMP.Daily_Fractals.hiddenC1.t4Recs.c6.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC2.t4Recs.c6.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC3.t4Recs.c6.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC4.t4Recs.c6.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC5.t4Recs.c6.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC6.t4Recs.c6.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC7.t4Recs.c6.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC8.t4Recs.c6.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC9.t4Recs.c6.sc1"):GetMarkers()
    },
    Rec_Number = {
      World:CategoryByType("HMP.Daily_Fractals.hiddenC1.t4Recs.c6.sc2"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC2.t4Recs.c6.sc2"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC3.t4Recs.c6.sc2"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC4.t4Recs.c6.sc2"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC5.t4Recs.c6.sc2"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC6.t4Recs.c6.sc2"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC7.t4Recs.c6.sc2"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC8.t4Recs.c6.sc2"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC9.t4Recs.c6.sc2"):GetMarkers()
    },
    T4_Instabs = {
      Names = {
        World:CategoryByType("HMP.Daily_Fractals.hiddenC1.t4Recs.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC2.t4Recs.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC3.t4Recs.c4.sc1"):GetMarkers()
      },
      Icons = {
        World:CategoryByType("HMP.Daily_Fractals.hiddenC1.t4Recs.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC2.t4Recs.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC3.t4Recs.c4.sc2"):GetMarkers()
      }
    },
    T4_Slaying = {
      Names = {
        World:CategoryByType("HMP.Daily_Fractals.hiddenC4.t4Recs.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC5.t4Recs.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC6.t4Recs.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC7.t4Recs.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC8.t4Recs.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC9.t4Recs.c4.sc1"):GetMarkers()
      },
      Icons = {
        World:CategoryByType("HMP.Daily_Fractals.hiddenC4.t4Recs.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC5.t4Recs.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC6.t4Recs.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC7.t4Recs.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC8.t4Recs.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC9.t4Recs.c4.sc2"):GetMarkers()
      }
    }
  },
  
  T4_Only = {
    T4_Title = {
      World:CategoryByType("HMP.Daily_Fractals.hiddenC1.onlyT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC2.onlyT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC3.onlyT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC4.onlyT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC5.onlyT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC6.onlyT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC7.onlyT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC8.onlyT4.c2.sc1"):GetMarkers(),
      World:CategoryByType("HMP.Daily_Fractals.hiddenC9.onlyT4.c2.sc1"):GetMarkers()
    },
    T4_Instabs = {
      Names = {
        World:CategoryByType("HMP.Daily_Fractals.hiddenC1.onlyT4.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC2.onlyT4.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC3.onlyT4.c4.sc1"):GetMarkers()
      },
      Icons = {
        World:CategoryByType("HMP.Daily_Fractals.hiddenC1.onlyT4.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC2.onlyT4.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC3.onlyT4.c4.sc2"):GetMarkers()
      }
    },
    T4_Slaying = {
      Names = {
        World:CategoryByType("HMP.Daily_Fractals.hiddenC4.onlyT4.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC5.onlyT4.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC6.onlyT4.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC7.onlyT4.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC8.onlyT4.c4.sc1"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC9.onlyT4.c4.sc1"):GetMarkers()
      },
      Icons = {
        World:CategoryByType("HMP.Daily_Fractals.hiddenC4.onlyT4.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC5.onlyT4.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC6.onlyT4.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC7.onlyT4.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC8.onlyT4.c4.sc2"):GetMarkers(),
        World:CategoryByType("HMP.Daily_Fractals.hiddenC9.onlyT4.c4.sc2"):GetMarkers()
      }
    }
  },
  
  Fractal_Set = {
    World:CategoryByType("HMP.Daily_Fractals.hiddenC1.fracSet"):GetMarkers(),
    World:CategoryByType("HMP.Daily_Fractals.hiddenC2.fracSet"):GetMarkers(),
    World:CategoryByType("HMP.Daily_Fractals.hiddenC3.fracSet"):GetMarkers(),
    World:CategoryByType("HMP.Daily_Fractals.hiddenC4.fracSet"):GetMarkers(),
    World:CategoryByType("HMP.Daily_Fractals.hiddenC5.fracSet"):GetMarkers(),
    World:CategoryByType("HMP.Daily_Fractals.hiddenC6.fracSet"):GetMarkers(),
    World:CategoryByType("HMP.Daily_Fractals.hiddenC7.fracSet"):GetMarkers(),
    World:CategoryByType("HMP.Daily_Fractals.hiddenC8.fracSet"):GetMarkers(),
    World:CategoryByType("HMP.Daily_Fractals.hiddenC9.fracSet"):GetMarkers()
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
    },
    CM = { 8, 13, 17, 12, 11, 7 }
  },
  Fractals = { --Fractal strings must directly correlate to file name (without -title.png).
    {"Aetherblade",           {93,  65, 45, 14},     { {"Scarlet_Armies", "Force", "Impact"},          {"Inquest", "Force", "Mad_Scientists"} } },
    {"Aquatic_Ruins",         {76,  61, 26, 7},      { {"Scarlet_Armies", "Force", "Serpent_Slaying"}, {"Scarlet_Armies", "Force", "Serpent_Slaying"} } },
    {"Captain_Mai_Trin",      {91,  71, 42, 18},     { {"Sharp_Stone", "Force", "Impact"},             {"Sharp_Stone", "Force", "Impact"} } },
    {"Chaos",                 {88,  63, 30, 13},     { {"Scarlet_Armies", "Force", "Impact"},          {"Scarlet_Armies", "Force", "Impact"} } },
    {"Cliffside",             {94,  68, 46, 6},      { {"Outlaw", "Force", "Justice"},                 {"Outlaw", "Force", "Justice"} } },
    {"Deepstone",             {84,  67, 33, 11},     { {"Sharp_Stone", "Force", "Impact"},             {"Sharp_Stone", "Force", "Impact"} } },
    {"Kinfall",               {95,  70, 38, 17},     { {"Ice_Brood", "Force", "Icebrood_Slaying"},     {"Ice_Brood", "Force", "Icebrood_Slaying"} } },
    {"Lonely_Tower",          {100, 75, 50, 25},     { {"Sharp_Stone", "Force", "Impact"},             {"Sharp_Stone", "Force", "Demon_Slaying"} } },
    {"Molten_Boss",           {90,  69, 40, 10},     { {"Scarlet_Armies", "Force", "Impact"},          {"Scarlet_Armies", "Force", "Impact"} } },
    {"Molten_Furnace",        {83,  58, 39, 9},      { {"Scarlet_Armies", "Force", "Impact"},          {"Dredge", "Force", "Sorrow"} } },
    {"Nightmare",             {96,  72, 47, 22},     { {"Scarlet_Armies", "Force", "Impact"},          {"Scarlet_Armies", "Force", "Serpent_Slaying"} } },
    {"Shattered_Observatory", {97,  73, 48, 23},     { {"Sharp_Stone", "Force", "Impact"},             {"Scarlet_Armies", "Force", "Impact"} } },
    {"Silent_Surf",           {99,  66, 43, 21},     { {"Sharp_Stone", "Force", "Impact"},             {"Sharp_Stone", "Force", "Impact"} } },
    {"Sirens_Reef",           {78,  54, 37, 12},     { {"Sharp_Stone", "Force", "Impact"},             {"Sharp_Stone", "Force", "Impact"} } },
    {"Snowblind",             {86,  51, 27, 3},      { {"Sons_of_Svanir", "Night", "Wrath"},           {"Sons_of_Svanir", "Night", "Wrath"} } },
    {"Solid_Ocean",           {80,  60, 44, 35, 20}, { {"Elemental", "Elemental_Slaying", "Night"},    {"Elemental", "Elemental_Slaying", "Night"} } },
    {"Sunqua_Peak",           {98,  74, 49, 24},     { {"Sharp_Stone", "Force", "Impact"},             {"Sharp_Stone", "Force", "Night"} } },
    {"Swampland",             {89,  77, 56, 32, 5},  { {"Sharp_Stone", "Force", "Night"},              {"Sharp_Stone", "Force", "Night"} } },
    {"Thaumanova_Reactor",    {82,  64, 55, 34, 15}, { {"Sharp_Stone", "Force", "Impact"},             {"Sharp_Stone", "Force", "Impact"} } },
    {"Twilight_Oasis",        {87,  59, 41, 16},     { {"Sharp_Stone", "Force", "Night"},              {"Sharp_Stone", "Force", "Night"} } },
    {"Uncategorized",         {79,  62, 36, 2},      { {"Sharp_Stone", "Force", "Impact"},             {"Inquest", "Force", "Mad_Scientists"} } },
    {"Underground_Facility",  {81,  53, 29, 8},      { {"Dredge", "Sorrow", "Night"},                  {"Elemental", "Elemental_Slaying", "Night"} } },
    {"Urban_Battleground",    {85,  57, 31, 4},      { {"Sharp_Stone", "Force", "Impact"},             {"Sharp_Stone", "Force", "Impact"} } },
    {"Volcanic",              {92,  52, 28, 19, 1},  { {"Grawl", "Grawl_Slaying", "Night"},            {"Elemental", "Elemental_Slaying", "Night"} } },
  },
  Names = {"Adrenaline_Rush", "Afflicted",  "Boon_Overload",     "Flux_Bomb",       "Fractal_Vindicators", "Frailty",
           "Hamstrung",       "Last_Laugh", "Mists_Convergence", "No_Pain_No_Gain", "Outflanked",          "Social_Awkwardness",
           "Stick_Together",  "Sugar_Rush", "Toxic_Trail",       "Vengeance",       "We_Bleed_Fire",       "Toxic_Sickness"}
}

local Fotm = HMP_FractalDailies
local ComboSet, fracSet = { Fotm.T4_and_CM, Fotm.T4_and_Recs, Fotm.T4_Only }, Fotm.Fractal_Set
Debug:Watch("Fractal Dailies", Fotm)

--Getting the "Correct" Fractal Set based on the end-user's Today / Tomorrow preferences
local function FractalSet(Set, dayOffset)
  local num = Set + dayOffset
  
  if( num == 16 ) then
    Set = 1
  elseif( num == 17 ) then
    Set = 2
  else
    Set = num
  end
  
  return Set
end

--Getting the correct "Numerical" Fractal Set
local function GetFractalSet(addTime)
  Fotm.CurSet = HMPtime.GetUtcTime(15, addTime)
  --Time function and generally accepted fractal "set" order have offsets. Conditional checks account for this.
  for i = 0, 14 do
    if(Fotm.CurSet == i) then
      if( i > 2 ) then
        Fotm.CurSet = Fotm.CurSet - 2
      else
        Fotm.CurSet = Fotm.CurSet + 13
      end
      break
    end
  end
end

--Gets all 3 T4 sets & 6 CM's, then returns the table
local function GetFractalList(Set)
  --Gets Today / Tomorrow / Following fractal sets
  local FractalList = {}
  for i = 0, 2 do
    local tempSet = FractalSet(Set, i)
    for j = 1, 3 do
      --Adds each fractal set (in order of day) to a table
      table.insert(FractalList, Fotm.Sets.T4[tempSet][j])
    end
  end
  --Adds each CM fractal to the end of the table
  for i = 100, 95, -1 do
    table.insert(FractalList, i)
  end
  
  return FractalList
end

--dayOffset must be 0 (today), 1 (tomorrow), or 2 (following day)
local function Set_T4_Dailies(Set, dayOffset)
  local month, day = ( os.date("!%m", os.time() + (86400 * dayOffset) ) ), tonumber(os.date("!%d", os.time() + (86400 * dayOffset)))
  Set = FractalSet(Set, dayOffset)
  
  for a,T4 in ipairs(Fotm.Sets.T4[Set]) do
    for c,Frac in ipairs(Fotm.Fractals) do
      if( T4 == Frac[2][1] ) then
        --Load the required lua "database" file
        Pack:Require("scripts/Fractals/Instabs/" .. Frac[2][1] .. "/" .. month .. ".lua")
        
        --Sets T4 Title
        for e,Combo in ipairs(ComboSet) do
          Combo.T4_Title[1 + dayOffset][a]:SetTexture(Fotm.Dir[1] .. Frac[1] .. "-title.png")
          Combo.T4_Title[4 + (dayOffset * 2)][a]:SetTexture(Fotm.Dir[1] .. Frac[1] .. "-title.png")
          Combo.T4_Title[5 + (dayOffset * 2)][a]:SetTexture(Fotm.Dir[1] .. Frac[1] .. "-title.png")
        end
        
        --Sets T4 Instabilities
        for i = 1, 3 do
          local instab = 1 + ( HMP.FracInstabs["_" .. T4 .. month][day][i] )
          for e,Combo in ipairs(ComboSet) do
            local page, marker = 1+dayOffset, i + ((a-1)*3)
            Combo.T4_Instabs.Names[page][marker]:SetTexture(Fotm.Dir[2] .. Fotm.Names[instab] .. ".png")
            Combo.T4_Instabs.Icons[page][marker]:SetTexture(Fotm.Dir[2] .. Fotm.Names[instab] .. "-Icon.png")
          end
        end
        
        --Sets T4 Slaying
        local newDayOffset = (dayOffset + 1) * 2
        for e,Combo in ipairs(ComboSet) do
          for j = (a*3)-2, (a*3) do
            for k = newDayOffset-1, newDayOffset do
              local page, info = ((k+1) % 2) + 1, ((j+2) % 3) + 1
              Combo.T4_Slaying.Names[k][j]:SetTexture(Fotm.Dir[3] .. Frac[3][page][info] .. "-Title.png")
              Combo.T4_Slaying.Icons[k][j]:SetTexture(Fotm.Dir[3] .. Frac[3][page][info] .. "-Icon.png")
            end
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
    local curDay = os.time() + (86400 * dayOffset)
    --Load the required lua "database" file
    Pack:Require("scripts/Fractals/Instabs/" .. (101-i) .. "/" .. ( os.date("!%m", curDay) ) .. ".lua")
    
    --Sets CM Instabilities
    for j = 1, 3 do
      local instab = 1 + ( HMP.FracInstabs["_" .. (101-i) .. os.date("!%m", curDay)][tonumber(os.date("!%d", curDay))][j] )
      local page, marker = dayOffset+1, j + ((i-1)*3)
      ComboSet[1].CM_Instabs.Names[page][marker]:SetTexture(Fotm.Dir[2] .. Fotm.Names[instab] .. ".png")
      ComboSet[1].CM_Instabs.Icons[page][marker]:SetTexture(Fotm.Dir[2] .. Fotm.Names[instab] .. "-Icon.png")
    end
    
    --Sets CM Slaying
    for j = 1, 18, 3 do
      for k = 0, 2 do
        local marker, cm, page, info = j+k, math.ceil(j/3), ((i+1) % 2) + 1, k+1
        ComboSet[1].CM_Slaying.Names[i][marker]:SetTexture(Fotm.Dir[3] .. Fotm.Fractals[Fotm.Sets.CM[cm]][3][page][info] .. "-Title.png")
        ComboSet[1].CM_Slaying.Icons[i][marker]:SetTexture(Fotm.Dir[3] .. Fotm.Fractals[Fotm.Sets.CM[cm]][3][page][info] .. "-Icon.png")
      end
    end
  end
end

--dayOffset must be 0 (today), 1 (tomorrow), or 2 (following day)
local function Set_Rec_Dailies(Set, dayOffset)
  Set = FractalSet(Set, dayOffset)
  for a,Rec in ipairs(Fotm.Sets.Recs[Set]) do
    for c,Frac in ipairs(Fotm.Fractals) do
      for i = 2, #Frac[2] do
        if(Rec == Frac[2][i]) then
          local instPage, slayPage = 1+dayOffset, 2*dayOffset
          --Sets Rec Title and Number
           ComboSet[2].Rec_Title[instPage][a]:SetTexture(Fotm.Dir[1] .. Frac[1] .. "-title.png")
          ComboSet[2].Rec_Number[instPage][a]:SetTexture(Fotm.Dir[4] .. Frac[2][i] .. ".png")
           ComboSet[2].Rec_Title[4 + slayPage][a]:SetTexture(Fotm.Dir[1] .. Frac[1] .. "-title.png")
          ComboSet[2].Rec_Number[4 + slayPage][a]:SetTexture(Fotm.Dir[4] .. Frac[2][i] .. ".png")
           ComboSet[2].Rec_Title[5 + slayPage][a]:SetTexture(Fotm.Dir[1] .. Frac[1] .. "-title.png")
          ComboSet[2].Rec_Number[5 + slayPage][a]:SetTexture(Fotm.Dir[4] .. Frac[2][i] .. ".png")
          break
        end
      end
    end
  end
end

--dayOffset must be 0 (today), 1 (tomorrow), or 2 (following day)
local function Set_Fractal_Set(Set, dayOffset)
  local instPage, slayPage, num1 = 1+dayOffset, 2*dayOffset, "0.png"
  Set = FractalSet(Set, dayOffset)
  if( Set >= 10 ) then
    Set = Set - 10
    num1 = "1.png"
  end
  
  fracSet[instPage][2]:SetTexture(Fotm.Dir[4] .. num1)
  fracSet[4 + slayPage][2]:SetTexture(Fotm.Dir[4] .. num1)
  fracSet[5 + slayPage][2]:SetTexture(Fotm.Dir[4] .. num1)
  
  fracSet[instPage][3]:SetTexture(Fotm.Dir[4] .. Set .. ".png")
  fracSet[4 + slayPage][3]:SetTexture(Fotm.Dir[4] .. Set .. ".png")
  fracSet[5 + slayPage][3]:SetTexture(Fotm.Dir[4] .. Set .. ".png")
end

--Function for replacing "Sharpening Stone" with "Strength Writ" via ingame option
local function ShowWrit(Set)
  --We check the user's category state so we know what to display
  local SlayString = nil
  if( Fotm.catStates[3][4] ) then
    SlayString = "Strength_Writ"
  else
    SlayString = "Sharp_Stone"
  end
  
  --Gets Today / Tomorrow / Following fractal sets
  local FractalList = GetFractalList(Set)
  
  --The table at this point should have 15 entries (3+3+3 + 6)
  for a,fList in ipairs(FractalList) do
    for c,Frac in ipairs(Fotm.Fractals) do
      if( fList == Frac[2][1] ) then
        --We check to see if the fractal has 'Sharpening Stone' as one of it's slaying requirements.
        --If after the check we find it does not, we prematurely break the loop and iterate to the next fractal.
        local SlayState = {}
        for i = 1, 2 do
          if( Frac[3][i][1] == "Sharp_Stone" ) then
            table.insert(SlayState, true)
          else
            table.insert(SlayState, false)
          end
        end
        if( not SlayState[1] and not SlayState[2] ) then break end
        --At this point we know for a fact that the fractal has at least 1 'Sharpening Stone.'
        
        --T4 Fractals
        if( a < 10 ) then
          --We create an offset that will always equal 1/3/5
          local offset = ( math.ceil(a / 3) * 2 ) - 1
          
          for e,Combo in ipairs(ComboSet) do
            for page = offset, offset+1 do
              --We only care to change something if what we're looking at is a 'Sharpening Stone.'
              if( SlayState[((page+1) % 2) + 1] ) then
                local marker = (((a+2) % 3) * 3) + 1
                Combo.T4_Slaying.Names[page][marker]:SetTexture(Fotm.Dir[3] .. SlayString .. "-Title.png")
                Combo.T4_Slaying.Icons[page][marker]:SetTexture(Fotm.Dir[3] .. SlayString .. "-Icon.png")
              end
            end
          end
        --CM Fractals
        else
          --We "restart" back to 1
          local cm = a - 10
          for i = 1, 2 do
            --We only care to change something if what we're looking at is a 'Sharpening Stone.'
            if( SlayState[i] ) then
              for page = i, 4+i, 2 do
                local marker = (cm*3)+1
                ComboSet[1].CM_Slaying.Names[page][marker]:SetTexture(Fotm.Dir[3] .. SlayString .. "-Title.png")
                ComboSet[1].CM_Slaying.Icons[page][marker]:SetTexture(Fotm.Dir[3] .. SlayString .. "-Icon.png")
              end
            end
          end
        end
        break
      end
    end
  end
end

--Function for "Normal" and "Repeat" Fadeout options
local function SetMarkerAlpha(Set)
  local SlayString = { "Sharp_Stone", "Force", "Impact" }
  local FractalList = GetFractalList(Set)
  local Alpha, State = {0.6, 1}, {0, 0}
  for i = 1, #State do
    if( Fotm.catStates[3][i+1] ) then State[i] = 1 else State[i] = 2 end
  end
  
  for a,fList in ipairs(FractalList) do
    for c,Frac in ipairs(Fotm.Fractals) do
      if( fList == Frac[2][1] ) then
        --T4 Fractals
        if( a < 10 ) then
          --We create an offset that will always equal 1/3/5
          local offset = ( math.ceil(a / 3) * 2 ) - 1
          --Iterating for each fractal combo set
          for e,Combo in ipairs(ComboSet) do
            --Iterating for Page 1 / Page 2
            for page = offset, offset+1 do
              --This section is ONLY for Normal Fadeouts
              --Iterating to check for Slaying matches
              for k = 1, 3 do
                for l = 1, 3 do
                  --If we find a match, we change the marker's alpha value based on user preference
                  if( SlayString[k] == Frac[3][((page+1) % 2) + 1][l] ) then
                    local marker = (((a+2) % 3) * 3) + k
                    Combo.T4_Slaying.Names[page][marker].Alpha = Alpha[State[1]]
                    Combo.T4_Slaying.Icons[page][marker].Alpha = Alpha[State[1]]
                    break
                  end
                end
              end
              --This section is ONLY for Repeat Fadeouts (Page 2)
              if( page == offset+1 ) then
                --Iterating to check for Slaying matches
                for k = 1, 3 do
                  if( Frac[3][1][k] == Frac[3][2][k] ) then
                    local marker = (((a+2) % 3) * 3) + k
                    --If the user wants Repeat fadeouts, we slightly "fade out" (or lower alpha value) of the marker.
                    if( Fotm.catStates[3][3] ) then
                      Combo.T4_Slaying.Names[page][marker].Alpha = Alpha[1]
                      Combo.T4_Slaying.Icons[page][marker].Alpha = Alpha[1]
                    --If the user does NOT want Repeat fadeouts but DOES want Normal Fadeouts, we do additional checks.
                    elseif( not Fotm.catStates[3][3] and Fotm.catStates[3][2] ) then
                      for m = 1, 3 do
                        --If the match we found is one of the Normal slaying options, we do nothing.
                        if( Frac[3][2][k] == SlayString[m] ) then
                          break
                        end
                        --If the match we found is NOT one of the Normal slaying options, we revert the alpha to 1.
                        if( m == 3 ) then
                          Combo.T4_Slaying.Names[page][marker].Alpha = Alpha[2]
                          Combo.T4_Slaying.Icons[page][marker].Alpha = Alpha[2]
                        end
                      end
                    --If the user does NOT want Repeat fadeouts (and does NOT want Normal Fadeouts), we revert the alpha to 1
                    else
                      Combo.T4_Slaying.Names[page][marker].Alpha = Alpha[2]
                      Combo.T4_Slaying.Icons[page][marker].Alpha = Alpha[2]
                    end
                  end
                end
              end
            end
          end
        --CM Fractals
        else
          --We "restart" back to 0
          local cm = a - 10
          for page = 1, 2 do
            --This section is ONLY for Normal Fadeouts
            --Iterating to check for Slaying matches
            for j = 1, 3 do
              for k = 1, 3 do
                if( SlayString[j] == Frac[3][page][k] ) then
                  --If we find a match, we change the marker's alpha value based on user preference
                  for l = page, 4+page, 2 do
                    local marker = (cm*3) + j
                    ComboSet[1].CM_Slaying.Names[l][marker].Alpha = Alpha[State[1]]
                    ComboSet[1].CM_Slaying.Icons[l][marker].Alpha = Alpha[State[1]]
                  end
                  break
                end
              end
            end
            --This section is ONLY for Repeat Fadeouts
            if( page == 2 ) then
              for j = 1, 3 do
                if( Frac[3][1][j] == Frac[3][2][j] ) then
                  for k = 2, 6, 2 do
                    local marker = (cm*3) + j
                    --If the user wants Repeat fadeouts, we slightly "fade out" (or lower alpha value) of the marker.
                    if( Fotm.catStates[3][3] ) then
                      ComboSet[1].CM_Slaying.Names[k][marker].Alpha = Alpha[1]
                      ComboSet[1].CM_Slaying.Icons[k][marker].Alpha = Alpha[1]
                    --If the user does NOT want Repeat fadeouts but DOES want Normal Fadeouts, we do additional checks.
                    elseif( not Fotm.catStates[3][3] and Fotm.catStates[3][2] ) then
                      for l = 1, 3 do
                        --If the match we found is one of the Normal slaying options, we do nothing.
                        if( Frac[3][2][j] == SlayString[l] ) then
                          break
                        end
                        --If the match we found is NOT one of the Normal slaying options, we revert the alpha to 1.
                        if( l == 3 ) then
                          ComboSet[1].CM_Slaying.Names[k][marker].Alpha = Alpha[2]
                          ComboSet[1].CM_Slaying.Icons[k][marker].Alpha = Alpha[2]
                        end
                      end
                    --If the user does NOT want Repeat fadeouts (and does NOT want Normal Fadeouts), we revert the alpha to 1
                    else
                      ComboSet[1].CM_Slaying.Names[k][marker].Alpha = Alpha[2]
                      ComboSet[1].CM_Slaying.Icons[k][marker].Alpha = Alpha[2]
                    end
                  end
                end
              end
            end
          end
        end
        break
      end
    end
  end
end

--This should only run when the end-user has a real-life day change while inside the Mistlock Observatory
local function ChangeInstabTextures()
  local ref = {
    Fotm.T4_and_CM.T4_Title, Fotm.T4_and_CM.T4_Instabs.Names, Fotm.T4_and_CM.T4_Instabs.Icons, Fotm.T4_and_CM.CM_Instabs.Names, Fotm.T4_and_CM.CM_Instabs.Icons,
    Fotm.T4_and_Recs.T4_Title, Fotm.T4_and_Recs.Rec_Title, Fotm.T4_and_Recs.Rec_Number, Fotm.T4_and_Recs.T4_Instabs.Names, Fotm.T4_and_Recs.T4_Instabs.Icons,
    Fotm.T4_Only.T4_Title, Fotm.T4_Only.T4_Instabs.Names, Fotm.T4_Only.T4_Instabs.Icons, Fotm.Fractal_Set
  }
  
  --We go through each of the above tables
  for a,b in ipairs(ref) do
    --We then go through each of the current table's sub-tables
    for c,d in ipairs(ref[a]) do
      --If the day is either 'Tomorrow' or the 'Following Day,' we change textures to the previous day
      if( c > 1 and c <= 3 ) then
        --We go through every marker in the currently referenced table
        for e,f in ipairs(ref[a][c]) do
          ref[a][(c-1)][e].Texture = ref[a][c][e].Texture
        end
      elseif( c > 3 ) then
        break
      end
    end
  end
end

--This should only run when the end-ser has a real-life day change while inside the Mistlock Observatory
local function ChangeSlayingTextures()
  local titleRef = { Fotm.T4_and_CM.T4_Title, Fotm.T4_and_Recs.T4_Title, Fotm.T4_Only.T4_Title }
  local slayingRef = {
    Fotm.T4_and_CM.CM_Slaying.Names, Fotm.T4_and_CM.CM_Slaying.Icons, Fotm.T4_and_CM.T4_Slaying.Names, Fotm.T4_and_CM.T4_Slaying.Icons,
    Fotm.T4_and_Recs.T4_Slaying.Names, Fotm.T4_and_Recs.T4_Slaying.Icons,
    Fotm.T4_Only.T4_Slaying.Names, Fotm.T4_Only.T4_Slaying.Icons, Fotm.Fractal_Set
  }
  
  for a,b in ipairs(titleRef) do
    for c,d in ipairs(titleRef[a]) do
      if( c > 5 ) then
        for e,f in ipairs(titleRef[a][c]) do
          titleRef[a][(c-2)][e].Texture = titleRef[a][c][e].Texture
          titleRef[a][(c-2)][e].Alpha = titleRef[a][c][e].Alpha
        end
      end
    end
  end
  
  for a,b in ipairs(slayingRef) do
    for c,d in ipairs(slayingRef[a]) do
      if( c > 2 ) then
        for e,f in ipairs(slayingRef[a][c]) do
          slayingRef[a][(c-2)][e].Texture = slayingRef[a][c][e].Texture
          slayingRef[a][(c-2)][e].Alpha = slayingRef[a][c][e].Alpha
        end
      end
    end
  end
end

--Changes category state based on user's global slaying preference
local function CheckSlayingCatState()
  local dayGUIDS = { "O0amDOodrUCmRI16HKqSiA==", "MOeFEPX6G0CztUUETNTajw==" }
  Fotm.catStates[3][1] = World:CategoryByType("HMP.Daily_Fractals.c3.sc1"):IsVisible()
  
  --If the user DOES want the Slaying Display shown, we do stuff
  if( World:CategoryByType("HMP.Daily_Fractals.c3.sc1"):IsVisible() ) then
    --Getting the current Today/Tomorrow category status
    if( World:CategoryByType("HMP.Daily_Fractals.c1.sc1"):IsVisible() ) then
      World:CategoryByType("HMP.Daily_Fractals.hiddenC4"):Show()
      World:CategoryByType("HMP.Daily_Fractals.hiddenC5"):Hide()
    end
    if( World:CategoryByType("HMP.Daily_Fractals.c1.sc2"):IsVisible() ) then
      World:CategoryByType("HMP.Daily_Fractals.hiddenC6"):Show()
      World:CategoryByType("HMP.Daily_Fractals.hiddenC7"):Hide()
    end
    for a,b in ipairs(dayGUIDS) do World:MarkerByGuid(b).InGameVisibility = true end
  --If the user does NOT want the Slaying Display shown, we make sure it's hidden.
  else
    for i = 4, 9 do
      World:CategoryByType("HMP.Daily_Fractals.hiddenC" .. i):Hide()
    end
    for a,b in ipairs(dayGUIDS) do World:MarkerByGuid(b).InGameVisibility = false end
  end
end
CheckSlayingCatState()

--The main function the script-once trigger marker calls
function SetFractalDailies()
  GetFractalSet()
  
  for i = 0, 2 do
    Set_CM_Dailies(i)
    Set_T4_Dailies(Fotm.CurSet, i)
    Set_Rec_Dailies(Fotm.CurSet, i)
    Set_Fractal_Set(Fotm.CurSet, i)
  end
  
  if( Fotm.catStates[3][4] ) then
    ShowWrit(Fotm.CurSet)
  end
  SetMarkerAlpha(Fotm.CurSet)
end

local function tick_CheckCategory(gameTime)
  local time = gameTime.TotalGameTime.TotalSeconds
  local dayCat   = { World:CategoryByType("HMP.Daily_Fractals.c1.sc1"):IsVisible(), World:CategoryByType("HMP.Daily_Fractals.c1.sc2"):IsVisible() }
  local comboCat = { World:CategoryByType("HMP.Daily_Fractals.c2.sc1"):IsVisible(), World:CategoryByType("HMP.Daily_Fractals.c2.sc2"):IsVisible(), World:CategoryByType("HMP.Daily_Fractals.c2.sc3"):IsVisible() }
  
  --Button Animation
  local buttonGUIDS = { "etn5UzZb5UaK3RTBmQuvrg==", "TpGrNUPb5UuVRDWYY6EAvw==", "zJyP/s8Wq0esEZo2leorqg==" }
  for a,b in ipairs(buttonGUIDS) do
    local direction = ((math.pi*2) / 35) * time
    if( a % 2 == 1 ) then direction = -direction end
    World:MarkerByGuid(b):SetRotY(direction)
  end
  
  --Checks if the day has changed while the end-user has been in the Mistlock Observatory
  --If it has changed, we change the markers displayed
  if( os.date("!%d") ~= Fotm.CurDay ) then
    Fotm.CurDay = os.date("!%d")
    ChangeInstabTextures()
    ChangeSlayingTextures()
    
    GetFractalSet()
    if( Fotm.catStates[3][4] ) then
      ShowWrit(Fotm.CurSet)
    end
    SetMarkerAlpha(Fotm.CurSet)
  end
  
  --Checks Fractal Day Category States
  for a,b in ipairs(dayCat) do
    if( b ~= Fotm.catStates[1][a] ) then
      local dayType = { {1, 4, 5}, {2, 6, 7} }
      
      if( b ) then
        for i = 1, #dayType[a] do
          if( i == 1 ) then
            World:CategoryByType("HMP.Daily_Fractals.hiddenC" .. dayType[a][i]):Show()
          end
          if( i == 2 and Fotm.catStates[3][1] ) then
            World:CategoryByType("HMP.Daily_Fractals.hiddenC" .. dayType[a][i]):Show()
          end
          if( i == 3 and Fotm.catStates[3][1] ) then
            World:CategoryByType("HMP.Daily_Fractals.hiddenC" .. dayType[1][i]):Hide()
            World:CategoryByType("HMP.Daily_Fractals.hiddenC" .. dayType[2][i]):Hide()
          end
        end
      else
        if( Fotm.catStates[1][1] and not dayCat[1] ) then
          for i = 1, #dayType do
            World:CategoryByType("HMP.Daily_Fractals.hiddenC" .. dayType[1][i]):Hide()
          end
        end
        if( Fotm.catStates[1][2] and not dayCat[2] ) then
          for i = 1, #dayType do
            World:CategoryByType("HMP.Daily_Fractals.hiddenC" .. dayType[2][i]):Hide()
          end
        end
      end
      Fotm.catStates[1][a] = b
    end
  end
  
  --Checks Fractal Combo Category States
  for a,b in ipairs(comboCat) do
    if( b ~= Fotm.catStates[2][a] ) then
      local type = {"allcmT4", "t4Recs", "onlyT4"}
      Fotm.catStates[2][a] = b
      
      if( b ) then
        for i = 1, 9 do
          World:CategoryByType("HMP.Daily_Fractals.hiddenC" .. i .. "." .. type[a]):Show()
          if( i >= 3 and not Fotm.catStates[3][1]) then break end
        end
      else
        for i = 1, 9 do
          World:CategoryByType("HMP.Daily_Fractals.hiddenC" .. i .. "." .. type[a]):Hide()
          if( i >= 3 and not Fotm.catStates[3][1]) then break end
        end
      end
    end
  end
  
  --Checks Fractal Set Category State
  if( World:CategoryByType("HMP.Daily_Fractals.c4.sc1"):IsVisible() ~= Fotm.catStates[4][1] ) then
    Fotm.catStates[4][1] = World:CategoryByType("HMP.Daily_Fractals.c4.sc1"):IsVisible()
    
    if( World:CategoryByType("HMP.Daily_Fractals.c4.sc1"):IsVisible() ) then
      for i = 1, 9 do
        World:CategoryByType("HMP.Daily_Fractals.hiddenC" .. i .. ".fracSet"):Show()
        if( i >= 3 and not Fotm.catStates[3][1]) then break end
      end
    else
      for i = 1, 9 do
        World:CategoryByType("HMP.Daily_Fractals.hiddenC" .. i .. ".fracSet"):Hide()
        if( i >= 3 and not Fotm.catStates[3][1]) then break end
      end
    end
  end
  
  --Checks Slaying Page/Display Category State
  if( World:CategoryByType("HMP.Daily_Fractals.c3.sc1"):IsVisible() ~= Fotm.catStates[3][1] ) then
    CheckSlayingCatState()
  end
  
  --Checks Normal fadeout Category State
  if( World:CategoryByType("HMP.Daily_Fractals.c3.sc2"):IsVisible() ~= Fotm.catStates[3][2] ) then
    Fotm.catStates[3][2] = World:CategoryByType("HMP.Daily_Fractals.c3.sc2"):IsVisible()
    SetMarkerAlpha(Fotm.CurSet)
  end
  
  --Checks Repeat fadeout Category State
  if( World:CategoryByType("HMP.Daily_Fractals.c3.sc3"):IsVisible() ~= Fotm.catStates[3][3] ) then
    Fotm.catStates[3][3] = World:CategoryByType("HMP.Daily_Fractals.c3.sc3"):IsVisible()
    SetMarkerAlpha(Fotm.CurSet)
  end
  
  --Checks Strength Writ Category State
  if( World:CategoryByType("HMP.Daily_Fractals.c3.sc4"):IsVisible() ~= Fotm.catStates[3][4] ) then
    Fotm.catStates[3][4] = World:CategoryByType("HMP.Daily_Fractals.c3.sc4"):IsVisible()
    
    ShowWrit(Fotm.CurSet)
  end
end

Event:OnTick(tick_CheckCategory)