--If this is the user's first time using the pack, we set to true
if( Storage:ReadValue("hmp", "PackScriptToggle") == nil ) then
  Storage:UpsertValue("hmp", "PackScriptToggle", "true")
end

--Returns true/false based on the stored value
function GetBool(toggle)
  if( Storage:ReadValue("hmp", toggle) == "true" ) then return true else return false end
end

--Switches the stored value's true/false state
function ToggleStorage(toggle)
  if( Storage:ReadValue("hmp", toggle) == "true" ) then
    Storage:UpsertValue("hmp", toggle, "false")
  else
    Storage:UpsertValue("hmp", toggle, "true")
  end
end

--This function is a template for any and all future menu toggles
--because these functions can't support more than the 'menu' argument.
function TogglePackScriptToggle(menu)
  ToggleStorage("PackScriptToggle")
  menu.Checked = GetBool("PackScriptToggle")
end