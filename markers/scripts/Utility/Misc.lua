Utility.Misc = {
  --Sets all elements of a table to the specified value.
  ResetTable = function(table, value)
    for i = 1, #table do
      if( type(table[i]) == "table" ) then
        for j = 1, #table[i] do
          table[i][j] = value
        end
      else
        table[i] = value
      end
    end
  end,
}