--Dependencies
Pack:Require("scripts/Utility/Time")

if( Storage:ReadValue("hmp", "FractalDailyDisplay_Day") == nil ) then
  Storage:UpsertValue("hmp", "FractalDailyDisplay_Day", "Today")
  Storage:UpsertValue("hmp", "FractalDailyDisplay_Type", "T4_Recs")
end


HMP_FractalDailies = {
  -- Reference Marker
  Marker = World:CategoryByType("HMP.Daily_Fractals_" .. Mumble.CurrentMap.Id .. ".c1"):GetMarkers(),
  
  UI = {
    Elements = {
      { -- All CM's & T4's
        -- Format: X/Z, Height, Size Multiplier
        { {0.85,  -1.5, 0.0344}, {0.55,  -1.5, 0.2643}, {0.82,  -1.8, 0.0252}, {0.555,  -1.8, 0.2298}, {0.82,  -2.12, 0.0252}, {0.555,  -2.12, 0.2298}, {0.82,  -2.44, 0.0252}, {0.555,  -2.44, 0.2298} },
        { {0.25,  -1.5, 0.0344}, {-0.05, -1.5, 0.2643}, {0.22,  -1.8, 0.0252}, {-0.045, -1.8, 0.2298}, {0.22,  -2.12, 0.0252}, {-0.045, -2.12, 0.2298}, {0.22,  -2.44, 0.0252}, {-0.045, -2.44, 0.2298} },
        { {-0.35, -1.5, 0.0344}, {-0.65, -1.5, 0.2643}, {-0.38, -1.8, 0.0252}, {-0.645, -1.8, 0.2298}, {-0.38, -2.12, 0.0252}, {-0.645, -2.12, 0.2298}, {-0.38, -2.44, 0.0252}, {-0.645, -2.44, 0.2298} },
        
        { {0.87,   1.55, 0.0298}, {0.605,  1.55, 0.2298}, {0.85,    1.26, 0.0229}, {0.625,   1.26, 0.1954}, {0.85,    0.96, 0.0229}, {0.625,   0.96, 0.1954}, {0.85,    0.66, 0.0229}, {0.625,   0.66, 0.1954} },
        { {0.45,   1.55, 0.0298}, {0.185,  1.55, 0.2298}, {0.43,    1.26, 0.0229}, {0.205,   1.26, 0.1954}, {0.43,    0.96, 0.0229}, {0.205,   0.96, 0.1954}, {0.43,    0.66, 0.0229}, {0.205,   0.66, 0.1954} },
        { {0.035,  1.55, 0.0298}, {-0.23,  1.55, 0.2298}, {0.015,   1.26, 0.0229}, {-0.21,   1.26, 0.1954}, {0.015,   0.96, 0.0229}, {-0.21,   0.96, 0.1954}, {0.015,   0.66, 0.0229}, {-0.21,   0.66, 0.1954} },
        { {-0.395, 1.55, 0.0298}, {-0.66,  1.55, 0.2298}, {-0.415,  1.26, 0.0229}, {-0.64,   1.26, 0.1954}, {-0.415,  0.96, 0.0229}, {-0.64,   0.96, 0.1954}, {-0.415,  0.66, 0.0229}, {-0.64,   0.66, 0.1954} },
        { {0.76,   0.25, 0.0298}, {0.495,  0.25, 0.2298}, {0.74,   -0.05, 0.0229}, {0.515,  -0.05, 0.1954}, {0.74,   -0.35, 0.0229}, {0.515,  -0.35, 0.1954}, {0.74,   -0.65, 0.0229}, {0.515,  -0.65, 0.1954} },
        { {0.24,   0.25, 0.0298}, {-0.025, 0.25, 0.2298}, {0.22,   -0.05, 0.0229}, {-0.005, -0.05, 0.1954}, {0.22,   -0.35, 0.0229}, {-0.005, -0.35, 0.1954}, {0.22,   -0.65, 0.0229}, {-0.005, -0.65, 0.1954} },
        { {-0.315, 0.25, 0.0298}, {-0.58,  0.25, 0.2298}, {-0.335, -0.05, 0.0229}, {-0.56,  -0.05, 0.1954}, {-0.335, -0.35, 0.0229}, {-0.56,  -0.35, 0.1954}, {-0.335, -0.65, 0.0229}, {-0.56,  -0.65, 0.1954} }
      },
      { -- T4's + Recs
        { {0.83,  1.3, 0.0298}, {0.565,  1.3, 0.2298}, {0.8,   1, 0.0229}, {0.575,  1, 0.1954}, {0.8,   0.7, 0.0229}, {0.575,  0.7, 0.1954}, {0.8,   0.4, 0.0229}, {0.575,  0.4, 0.1954} },
        { {0.24,  1.3, 0.0298}, {-0.025, 1.3, 0.2298}, {0.21,  1, 0.0229}, {-0.015, 1, 0.1954}, {0.21,  0.7, 0.0229}, {-0.015, 0.7, 0.1954}, {0.21,  0.4, 0.0229}, {-0.015, 0.4, 0.1954} },
        { {-0.35, 1.3, 0.0298}, {-0.615, 1.3, 0.2298}, {-0.38, 1, 0.0229}, {-0.605, 1, 0.1954}, {-0.38, 0.7, 0.0229}, {-0.605, 0.7, 0.1954}, {-0.38, 0.4, 0.0229}, {-0.605, 0.4, 0.1954} },
        
        { {0.83,  -1.2, 0.0298}, {0.565,  -1.2, 0.2298}, {0.8,  -1.5, 0.0229}, {0.575,  -1.5, 0.1954}, {0.8, -1.8, 0.0229}, {0.575, -1.8, 0.1954} },
        { {0.24,  -1.2, 0.0298}, {-0.025, -1.2, 0.2298}, {0.21, -1.5, 0.0229}, {-0.015, -1.5, 0.1954} },
        { {-0.35, -1.2, 0.0298}, {-0.615, -1.2, 0.2298} }
      },
      { -- T4's Only
        { {0.72,  1.55, 0.0459}, {0.37,  1.55, 0.2988}, {0.68, 1.05, 0.0321}, {0.37,  1.05, 0.2643}, {0.68, 0.55, 0.0321}, {0.37,  0.55, 0.2643}, {0.68, 0.05, 0.0321}, {0.37,  0.05, 0.2643} },
        { {-0.16, 1.55, 0.0459}, {-0.51, 1.55, 0.2988}, {-0.2, 1.05, 0.0321}, {-0.51, 1.05, 0.2643}, {-0.2, 0.55, 0.0321}, {-0.51, 0.55, 0.2643}, {-0.2, 0.05, 0.0321}, {-0.51, 0.05, 0.2643} },
        { {0.3,   -0.8, 0.0459}, {-0.05, -0.8, 0.2988}, {0.26, -1.3, 0.0321}, {-0.05, -1.3, 0.2643}, {0.26, -1.8, 0.0321}, {-0.05, -1.8, 0.2643}, {0.26, -2.3, 0.0321}, {-0.05, -2.3, 0.2643} }
      }
    },
    Textures = {
      -- Format: Type-Icon, Fractal Name => Instab Icon, Instab Name x3
      { --Today
        -- All CM's & T4's
        { {"Icon-T4"}, {"Icon-T4"}, {"Icon-T4"}, {"Icon-CM"}, {"Icon-CM"}, {"Icon-CM"}, {"Icon-CM"}, {"Icon-CM"}, {"Icon-CM"}, {"Icon-CM"} },
        -- T4's + Recs
        { {"Icon-T4"}, {"Icon-T4"}, {"Icon-T4"}, {"Icon-Rec"}, {"Icon-Rec"}, {"Icon-Rec"} },
        -- T4's Only
        { {"Icon-T4"}, {"Icon-T4"}, {"Icon-T4"} }
      },
      { --Tomorrow
        -- All CM's & T4's
        { {"Icon-T4"}, {"Icon-T4"}, {"Icon-T4"}, {"Icon-CM"}, {"Icon-CM"}, {"Icon-CM"}, {"Icon-CM"}, {"Icon-CM"}, {"Icon-CM"}, {"Icon-CM"} },
        -- T4's + Recs
        { {"Icon-T4"}, {"Icon-T4"}, {"Icon-T4"}, {"Icon-Rec"}, {"Icon-Rec"}, {"Icon-Rec"} },
        -- T4's Only
        { {"Icon-T4"}, {"Icon-T4"}, {"Icon-T4"} }
      }
    },
    Markers = {
      { --Today
        -- All CM's & T4's
        { {}, {}, {}, {}, {}, {}, {}, {}, {}, {} },
        -- T4's + Recs
        { {}, {}, {}, {}, {}, {} },
        -- T4's Only
        { {}, {}, {} }
      },
      { --Tomorrow
        -- All CM's & T4's
        { {}, {}, {}, {}, {}, {}, {}, {}, {}, {} },
        -- T4's + Recs
        { {}, {}, {}, {}, {}, {} },
        -- T4's Only
        { {}, {}, {} }
      },
      --Misc
      {}
    }
  },
  
  --This is UTC time; gets month & day
  CurrentTime = { Month = { os.date("!%m"), os.date("!%m", os.time() + 86400) }, Day = { os.date("!%d"), os.date("!%d", os.time() + 86400) } },
  
  FractalSets = {}, -- 2 numerical values for Today & Tomorrow
  
  CategoryStates = {
    {}, --Category 1, Today/Tomorrow
    {}, --All 6 Types
  },
  
  Dir = { Title = "Assets/Fracs/Dailies/Title Text/", Instability = "Assets/Fracs/Dailies/Instabilities/", Slaying = "Assets/Fracs/Dailies/Slaying/", Numbers = "Assets/Numbers/Regular/" },
  
  Fractals = {
    ["Aetherblade"] = {
      --Scale #, Achievement ID
      Daily = {92, 2948},
      --Start (beginning of fractal), Boss (Further in, generally for the Boss)
      Slaying = { Start = {"Scarlet_Armies", "Force", "Impact"}, Boss = {"Inquest", "Force", "Mad_Scientists"} },
    },
    ["Aquatic_Ruins"] = {
      Daily = {76, 2956},
      Slaying = { Start = {"Scarlet_Armies", "Force", "Serpent_Slaying"}, Boss = {"Scarlet_Armies", "Force", "Serpent_Slaying"} }
    },
    ["Captain_Mai_Trin"] = {
      Daily = {90, 2932},
      Slaying = { Start = {"Sharp_Stone", "Force", "Impact"}, Boss = {"Sharp_Stone", "Force", "Impact"} }
    },
    ["Chaos"] = {
      Daily = {88, 3038},
      Slaying = { Start = {"Scarlet_Armies", "Force", "Impact"}, Boss = {"Scarlet_Armies", "Force", "Impact"} }
    },
    ["Cliffside"] = {
      Daily = {93, 2930},
      Slaying = { Start = {"Outlaw", "Force", "Justice"}, Boss = {"Outlaw", "Force", "Justice"} }
    },
    ["Deepstone"] = {
      Daily = {84, 4224},
      Slaying = { Start = {"Sharp_Stone", "Force", "Impact"}, Boss = {"Sharp_Stone", "Force", "Impact"} }
    },
    ["Kinfall"] = {
      Daily = {95, 8739},
      Slaying = { Start = {"Ice_Brood", "Force", "Icebrood_Slaying"}, Boss = {"Ice_Brood", "Force", "Icebrood_Slaying"} }
    },
    ["Lonely_Tower"] = {
      Daily = {100, 7950},
      Slaying = { Start = {"Sharp_Stone", "Force", "Impact"}, Boss = {"Demon", "Force", "Demon_Slaying"} }
    },
    ["Molten_Boss"] = {
      Daily = {89, 2966},
      Slaying = { Start = {"Scarlet_Armies", "Force", "Impact"}, Boss = {"Scarlet_Armies", "Force", "Impact"} }
    },
    ["Molten_Furnace"] = {
      Daily = {83, 2903},
      Slaying = { Start = {"Scarlet_Armies", "Force", "Impact"}, Boss = {"Dredge", "Force", "Sorrow"} }
    },
    ["Nightmare"] = {
      Daily = {96, 3177},
      Slaying = { Start = {"Scarlet_Armies", "Force", "Impact"}, Boss = {"Scarlet_Armies", "Force", "Serpent_Slaying"} }
    },
    ["Shattered_Observatory"] = {
      Daily = {97, 3458},
      Slaying = { Start = {"Sharp_Stone", "Force", "Impact"}, Boss = {"Scarlet_Armies", "Force", "Impact"} }
    },
    ["Silent_Surf"] = {
      Daily = {99, 6935},
      Slaying = { Start = {"Sharp_Stone", "Force", "Impact"}, Boss = {"Sharp_Stone", "Force", "Impact"} }
    },
    ["Sirens_Reef"] = {
      Daily = {78, 4494},
      Slaying = { Start = {"Sharp_Stone", "Force", "Impact"}, Boss = {"Sharp_Stone", "Force", "Impact"} }
    },
    ["Snowblind"] = {
      Daily = {86, 2952},
      Slaying = { Start = {"Sons_of_Svanir", "Night", "Wrath"}, Boss = {"Sons_of_Svanir", "Night", "Wrath"} }
    },
    ["Solid_Ocean"] = {
      Daily = {80, 2923},
      Slaying = { Start = {"Elemental", "Elemental_Slaying", "Night"}, Boss = {"Elemental", "Elemental_Slaying", "Night"} }
    },
    ["Solitary_Throne"] = {
      Daily = {94, 9388},
      Slaying = { Start = {"Sharp_Stone", "Force", "Impact"}, Boss = {"Sharp_Stone", "Force", "Impact"} }
    },
    ["Sunqua_Peak"] = {
      Daily = {98, 5446},
      Slaying = { Start = {"Sharp_Stone", "Force", "Impact"}, Boss = {"Sharp_Stone", "Force", "Night"} }
    },
    ["Swampland"] = {
      Daily = {77, 2892},
      Slaying = { Start = {"Sharp_Stone", "Force", "Night"}, Boss = {"Sharp_Stone", "Force", "Night"} }
    },
    ["Thaumanova_Reactor"] = {
      Daily = {82, 2967},
      Slaying = { Start = {"Sharp_Stone", "Force", "Impact"}, Boss = {"Sharp_Stone", "Force", "Impact"} }
    },
    ["Twilight_Oasis"] = {
      Daily = {87, 3973},
      Slaying = { Start = {"Sharp_Stone", "Force", "Night"}, Boss = {"Sharp_Stone", "Force", "Night"} }
    },
    ["Uncategorized"] = {
      Daily = {79, 2939},
      Slaying = { Start = {"Sharp_Stone", "Force", "Impact"}, Boss = {"Inquest", "Force", "Mad_Scientists"} }
    },
    ["Underground_Facility"] = {
      Daily = {81, 2947},
      Slaying = { Start = {"Dredge", "Sorrow", "Night"}, Boss = {"Elemental", "Elemental_Slaying", "Night"} }
    },
    ["Urban_Battleground"] = {
      Daily = {85, 2941},
      Slaying = { Start = {"Sharp_Stone", "Force", "Impact"}, Boss = {"Sharp_Stone", "Force", "Impact"} }
    },
    ["Volcanic"] = {
      Daily = {91, 2989},
      Slaying = { Start = {"Grawl", "Grawl_Slaying", "Night"}, Boss = {"Elemental", "Elemental_Slaying", "Night"} }
    },
  },
  
  Fractal_ChallengeModes = {"Lonely_Tower", "Silent_Surf", "Sunqua_Peak", "Shattered_Observatory", "Nightmare", "Kinfall", "Solitary_Throne"},
  
  Fractal_Sets = {
    [1] = {
      --Syntax: Fractal Name (manually setup for highest scale to lowest scale)
      Daily = {"Nightmare", "Volcanic", "Snowblind"},
      --Syntax: Fractal Name, Scale Number, Daily Recommended Achievement ID
      Recommended = { {"Underground_Facility", 53, 3237}, {"Sirens_Reef", 37, 2377}, {"Uncategorized", 2, 2477} }
    },
    [2] = {
      Daily = {"Aetherblade", "Thaumanova_Reactor", "Uncategorized"},
      Recommended = { {"Aquatic_Ruins", 61, 3198}, {"Volcanic", 28, 2297}, {"Cliffside", 6, 2229} }
    },
    [3] = {
      Daily = {"Cliffside", "Chaos", "Twilight_Oasis"},
      Recommended = { {"Aetherblade", 65, 3189}, {"Swampland", 32, 2363}, {"Molten_Boss", 10, 2560} }
    },
    [4] = {
      Daily = {"Silent_Surf", "Captain_Mai_Trin", "Deepstone"},
      Recommended = { {"Sunqua_Peak", 74, 3204}, {"Thaumanova_Reactor", 34, 2592}, {"Aetherblade", 14, 2327} }
    },
    [5] = {
      Daily = {"Nightmare", "Solitary_Throne", "Solid_Ocean"},
      Recommended = { {"Kinfall", 70, 3203}, {"Lonely_Tower", 50, 8037}, {"Volcanic", 1, 2362} }
    },
    [6] = {
      Daily = {"Chaos", "Urban_Battleground", "Uncategorized"},
      Recommended = { {"Solid_Ocean", 60, 3172}, {"Shattered_Observatory", 48, 2337}, {"Thaumanova_Reactor", 15, 2238} }
    },
    [7] = {
      Daily = {"Deepstone", "Molten_Furnace", "Sirens_Reef"},
      Recommended = { {"Silent_Surf", 66, 3184}, {"Solid_Ocean", 35, 2266}, {"Sunqua_Peak", 24, 2245} }
    },
    [8] = {
      Daily = {"Molten_Boss", "Twilight_Oasis", "Underground_Facility"},
      Recommended = { {"Lonely_Tower", 75, 3238}, {"Uncategorized", 36, 2309}, {"Silent_Surf", 21, 2189} }
    },
    [9] = {
      Daily = {"Silent_Surf", "Volcanic", "Swampland"},
      Recommended = { {"Deepstone", 67, 3201}, {"Molten_Boss", 40, 2171}, {"Aquatic_Ruins", 7, 2329} }
    },
    [10] = {
      Daily = {"Lonely_Tower", "Thaumanova_Reactor", "Aquatic_Ruins"},
      Recommended = { {"Sirens_Reef", 54, 3185}, {"Urban_Battleground", 31, 2533}, {"Underground_Facility", 8, 2422} }
    },
    [11] = {
      Daily = {"Sunqua_Peak", "Urban_Battleground", "Underground_Facility"},
      Recommended = { {"Twilight_Oasis", 59, 3228}, {"Molten_Furnace", 39, 2591}, {"Deepstone", 11, 2153} }
    },
    [12] = {
      Daily = {"Nightmare", "Aetherblade", "Chaos"},
      Recommended = { {"Solitary_Throne", 64, 3215}, {"Snowblind", 27, 2239}, {"Captain_Mai_Trin", 18, 2467} }
    },
    [13] = {
      Daily = {"Lonely_Tower", "Kinfall", "Cliffside"},
      Recommended = { {"Molten_Furnace", 58, 3192}, {"Chaos", 30, 2330}, {"Urban_Battleground", 4, 2405} }
    },
    [14] = {
      Daily = {"Deepstone", "Solid_Ocean", "Swampland"},
      Recommended = { {"Uncategorized", 62, 3213}, {"Captain_Mai_Trin", 42, 2394}, {"Twilight_Oasis", 16, 2308} }
    },
    [15] = {
      Daily = {"Shattered_Observatory", "Captain_Mai_Trin", "Molten_Boss"},
      Recommended = { {"Cliffside", 68, 3187}, {"Nightmare", 47, 2463}, {"Swampland", 5, 2316} }
    }
  },
  
  Instabilities = {
    Names = {
      "Adrenaline_Rush", "Afflicted",  "Boon_Overload",     "Flux_Bomb",       "Fractal_Vindicators", "Frailty",
      "Hamstrung",       "Last_Laugh", "Mists_Convergence", "No_Pain_No_Gain", "Outflanked",          "Social_Awkwardness",
      "Stick_Together",  "Sugar_Rush", "Toxic_Trail",       "Vengeance",       "We_Bleed_Fire",       "Toxic_Sickness"
    }
  }
}

local Fotm = HMP_FractalDailies
local CategoryType = "HMP.Daily_Fractals_" .. Mumble.CurrentMap.Id
Debug:Watch("Fractal Dailies #2", Fotm)

local function GetPosX(Marker, Offset)
  return Marker.Position.X + (Offset * Marker.Size) * math.cos(Marker.RotationXyz.Z)
end

local function GetPosZ(Marker, Offset)
  return Marker.Position.Y + (Offset * Marker.Size) * math.sin(Marker.RotationXyz.Z)
end

--Gets all 3 Numerical Fractal Sets (Today, Tomorrow, Following Day)
local function GetFractalSets()
  --We get the current arbitrary day based on epoch time, dividing by 15
  Fotm.FractalSets[1] = HMPtime.GetUtcTime(15)
  
  --The Time function and generally accepted fractal "set" order have offset when referencing epoch. These arbitrary condition checks account for this.
  for i = 0, 14 do
    if(Fotm.FractalSets[1] == i) then
      if(i > 7) then
        for index = 1, 2 do Fotm.FractalSets[index] = i - 8 + index end
      else
        for index = 1, 2 do Fotm.FractalSets[index] = i + 7 + index end
      end
      break
    end
  end
  
  --Since we're getting both fractal sets simultaneously, we check the 2nd set to see if it's above 15 and reset it back to 1 accordingly.
  if( Fotm.FractalSets[2] > 15 ) then Fotm.FractalSets[2] = 1 end
end

--Creates End-User In-World Trigger Markers
local function Create_TriggerMarkers(Marker)
  for i = 1, 2 do
    local attributes = {
      MapID = Mumble.CurrentMap.Id,
      xpos = Marker.Position.X,
      ypos = Marker.Position.Z,
      zpos = Marker.Position.Y,
      type = Marker.Category.Namespace .. ".sc" .. i,
      hide = nil, show = nil,
      triggerRange = 5
    }
    if( i == 1 ) then
      attributes.hide = Marker.Category.Namespace .. ".sc1"
      attributes.show = Marker.Category.Namespace .. ".sc2"
    else
      attributes.show = Marker.Category.Namespace .. ".sc1"
      attributes.hide = Marker.Category.Namespace .. ".sc2"
    end
    table.insert(Fotm.UI.Markers[3], Pack:CreateMarker(attributes))
    Fotm.UI.Markers[3][#Fotm.UI.Markers[3]]:SetTexture("Assets/General/empty.png")
  end
end

--Creates the main Displays for Dailies and Slaying.
local function Create_Holograms(Marker)
  for i = 1, 2 do
    local attributes = {
      MapID = Mumble.CurrentMap.Id,
      xpos = Marker.Position.X,
      ypos = Marker.Position.Z + 21,
      zpos = Marker.Position.Y,
      type = Marker.Category.Namespace,
      iconSize = Marker.Size,
      fadeFar = Marker.FadeFar * 1.05,
      fadeNear = Marker.FadeNear * 1.05,
      heightOffset = -19.5,
      alpha = 0.75,
    }
    table.insert(Fotm.UI.Markers[3], Pack:CreateMarker(attributes))
    Fotm.UI.Markers[3][#Fotm.UI.Markers[3]].RotationXyz = Marker.RotationXyz
    Fotm.UI.Markers[3][#Fotm.UI.Markers[3]]:SetTexture("Assets/Fracs/Dailies/Display.png")
  end
end

local function Display_FractalSets(Marker)
  --Wrong information, needs to be adjusted
  local Offsets = {
    Position = { -- Where the markers will be on the Board
      X = {0, 0.07, 0.07, -0.057},
      Y = {2.455, 2.455, 2.455, 2.455}, --Height
      Z = {0, 0.07, 0.07, -0.057}
    },
    -- Size modifiers to adapt to Board size
    Size = {0.1379310345, 0.06896551725, 0.06896551725, 0.06896551725},
  }
  local Textures = {
    "Assets/Fracs/Dailies/Title Text/Set-title.png",
    "Assets/Numbers/Regular/0.png",
    "", -- This is defined in the below loop
    "Assets/Numbers/Regular/15.png",
  }
  
  --3 Fractal Set Markers (per day)
  for Day = 1, 2 do
    -- Here we define the 3rd marker's texture to the current fractal set
    Textures[3] = "Assets/Numbers/Regular/" .. Fotm.FractalSets[Day] .. ".png"
    
    -- This deals with single digit vs double digit numbers
    for i = 1, 4 do
      local PosX, PosZ = 0, 0
      if(Fotm.FractalSets[Day] < 10 and i > 1 and i < 4) then
        PosX = GetPosX(Marker, 0.086 / math.ceil(i/2))
        PosZ = GetPosZ(Marker, 0.086 / math.ceil(i/2))
      else
        PosX = GetPosX(Marker, Offsets.Position.X[i])
        PosZ = GetPosZ(Marker, Offsets.Position.Z[i])
      end
      
      local attributes = {
        MapID = Mumble.CurrentMap.Id,
        xpos = PosX,
        ypos = Marker.Position.Z + ( Offsets.Position.Y[i] * (Marker.Size / 4.35)),
        zpos = PosZ,
        type = "HMP.Daily_Fractals_" .. Mumble.CurrentMap.Id .. ".c1.sc" .. Day,
        iconSize = Marker.Size * Offsets.Size[i],
        fadeFar = Marker.FadeFar * 0.87,
        fadeNear = Marker.FadeNear * 0.87,
      }
      table.insert(Fotm.UI.Markers[3], Pack:CreateMarker(attributes))
      Fotm.UI.Markers[3][#Fotm.UI.Markers[3]].RotationXyz = Marker.RotationXyz
      Fotm.UI.Markers[3][#Fotm.UI.Markers[3]]:SetTexture(Textures[i])
      --If the number is a double digit number, we do not add the 0
      if( Fotm.FractalSets[Day] > 9 and i == 2 ) then Fotm.UI.Markers[3][#Fotm.UI.Markers[3]]:Remove() end
    end
  end
end

local function Display_HologramPages(Marker)
  for Day = 1, 2 do
    -- Position X/Y/Z, Size
    local Offset = { -0.87, 2.58, -0.87, 0.06896551725 }
    
    local attributes = {
      MapID = Mumble.CurrentMap.Id,
      xpos = GetPosX(Marker, Offset[1]),
      ypos = Marker.Position.Z + (Offset[2] * (Marker.Size / 4.35)),
      zpos = GetPosZ(Marker, Offset[3]),
      type = "HMP.Daily_Fractals_" .. Mumble.CurrentMap.Id .. ".c1.sc" .. Day,
      iconSize = Marker.Size * Offset[4],
      fadeFar = Marker.FadeFar * 0.87,
      fadeNear = Marker.FadeNear * 0.87,
    }
    table.insert(Fotm.UI.Markers[3], Pack:CreateMarker(attributes))
    Fotm.UI.Markers[3][#Fotm.UI.Markers[3]].RotationXyz = Marker.RotationXyz
    Fotm.UI.Markers[3][#Fotm.UI.Markers[3]]:SetTexture("Assets/Numbers/Regular/" .. Day .. ".png")
  end
end

local function Display_Day(Marker)
  for Day = 1, 2 do
    -- Position X/Y/Z, Size
    local Offset = { 0.5, 2.35, 0.5, 0.5172413793 }
    local DayText = { "Today", "Tomorrow" }
    
    local attributes = {
      MapID = Mumble.CurrentMap.Id,
      xpos = GetPosX(Marker, Offset[1]),
      ypos = Marker.Position.Z + (Offset[2] * (Marker.Size / 4.35)),
      zpos = GetPosZ(Marker, Offset[3]),
      type = "HMP.Daily_Fractals_" .. Mumble.CurrentMap.Id .. ".c1.sc" .. Day,
      iconSize = Marker.Size * Offset[4],
      fadeFar = Marker.FadeFar * 0.87,
      fadeNear = Marker.FadeNear * 0.87,
    }
    table.insert(Fotm.UI.Markers[3], Pack:CreateMarker(attributes))
    Fotm.UI.Markers[3][#Fotm.UI.Markers[3]].RotationXyz = Marker.RotationXyz
    Fotm.UI.Markers[3][#Fotm.UI.Markers[3]]:SetTexture("Assets/Fracs/Dailies/Title Text/" .. DayText[Day] .. "-title.png")
  end
end

local function Display_Dividers(Marker)
  --There are 5 dividers total
  for i = 1, 5 do
    -- Positions: High / Low / High / Mid / High / Size Mod
    local Offset = {1.95, -1.15, 1.95, -0.35, 1.95, 1}
    local DividerText = { "CMs", "T4", "T4", "Recs", "T4" }
    
    local attributes = {
      MapID = Mumble.CurrentMap.Id,
      xpos = Marker.Position.X,
      ypos = Marker.Position.Z + Offset[i] * (Marker.Size / 4.35),
      zpos = Marker.Position.Y,
      type = "HMP.Daily_Fractals_" .. Mumble.CurrentMap.Id .. ".c2.sc" .. math.ceil(i/2),
      iconSize = Marker.Size * Offset[6],
      fadeFar = Marker.FadeFar * 0.87,
      fadeNear = Marker.FadeNear * 0.87,
    }
    table.insert(Fotm.UI.Markers[3], Pack:CreateMarker(attributes))
    Fotm.UI.Markers[3][#Fotm.UI.Markers[3]].RotationXyz = Marker.RotationXyz
    Fotm.UI.Markers[3][#Fotm.UI.Markers[3]]:SetTexture("Assets/Fracs/Dailies/Divider-" .. DividerText[i] .. ".png")
  end
end

local function Fill_TextureInfo()
  --This loops through Today / Tomorrow
  for a, Texture_Day in ipairs(Fotm.UI.Textures) do
    --This loops through each UI Type
    for b, Texture_Type in ipairs(Texture_Day) do
      --This loops through every table within each UI Type
      for c, Texture_Table in ipairs(Texture_Type) do
        --This loops through all the possible markers that are part of an UI group.
        for d = 2, #Fotm.UI.Elements[b][c] do
          
          --This statement deals with adding T4 / CM / Rec Names to the Texture_Table
          if( d == 2 ) then
            --This adds the T4 Fractal Name
            if( c <= 3 ) then
              --Debug:Print("scripts/Fractals/Instabs/" .. Fotm.Fractals[Fotm.Fractal_Sets[Fotm.FractalSets[a]].Daily[c]].Daily[1] .. "/" .. Fotm.CurrentTime.Month[a])
              
              Pack:Require("scripts/Fractals/Instabs/" .. Fotm.Fractals[Fotm.Fractal_Sets[Fotm.FractalSets[a]].Daily[c]].Daily[1] .. "/" .. Fotm.CurrentTime.Month[a])
              table.insert(Texture_Table, Fotm.Fractal_Sets[Fotm.FractalSets[a]].Daily[c] .. "-title")
            end
            --This adds the CM Fractal Name
            if( c > 3 and b == 1 ) then
              Pack:Require("scripts/Fractals/Instabs/" .. Fotm.Fractals[Fotm.Fractal_ChallengeModes[c - 3]].Daily[1] .. "/" .. Fotm.CurrentTime.Month[a])
              table.insert(Texture_Table, Fotm.Fractal_ChallengeModes[c - 3] .. "-title")
            end
            --This adds the Daily Recommended Fractal Name
            if( b == 2 and c > 3 ) then
              Pack:Require("scripts/Fractals/Instabs/" .. Fotm.Fractal_Sets[Fotm.FractalSets[a]].Recommended[c - 3][2] .. "/" .. Fotm.CurrentTime.Month[a])
              table.insert(Texture_Table, Fotm.Fractal_Sets[Fotm.FractalSets[a]].Recommended[c - 3][1] .. "-title")
            end
          end
            
          --This adds all the Instability Icons and Text Textures to the Texture_Table
          if( d > 2 ) then
            local instab, icon, Fractal = "", "", string.sub(Texture_Table[2], 1, -7)
            
            --This statement ensures every odd marker gets the '-Icon' string attached to it
            if( d % 2 == 1 ) then
              icon = "-Icon"
            else
              icon = ""
            end
            
            --This is a check to ensure that we're looking at the right number when we're looking at a T4 fractal vs Daily Recommended
            if( b == 2 and c > 3 ) then
              instab = 1 + HMP.FracInstabs["_" .. Fotm.Fractal_Sets[Fotm.FractalSets[a]].Recommended[c - 3][2] .. Fotm.CurrentTime.Month[a]][tonumber(Fotm.CurrentTime.Day[a])][math.ceil( (d-2) / 2)]
            else
              --Future me reminder: 'Fotm.CurrentTime.Day[a]' MUST be transformed into a number. os.date(args) returns the number as a String.
              instab = 1 + HMP.FracInstabs["_" .. Fotm.Fractals[Fractal].Daily[1] .. Fotm.CurrentTime.Month[a]][tonumber(Fotm.CurrentTime.Day[a])][math.ceil( (d-2) / 2)]
            end
            table.insert(Texture_Table, Fotm.Instabilities.Names[instab] .. icon)
          end
          
        end
      end
    end
  end
end

-- 'Marker' is the main reference marker.
-- 'Table' is a table with 3 values; X/Z & Height offsets (with respect to the reference marker) and the iconSize Multiplier
-- 'Category' is a table with 2 values; main category (e.g. c1) and subcategory (e.g. sc2).
-- 'HeightOffset' is the desired heightOffset of the created markers.
-- 'MarkerTable' is the table the created markers will go into.
-- 'Dir' is the directory for the texture.
-- 'Texture' is the texture name for the marker.
local function CreateHologramMarkers(Marker, Table, HeightOffset, Category, MarkerTable, Dir, Texture)
  local attributes = {
    MapID = Mumble.CurrentMap.Id,
    xpos = GetPosX(Marker, Table[1]),
    ypos = Marker.Position.Z + (Table[2] * (Marker.Size / 4.35)), --We use 4.35 because that's the iconSize my UI was originally designed by hand with.
    zpos = GetPosZ(Marker, Table[1]),
    iconSize = Marker.Size * Table[3],
    type = "HMP.Daily_Fractals_" .. Mumble.CurrentMap.Id .. ".c2.sc" .. Category[1] + 3 .. ".asc" .. Category[2],
    fadeFar = Marker.FadeFar * 0.87,
    fadeNear = Marker.FadeNear * 0.87,
    heightOffset = HeightOffset,
  }
  
  --Debug:Print(attributes.type)
  
  table.insert(MarkerTable, Pack:CreateMarker(attributes))
  MarkerTable[#MarkerTable].RotationXyz = Marker.RotationXyz
  MarkerTable[#MarkerTable]:SetTexture(Dir .. Texture .. ".png")
end

--Deletes all markers created by this script. Exists as a catch-all old marker weirdness as well as
--ensuring all markers are deleted before we re-create them for Today & Tomorrow categories if the
--user is around at daily reset.
local function Delete_DailyMarkers()
  for a, Day in ipairs(Fotm.UI.Markers) do
    for b, Type in ipairs(Day) do
      for c, Fractal in ipairs(Type) do
        for d, Marker in ipairs(Fractal) do
          Marker:Remove()
        end
      end
    end
  end
end

function SetFractalDailies2(Marker)
  --Before we do anything, we make sure to start off fresh
  Delete_DailyMarkers()
  --Functions to acquire information before we begin creating markers
  GetFractalSets()
  --Creating Core Hologram Markers
  Create_TriggerMarkers(Fotm.Marker[1])
  Create_Holograms(Fotm.Marker[1])
  Display_FractalSets(Fotm.Marker[1])
  Display_HologramPages(Fotm.Marker[1])
  Display_Day(Fotm.Marker[1])
  Display_Dividers(Fotm.Marker[1])
  --Acquiring all textures relevant to Today / Tomorrow
  Fill_TextureInfo()
  
  --This is where we actually create the markers
  for a, Day in ipairs(Fotm.UI.Markers) do
    if( a == 3 ) then break end
    for b, Type in ipairs(Day) do
      for c, Fractal in ipairs(Type) do
        for d, Info in ipairs(Fotm.UI.Elements[b][c]) do
          --We assign the proper directory for the intended texture here
          local Directory
          if( d == 1 ) then Directory = "Assets/Fracs/Dailies/" end
          if( d == 2 ) then Directory = Fotm.Dir.Title end
          if(d > 2) then Directory = Fotm.Dir.Instability end
          CreateHologramMarkers(Fotm.Marker[1], Info, 1.5, {b, a}, Fractal, Directory, Fotm.UI.Textures[a][b][c][d])
        end
      end
    end
  end
end

local function Set_CategoryStates()
  local states = { {}, {} }
  if( Storage:ReadValue("hmp", "FractalDailyDisplay_Day") == "Today" ) then
    states[1] = {true, false}
  else
    states[1] = {false, true}
  end
  
  if( Storage:ReadValue("hmp", "FractalDailyDisplay_Type") == "AllCM") then
    states[2] = {true, false, false}
  elseif( Storage:ReadValue("hmp", "FractalDailyDisplay_Type") == "T4_Recs") then
    states[2] = {false, true, false}
  else
    states[2] = {false, false, true}
  end
  
  for a, Table in ipairs(states) do
    for b, CategoryState in ipairs(Table) do
      table.insert(Fotm.CategoryStates[a], CategoryState)
    end
  end
  
  for a, Category in ipairs(Fotm.CategoryStates) do
    for b, States in ipairs(Category) do
      if( a == 1 ) then
        if( States ) then
          World:CategoryByType(CategoryType .. ".c" .. a .. ".sc" .. b):Show()
          for c = 4, 6 do World:CategoryByType(CategoryType .. ".c2.sc" .. c .. ".asc" .. b):Show() end
        else
          World:CategoryByType(CategoryType .. ".c" .. a .. ".sc" .. b):Hide()
          for c = 4, 6 do World:CategoryByType(CategoryType .. ".c2.sc" .. c .. ".asc" .. b):Hide() end
        end
      else
        if( States ) then
          World:CategoryByType(CategoryType .. ".c" .. a .. ".sc" .. b):Show()
          World:CategoryByType(CategoryType .. ".c" .. a .. ".sc" .. b+3):Show()
        else
          World:CategoryByType(CategoryType .. ".c" .. a .. ".sc" .. b):Hide()
          World:CategoryByType(CategoryType .. ".c" .. a .. ".sc" .. b+3):Hide()
        end
      end
    end
  end
end

Set_CategoryStates()


function Hide_FractalDailies(TriggerMarker)
  Debug:Print("Hi!")
  local AllMarkers = World:CategoryByType(CategoryType):GetMarkers(true)
  for a, Marker in ipairs(AllMarkers) do
    Marker.InGameVisibility = false
  end
  TriggerMarker.InGameVisibility = true
end

function Check_PlayerDistance(TriggerMarker)
  local distance = (Mumble.PlayerCharacter.Position - TriggerMarker.Position):Length()
  if( distance > 5 and TriggerMarker.InGameVisibility ) then
    TriggerMarker.InGameVisibility = false
    local AllMarkers = World:CategoryByType(CategoryType):GetMarkers(true)
    for a, Marker in ipairs(AllMarkers) do
      Marker.InGameVisibility = true
    end
  end
  Debug:Watch("My Distance", distance)
end


local function tick_CategoryChecks(gameTime)
  --Checks if the day has changed while the end-user is in the current map. If it has, we re-create the markers with the new information.
  if( os.date("!%d") ~= Fotm.CurrentTime.Day[1] ) then
    for a, Day in ipairs(Fotm.CurrentTime.Day) do
      Fotm.CurrentTime.Day[a] = os.date("!%d", os.time() + (86400 * (a-1)))
    end
    SetFractalDailies2(Fotm.Marker[1])
  end
  
  --Checks Fractal Day Category States
  for a, CatState in ipairs(Fotm.CategoryStates[1]) do
    local RealCatState = World:CategoryByType(CategoryType .. ".c1.sc" .. a):IsVisible()
    if( RealCatState ~= CatState ) then
      if( a == 1 and RealCatState ) then
        World:CategoryByType(CategoryType .. ".c1.sc" .. a):Show()
        for i = 1, 3 do World:CategoryByType(CategoryType .. ".c2.sc" .. (i + 3) .. ".asc" .. a):Show() end
        Storage:UpsertValue("hmp", "FractalDailyDisplay_Day", "Today")
      elseif( a == 1 and not RealCatState ) then
        World:CategoryByType(CategoryType .. ".c1.sc" .. a):Hide()
        for i = 1, 3 do World:CategoryByType(CategoryType .. ".c2.sc" .. (i + 3) .. ".asc" .. a):Hide() end
        Storage:UpsertValue("hmp", "FractalDailyDisplay_Day", "Tomorrow")
      elseif( a == 2 and RealCatState ) then
        World:CategoryByType(CategoryType .. ".c1.sc" .. a):Show()
        for i = 1, 3 do World:CategoryByType(CategoryType .. ".c2.sc" .. (i + 3) .. ".asc" .. a):Show() end
        Storage:UpsertValue("hmp", "FractalDailyDisplay_Day", "Tomorrow")
      else
        World:CategoryByType(CategoryType .. ".c1.sc" .. a):Hide()
        for i = 1, 3 do World:CategoryByType(CategoryType .. ".c2.sc" .. (i + 3) .. ".asc" .. a):Hide() end
        Storage:UpsertValue("hmp", "FractalDailyDisplay_Day", "Today")
      end
      Fotm.CategoryStates[1][a] = RealCatState
    end
  end
  
  --Checks Fractal Type Category States
  for a, TypeState in ipairs(Fotm.CategoryStates[2]) do
    local RealCatState = World:CategoryByType(CategoryType .. ".c2.sc" .. a):IsVisible()
    if( RealCatState ~= TypeState ) then
      
      if( a == 1 and RealCatState ) then
        for b = a, a+3, 3 do World:CategoryByType(CategoryType .. ".c2.sc" .. b):Show() end
        Storage:UpsertValue("hmp", "FractalDailyDisplay_Type", "AllCM")
      elseif( a == 1 and not RealCatState ) then
        for b = a, a+3, 3 do World:CategoryByType(CategoryType .. ".c2.sc" .. b):Hide() end
      elseif( a == 2 and RealCatState ) then
        for b = a, a+3, 3 do World:CategoryByType(CategoryType .. ".c2.sc" .. b):Show() end
        Storage:UpsertValue("hmp", "FractalDailyDisplay_Type", "T4_Recs")
      elseif( a == 2 and not RealCatState ) then
        for b = a, a+3, 3 do World:CategoryByType(CategoryType .. ".c2.sc" .. b):Hide() end
      elseif( a == 3 and RealCatState ) then
        for b = a, a+3, 3 do World:CategoryByType(CategoryType .. ".c2.sc" .. b):Show() end
        Storage:UpsertValue("hmp", "FractalDailyDisplay_Type", "T4_Only")
      elseif( a == 3 and not RealCatState ) then
        for b = a, a+3, 3 do World:CategoryByType(CategoryType .. ".c2.sc" .. b):Hide() end
      end
      Fotm.CategoryStates[2][a] = RealCatState
    end
  end
end
Event:OnTick(tick_CategoryChecks)