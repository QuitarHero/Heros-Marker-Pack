HMP.Fractals.SkipSkillList = {
  [1] = { --Elementalist
    Color = I:Color(187, 75, 56, 255),
    Skills = {
      --Forced Movement
      ["Aerial_Agility"]        = { true, {"Pistol",  "MainHand", 3},     {}},
      ["Burning_Retreat-FA"]    = { true, {"FA",      false,      3},     {"Backwards"}},
      ["Burning_Retreat-Staff"] = { true, {"Staff",   "TwoHand",  4},     {"Backwards"}},
      ["Burning_Speed"]         = { true, {"Dagger",  "MainHand", 3},     {}},
      ["Churning_Earth"]        = { true, {"Dagger",  "OffHand",  5},     {}},
      ["Crashing_Font"]         = { true, {"Hammer",  "TwoHand",  4},     {}},
      ["Earthen_Rush"]          = { true, {"Dagger",  "MainHand", 3},     {}},
      ["Fiery_Rush"]            = { true, {"FGS",     false,      4},     {}},
      ["Fiery_Whirl"]           = { true, {"FGS",     false,      3},     {}},
      ["Flame_Leap"]            = { true, {"FA",      false,      5},     {}},
      ["Flame_Uprising"]        = { true, {"Sword",   "MainHand", 2},     {}},
      ["Lightning_Leap"]        = { true, {"LH",      false,      2},     {}},
      ["Magnetic_Surge"]        = { true, {"ES",      false,      3},     {}},
      ["Mud_Slide"]             = { {56}, {"Dagger",  "MainHand", 3},     {}},
      ["Ride_the_Lightning"]    = { true, {"Dagger",  "OffHand",  4},     {}},
      ["Ripple"]                = { true, {"Spear",   "TwoHand",  3},     {}},
      ["Riptide"]               = { true, {"Sword",   "MainHand", 2},     {"Backwards"}},
      ["Steam_Surge"]           = { {56}, {"Dagger",  "MainHand", 3},     {}},
      ["Tidal_Wave"]            = { true, {"Trident", "TwoHand",  5},     {}},
      --Teleports
      ["Air_Pocket"]            = { true, {"Trident", "TwoHand",  3},     {}},
      ["Lightning_Flash"]       = { true, {"Skill",   false,      false}, {}},
      --Shadowsteps (To Enemy)
      ["Polaric_Leap"]          = { true, {"Sword",   "MainHand", 2},     {"Target"}},
    }
  },
  [2] = { --Engineer
    Color = I:Color(179, 138, 61, 255),
    Skills = {
      --Forced Movement
      ["Acid_Bomb"]       = { true, {"Skill",  false,      false}, {"Backwards"}},
      ["Conduit_Surge"]   = { true, {"Spear",  "TwoHand",  2},     {}},
      ["Devastator"]      = { true, {"Spear",  "TwoHand",  5},     {}},
      ["Energizing_Slam"] = { true, {"Mace",   "MainHand", 2},     {}},
      ["Holo_Leap"]       = { {57}, {"Forge",  false,      2},     {}},
      ["Jump_Shot"]       = { true, {"Rifle",  "TwoHand",  5},     {}},
      ["Radiant_Arc"]     = { true, {"Sword",  "MainHand", 3},     {}},
      ["Rocket_Boots"]    = { true, {"Skill",  false,      false}, {}},
      ["Rocket_Charge"]   = { true, {"Hammer", "TwoHand",  3},     {}},
      ["Rocket_Kick"]     = { true, {"Skill",  false,      false}, {}},
      ["Solid_State"]     = { {75}, {"Skill",  false,      false}, {}},
      --Teleports
      ["Shift_Signet"]    = { {70}, {"Skill",  false,      false}, {}},
    }
  },
  [3] = { --Guardian
    Color = I:Color(160, 212, 231, 255),
    Skills = {
      --Forced Movement
      ["Daring_Advance"]        = { {81}, {"Skill",      false,      false}, {}},
      ["Gleaming_Blade"]        = { {81}, {"Forge",      false,      4},     {}},
      ["Flowing_Resolve"]       = { {65}, {"Skill",      false,      false}, {}},
      ["Heel_Crack"]            = { {65}, {"Skill",      false,      false}, {}},
      ["Helio_Rush"]            = { true, {"Spear",      "TwoHand",  2},     {}},
      ["Leap_of_Faith"]         = { true, {"Greatsword", "TwoHand",  3},     {}},
      ["Quick_Retribution"]     = { {65}, {"Skill",      false,      false}, {}},
      ["Roiling_Light"]         = { {65}, {"Skill",      false,      false}, {"Backwards"}},
      ["Rushing_Justice"]       = { {65}, {"Skill",      false,      false}, {}},
      ["Wings_of_Resolve"]      = { {27}, {"Skill",      false,      false}, {}},
      --Teleports
      ["Crashing_Courage"]      = { {65}, {"Skill",      false,      false}, {}},
      --Shadowsteps (To Enemy)
      ["Advancing_Strike"]      = { true, {"Sword",      "OffHand",  5},     {"Target"}},
      ["Flash_Combo"]           = { {65}, {"Skill",      false,      false}, {"Target"}},
      ["Heavens_Palm"]          = { {65}, {"Skill",      false,      false}, {"Target"}},
      ["Judges_Intervention"]   = { true, {"Skill",      false,      false}, {"Target"}},
      ["Mighty_Blow"]           = { true, {"Hammer",     "TwoHand",  2},     {"Target"}},
      ["Symbol_of_Blades"]      = { true, {"Sword",      "MainHand", 2},     {"Target"}},
      --Shadowsteps (To Ally)
      ["Merciful_Intervention"] = { true, {"Skill",      false,      false}, {}},
    }
  },
  [4] = { --Mesmer
    Color = I:Color(154, 99, 167, 150),
    Skills = {
      --Forced Movement
      ["Blade_Leap"]         = { {66}, {"Sword",     "MainHand",   3},     {}},
      ["Imminent_Voyage"]    = { true, {"Trident",   "TwoHand",    3},     {}},
      ["Lingering_Thoughts"] = { true, {"Axe",       "MainHand",   2},     {}},
      ["Mirage_Thrust"]      = { {59}, {"Sword",     "MainHand",   1},     {}},
      ["Phantasmal_Lancer"]  = { true, {"Spear",     "TwoHand",    4},     {}},
      ["Sand_through_Glass"] = { {59}, {"Skill",     false,        false}, {"Backwards"}},
      --Teleports
      ["Blink"]              = { true, {"Skill",     false,        false}, {}},
      ["Deception"]          = { true, {"DownState", false,        2},     {}},
      ["Phase_Retreat"]      = { true, {"Staff",     "TwoHand",    2},     {"Backwards"}},
      ["Portal"]             = { true, {"Skill",     false,        false}, {}},
      ["Jaunt"]              = { {59}, {"Skill",     false,        false}, {}},
      --Shadowsteps (To Enemy)
      ["Ambush_Assault"]     = { true,                     {"Spear", "TwoHand",  1},     {"Target"}},
      ["Axes_of_Symmetry"]   = { true,                     {"Axe",   "MainHand", 3},     {"Target"}},
      ["Illusionary_Ambush"] = { {59},                     {"Skill", false,      false}, {"Target"}},
      ["Illusionary_Leap"]   = { {1,10,23,24,45,40,59,73}, {"Sword", "MainHand", 3},     {"Target"}}, --All EXCEPT Virtuoso
      ["Mental_Collapse"]    = { true,                     {"Spear", "TwoHand",  5},     {"Target"}},
      ["Mirage_Advance"]     = { {59},                     {"Skill", false,      false}, {"Target"}},
    }
  },
  [5] = { --Necromancer
    Color = I:Color(93, 120, 89, 255),
    Skills = {
      --Forced Movement
      ["Deaths_Charge"]       = { {34}, {"Shroud",  false,        2},     {}},
      ["Devouring_Cut"]       = { {64}, {"Shroud",  false,        3},     {}},
      ["Foul_Current"]        = { true, {"Trident", "TwoHand",    3},     {}},
      ["Gorge"]               = { true, {"Sword",   "MainHand",   3},     {}},
      ["Path_of_Gluttony"]    = { true, {"Sword",   "MainHand",   3},     {}},
      ["Voracious_Arc"]       = { {64}, {"Shroud",  false,        4},     {}},
      --Teleports
      ["Sand_Swell"]          = { {60}, {"Skill",   false,        false}, {}},
      ["Summon_Flesh_Wurm"]   = { true, {"Skill",   false,        false}, {}},
      ["Summon_Spirits"]      = { {76}, {"Shroud",  false,        5},     {}},
      --Shadowsteps (To Enemy)
      ["Dark_Pursuit"]        = { true, {"Shroud",  false,        2},     {"Target"}},
      ["Dark_Spear"]          = { true, {"Spear",   "TwoHand",    5},     {"Target"}},
      ["Distress"]            = { true, {"Spear",   "TwoHand",    4},     {"Target"}},
    }
  },
  [6] = { --Ranger
    Color = I:Color(172, 197, 88, 255),
    Skills = {
      --Forced Movement
      ["Ancestral_Grace"]       = { true, {"Staff",      "TwoHand",    3},     {}},
      ["Battle_Maul"]           = { {55}, {"Skill",      false,        false}, {}},
      ["Brutal_Charge-Feline"]  = { {55}, {"Skill",      false,        false}, {}},
      ["Brutal_Charge-Porcine"] = { {55}, {"Skill",      false,        false}, {}},
      ["Bumble"]                = { {55}, {"Skill",      false,        false}, {}},
      ["Charge"]                = { {55}, {"Skill",      false,        false}, {}},
      ["Charging_Bite"]         = { {55}, {"Skill",      false,        false}, {}},
      ["Crippling_Leap"]        = { {55}, {"Skill",      false,        false}, {}},
      ["Dash"]                  = { {55}, {"Skill",      false,        false}, {}},
      ["Devourer_Retreat"]      = { {55}, {"Skill",      false,        false}, {"Backwards"}},
      ["Fleeting_Zephyr"]       = { {78}, {"Skill",      false,        false}, {}},
      ["Ink_Blast"]             = { true, {"Harpoongun", "TwoHand",    5},     {"Backwards"}},
      ["Instinctive_Engage"]    = { true, {"Dagger",     "MainHand",   3},     {}},
      ["Kick-Gazelle"]          = { {55}, {false,        false,        false}, {}},
      ["Leaping_Lizard"]        = { {55}, {"Skill",      false,        false}, {}},
      ["Lightning_Reflexes"]    = { true, {"Skill",      false,        false}, {"Backwards"}},
      ["Lunge"]                 = { {55}, {"Skill",      false,        false}, {}},
      ["Pounce"]                = { true, {"Sword",      "MainHand",   2},     {}},
      ["Predators_Ambush"]      = { true, {"Spear",      "TwoHand",    4},     {}},
      ["Oaken_Cudgel"]          = { true, {"Mace",       "MainHand",   3},     {}},
      ["Quick_Shot"]            = { true, {"Shortbow",   "TwoHand",    3},     {}},
      ["Serpents_Strike"]       = { true, {"Sword",      "MainHand",   3},     {}},
      ["Surging_Maw"]           = { true, {"Spear",      "TwoHand",    3},     {}},
      ["Swoop"]                 = { true, {"Greatsword", "TwoHand",    3},     {}},
      ["Thump"]                 = { true, {"Hammer",     "TwoHand",    5},     {}},
      ["Whirlwind"]             = { {78}, {"Skill",      false,        false}, {}},
      --Shadowsteps (To Enemy)
      ["Phase_Pounce"]          = { {55}, {"Skill",      false,        false}, {"Target"}},
      ["Smoke_Assault"]         = { {55}, {"Skill",      false,        false}, {"Target"}},
      ["Unnatural_Traversal"]   = { {72}, {"Skill",      false,        false}, {"Target"}},
    }
  },
  [7] = { --Revenant
    Color = I:Color(120, 54, 73, 255),
    Skills = {
      --Forced Movement
      ["Abyssal_Blitz"]             = { true, {"Spear",      "TwoHand",  3},     {}},
      ["Battle_Dance"]              = { {69}, {"Skill",      false,      false}, {"Backwards"}},
      ["Call_to_Anguish"]           = { true, {"Skill",      false,      false}, {}},
      ["Echoing_Eruption"]          = { true, {"Mace",       "MainHand", 3},     {}},
      ["Nomads_Advance"]            = { {69}, {"Skill",      false,      false}, {}},
      ["Phantoms_Onslaught"]        = { true, {"Greatsword", "TwoHand",  3},     {}},
      ["Phase_Smash"]               = { true, {"Hammer",     "TwoHand",  3},     {}},
      ["Release_Potential_Warrior"] = { {79}, {"Skill",      false,      false}, {}},
      ["Riposting_Shadows"]         = { true, {"Skill",      false,      false}, {"Backwards"}},
      ["Surge_of_the_Mists"]        = { true, {"Staff",      "TwoHand",  5},     {}},
      --Teleports
      ["Beguiling_Haze"]            = { {79}, {"Skill",      false,      false}, {}},
      --Shadowsteps (To Enemy)
      ["Deathstrike"]         = { true, {"Sword", "OffHand",  5},     {"Target"}},
      ["Frigid_Blitz"]        = { true, {"Axe",   "OffHand",  4},     {"Target"}},
      ["Igniting_Brand"]      = { true, {"Spear", "TwoHand",  4},     {"Target"}},
      ["Phase_Traversal"]     = { true, {"Skill", false,      false}, {"Target"}},
      ["Unrelenting_Assault"] = { true, {"Sword", "MainHand", 3},     {"Target"}},
    }
  },
  [8] = { --Thief
    Color = I:Color(106, 109, 140, 150),
    Skills = {
      --Forced Movement
      ["Dawns_Repose"]          = { {71}, {"Shroud",     false,      3},     {} },
      ["Disabling_Shot"]        = { true, {"Shortbow",   "TwoHand",  3},     {"Backwards"} },
      ["Escape"]                = { true, {"Harpoongun", "TwoHand",  3},     {"Backwards"} },
      ["Exalted_Hammer"]        = { {77}, {"Swipe",      false,      false}, {} },
      ["Forged_Surfer_Dash"]    = { {77}, {"Swipe",      false,      false}, {} },
      ["Heartseeker"]           = { true, {"Dagger",     "MainHand", 2},     {} },
      ["Helmet_Breaker"]        = { true, {"Staff",      "TwoHand",  3},     {} },
      ["Impact_Strike"]         = { {7},  {"Skill",      false,      false}, {} },
      ["Roll_for_Initiative"]   = { true, {"Skill",      false,      false}, {"Backwards"} },
      ["Unhindered_Combatant"]  = { {7},  {"Skill",      false,      false}, {"Jump"} },
      ["Unsuspecting_Strike"]   = { true, {"Spear",      "TwoHand",  3},     {} },
      ["Vault"]                 = { true, {"Staff",      "TwoHand",  5},     {} },
      ["Withdraw"]              = { true, {"Skill",      false,      false}, {"Backwards"} },
      ["Zephyrite_Sun_Crystal"] = { {77}, {"Swipe",      false,      false}, {} },
      --Teleports
      ["Infiltrators_Arrow"]    = { true, {"Shortbow",   "TwoHand", 5},     {} },
      ["Ink_Shot"]              = { true, {"Harpoongun", "TwoHand", 5},     {} },
      ["Shadow_Portal"]         = { true, {"Skill",      false,     false}, {} },
      ["Shadow_Escape"]         = { true, {"DownState",  false,     2},     {} },
      ["Shadow_Flare"]          = { {58}, {"Skill",      false,     false}, {} },
      ["Shadowfall"]            = { {71}, {"Skill",      false,     false}, {} },
      ["Shadowstep"]            = { true, {"Skill",      false,     false}, {} },
      ["Well_of_Bounty"]        = { {71}, {"Skill",      false,     false}, {} },
      ["Well_of_Gloom"]         = { {71}, {"Skill",      false,     false}, {} },
      ["Well_of_Silence"]       = { {71}, {"Skill",      false,     false}, {} },
      ["Well_of_Sorrow"]        = { {71}, {"Skill",      false,     false}, {} },
      ["Well_of_Tears"]         = { {71}, {"Skill",      false,     false}, {} },
      --Shadowsteps (To Enemy)
      ["Deaths_Retreat"]        = { true,               {"Rifle",   "TwoHand",  4},     {"Target"}},
      ["Harrowing_Storm"]       = { true,               {"Axe",     "MainHand", 3},     {"Dagger", "Target"}}, --Requires OffHand *Dagger*
      ["Infiltrators_Signet"]   = { true,               {"Skill",   false,      false}, {"Target"}},
      ["Infiltrators_Strike"]   = { true,               {"Sword",   "MainHand", 2},     {"Target"}},
      ["Inquest_Portal_Device"] = { {77},               {"Skill",   false,      false}, {"Target"}},
      ["Measured_Shot1"]        = { true,               {"Scepter", "MainHand", 3},     {"Pistol", "Target"}}, --Requires OffHand *Pistol*
      ["Shadow_Shot"]           = { true,               {"Dagger",  "MainHand", 3},     {"Pistol", "Target"}}, --Requires OffHand *Pistol*
      ["Shadow_Strike"]         = { true,               {"Pistol",  "MainHand", 3},     {"Dagger", "Target"}}, --Requires OffHand *Dagger*
      ["Steal"]                 = { {7,20,28,35,44,54}, {"Skill",   false,      false}, {"Target"}}, --Only Core & Daredevil
      --Shadowsteps (To Ally)
      ["Measured_Shot2"]        = { true,               {"Scepter", "MainHand", 3},     {"Pistol", "Target"}}, --Requires OffHand *Pistol*
    }
  },
  [9] = { --Warrior
    Color = I:Color(210, 175, 52, 255),
    Skills = {
      --Forced Movement
      ["Aura_Slicer"]        = { true, {"Dagger",     "MainHand", 2},     {} },
      ["Breaching_Strike"]   = { true, {"Dagger",     "MainHand", false}, {} },
      ["Break_Step"]         = { {68}, {"Skill",      false,      false}, {} },
      ["Brutal_Shot"]        = { true, {"Rifle",      "TwoHand",  4},     {"Backwards"} },
      ["Bulls_Charge"]       = { true, {"Skill",      false,      false}, {} },
      ["Dash-Rampage"]       = { true, {"Rampage",    false,      3},     {} },
      ["Dragon_Slash_Boost"] = { {68}, {"Skill",      false,      false}, {} },
      ["Dragons_Roar"]       = { true, {"Pistol",     "OffHand",  5},     {"Backwards"} },
      ["Dragonspike_Mine"]   = { {68}, {"Skill",      false,      false}, {} },
      ["Earthshaker"]        = { true, {"Hammer",     "TwoHand",  false}, {} },
      ["Evicerate"]          = { true, {"Axe",        "MainHand", false}, {} },
      ["Gunstinger"]         = { true, {"Pistol",     "OffHand",  4},     {} },
      ["Kick-Rampage"]       = { true, {"Rampage",    false,      2},     {} },
      ["Kick-Warrior"]       = { true, {"Skill",      false,      false}, {} },
      ["Knot_Shot"]          = { true, {"Harpoongun", "TwoHand",  4},     {"Backwards"} },
      ["Line_Breaker"]       = { true, {"Staff",      "TwoHand",  3},     {} },
      ["Rush"]               = { true, {"Greatsword", "TwoHand",  5},     {} },
      ["Savage_Leap"]        = { true, {"Sword",      "MainHand", 2},     {} },
      ["Seismic_Leap"]       = { true, {"Rampage",    false,      5},     {} },
      ["Shield_Bash"]        = { true, {"Shield",     "OffHand",  4},     {} },
      ["Spear_Swipe"]        = { true, {"Spear",      "TwoHand",  5},     {"Backwards"} },
      ["Stomp"]              = { true, {"Skill",      false,      false}, {} },
      ["Tsunami_Slash"]      = { true, {"Spear",      "TwoHand",  5},     {} },
      ["Valiant_Leap"]       = { true, {"Staff",      "TwoHand",  2},     {} },
      ["Whirlwind_Attack"]   = { true, {"Greatsword", "TwoHand",  3},     {} },
      --Teleports
      ["Flicker_Step"]       = { {68}, {"Skill",      false,      false}, {} },
    }
  },
  [10] = { --Misc
    Skills = {
      ["Barrier"]              = { true, {"Misc", false, false}, {}},
      ["Mistlock_Singularity"] = { true, {"Misc", false, false}, {}},
      ["Mobility_Potion"]      = { true, {"Misc", false, false}, {}},
      ["Superspeed"]           = { true, {"Misc", false, false}, {}},
    }
  }
}
HMP_FractalProjectorTrigger = false

local HMP_FractalSkillList = {
  Elementalist = HMP.Fractals.SkipSkillList[1],
  Engineer     = HMP.Fractals.SkipSkillList[2],
  Guardian     = HMP.Fractals.SkipSkillList[3],
  Mesmer       = HMP.Fractals.SkipSkillList[4],
  Necromancer  = HMP.Fractals.SkipSkillList[5],
  Ranger       = HMP.Fractals.SkipSkillList[6],
  Revenant     = HMP.Fractals.SkipSkillList[7],
  Thief        = HMP.Fractals.SkipSkillList[8],
  Warrior      = HMP.Fractals.SkipSkillList[9],
  Misc         = HMP.Fractals.SkipSkillList[10],
}
local HMP_SpecializationList = {
  Elementalist = {17, 26, 31, 37, 41, 48, 56, 67, 80},
  Engineer     = {6,  21, 29, 38, 43, 47, 57, 70, 75},
  Guardian     = {13, 16, 27, 42, 46, 49, 62, 65, 81},
  Mesmer       = {1,  10, 23, 24, 40, 45, 59, 66, 73},
  Necromancer  = {2,  19, 34, 39, 50, 53, 60, 64, 76},
  Ranger       = {5,  8,  25, 30, 32, 33, 55, 72, 78},
  Revenant     = {3,  9,  12, 14, 15, 52, 63, 69, 79},
  Thief        = {7,  20, 28, 35, 44, 54, 58, 71, 77},
  Warrior      = {4,  11, 18, 22, 36, 51, 61, 68, 74},
}
local HMP_EliteSpecList = {
  Elementalist = {48, 56, 67, 80},
  Engineer     = {43, 57, 70, 75},
  Guardian     = {27, 62, 65, 81},
  Mesmer       = {40, 59, 66, 73},
  Necromancer  = {34, 60, 64, 76},
  Ranger       = {5,  55, 72, 78},
  Revenant     = {52, 63, 69, 79},
  Thief        = {7,  58, 71, 77},
  Warrior      = {18, 61, 68, 74},
}
local ClassRef, Misc = HMP_FractalSkillList["" .. Mumble.PlayerCharacter.Profession .. ""], HMP_FractalSkillList.Misc
local Dir = "Assets/Class/Skip Projector/"
local SkillWhiteList = {"Skill", "Misc", "Shroud", "Forge", "Rampage", "DownState", "Swipe", "FA", "ES", "LH", "IB", "FGS"}

local function CreateMarker(Marker, texture, xpos, ypos, zOffset, Color)
  if(not zOffset) then zOffset = 0 end
  local attr = {
    xpos = xpos,
    ypos = Marker.Position.Z + (14 * zOffset),
    zpos = ypos,
    type = Marker.Category.Namespace,
    iconSize = Marker.Size,
    heightOffset = 1.5 + (-14 * zOffset)
  }
  local newMarker = Pack:CreateMarker(attr)
  newMarker:SetTexture(texture)
  newMarker:SetRot(Marker.RotationXyz)
  if( Color ) then newMarker.Tint = Color end
end


--Offset is optional
local function GetPosX(Marker, Position, Offset)
  if(not Offset) then Offset = 0 end
  return Marker.Position.X + (((-0.2933 * Marker.Size) * (Position - 1)) + Offset) * math.cos(Marker.RotationXyz.Z)
end
--Offset is optional
local function GetPosY(Marker, Position, Offset)
  if(not Offset) then Offset = 0 end
  return Marker.Position.Y + (((-0.2933 * Marker.Size) * (Position - 1)) + Offset) * math.sin(Marker.RotationXyz.Z)
end


local function CreateProjectorMarkers(Marker, ProjectorName, Position)
  local xpos, ypos = GetPosX(Marker, Position), GetPosY(Marker, Position)
  CreateMarker(Marker, Dir .. "Borders/" .. ProjectorName .. ".png", xpos, ypos, 3)
end
local function CreateBorderMarkers(Marker, BorderName, Position, Color)
  local xpos, ypos = GetPosX(Marker, Position), GetPosY(Marker, Position)
  CreateMarker(Marker, Dir .. "Borders/" .. BorderName .. ".png", xpos, ypos, 0, Color)
end

local function CreateSkillMarkers(Marker, SkillName, Position, hOffMult, MiscCheck)
  local Dir2 = tostring(Mumble.PlayerCharacter.Profession)
  if( MiscCheck ) then Dir2 = "Misc" end
  
  local xpos, ypos = GetPosX(Marker, Position), GetPosY(Marker, Position)
  CreateMarker(Marker, Dir .. "Skills/" .. Dir2 .. "/" .. SkillName .. ".png", xpos, ypos, hOffMult)
end
local function CreateWeaponTextMarkers(Marker, WeaponName, Position, hOffMult)
  local xpos, ypos = GetPosX(Marker, Position), GetPosY(Marker, Position)
  CreateMarker(Marker, Dir .. "WeaponText/" .. WeaponName .. ".png", xpos, ypos, hOffMult)
end
local function CreateReqMarkers(Marker, ReqName, SkillPos, ReqPos)
  local ReqOffset = ((((ReqPos - 1) % 3)) * (-0.088 * Marker.Size))
  local xpos, ypos = GetPosX(Marker, SkillPos, ReqOffset), GetPosY(Marker, SkillPos, ReqOffset)
  CreateMarker(Marker, Dir .. "ReqIcons/" .. ReqName .. math.ceil(ReqPos/3) .. ".png", xpos, ypos, 1)
end


function HMP_CreateFractalProjector(Class, Marker)
  local SkillAmt, Spec, ClassAbbr = 0, Mumble.PlayerCharacter.Specialization, string.sub(Mumble.PlayerCharacter.Profession, 0, 3)
  
  for k1, ClassSkill in ipairs(Class) do
    --We first enforce a SkillAmt limit; the Projector can only support a maximum of 6.
    if( SkillAmt < 6 ) then
      local Name, SpecCheck, MiscCheck, AddSpace = ClassSkill[1], false, false, ""
      --We check to see if the current Skill is from the class. If it is not, we switch to the 'Misc' table.
      --And yes, this does implicitly trust that the given 'Class' argument is always correct.
      local Skill = ClassRef.Skills[Name]
      if( type(Skill) == "nil" ) then Skill = Misc.Skills[Name] MiscCheck = true end
      if( Skill[2][2] == "OffHand" ) then AddSpace = " " end
      local WeaponCheck = GetBool(ClassAbbr .. Skill[2][1] .. AddSpace)
      
      --If the skill we're looking at is allowed by our specialization, we continue to the next check.
      --We do need to specify 'true' here. Result is either 'true' or a table.
      if( Skill[1] == true ) then
        SpecCheck = true
      else
        --If the skill has specialization requirements, we check for a match.
        for k2, ID in ipairs(Skill[1]) do
          if( ID == Spec ) then SpecCheck = true break end
        end
      end
      
      --If the Skill we're looking at is not from the user's preferred weapon, we check against the Skill Whitelist.
      if( not WeaponCheck ) then
        local CurrentType = Skill[2][1]
        for k2, ID in ipairs(SkillWhiteList) do
          if( CurrentType == ID or MiscCheck ) then WeaponCheck = true break end
        end
      end
      
      --If the skill we're looking at is a skill that should be displayed, we create markers and display them.
      if( SpecCheck and WeaponCheck ) then
        SkillAmt = SkillAmt + 1
        --Create Skill Markers
        CreateSkillMarkers(Marker, Name, SkillAmt, 2, MiscCheck)
        --If the Skill has a SkillSlot #, we create a Weapon Text Marker for it.
        if( type(Skill[2][3]) == "number" ) then
          CreateWeaponTextMarkers(Marker, Skill[2][1] .. Skill[2][3], SkillAmt, 1)
        end
        
        --If there are any requirements, we combine them into 1 table.
        local ReqRef = {ClassSkill[2], Skill[3]}
        if( #ReqRef[1] > 0 or #ReqRef[2] > 0 ) then
          local ReqList = {}
          for k2, Ref in ipairs(ReqRef) do
            table.move(Ref, 1, #Ref+1, #ReqList+1, ReqList)
          end
          
          --Once we have 1 table with all Requirements, we create our Requirement Markers.
          for k2, Req in ipairs(ReqList) do
            CreateReqMarkers(Marker, Req, SkillAmt, k2)
            if( k2 == #ReqList ) then
              CreateBorderMarkers(Marker, "ReqBorder" .. k2, SkillAmt, ClassRef.Color)
            end
          end
        end
      end
    else
      break
    end
  end
  
  --Once we know how many skills there are, we create the Projector and Borders for them.
  CreateProjectorMarkers(Marker, "Projector" .. SkillAmt, 1)
  CreateBorderMarkers(Marker, "SkillBorder" .. SkillAmt, 1, ClassRef.Color)
end

--Clears ALL Markers within the marker's category (except for the marker itself).
function HMP_ClearFractalProjectorMarkers(Marker)
  local AllMarkers = World:CategoryByType(Marker.Category.Namespace):GetMarkers(true)
  for k1, a in ipairs(AllMarkers) do
    if( a.Guid ~= Marker.Guid ) then
      a:Remove()
    end
  end
end

--Allows ALL Markers within the marker's category to be visible (without affecting the marker itself).
function HMP_ShowFractalProjectorMarkers(Marker)
  local AllMarkers = World:CategoryByType(Marker.Category.Namespace):GetMarkers(true)
  for k1, a in ipairs(AllMarkers) do
    if( a.Guid ~= Marker.Guid ) then
      a.InGameVisibility = true
    end
  end
end

--Allows ALL Markers within the marker's category to *not* be visible (without affecting the marker itself).
function HMP_HideFractalProjectorMarkers(Marker)
  local AllMarkers = World:CategoryByType(Marker.Category.Namespace):GetMarkers(true)
  for k1, a in ipairs(AllMarkers) do
    if( a.Guid ~= Marker.Guid ) then
      a.InGameVisibility = false
    end
  end
end