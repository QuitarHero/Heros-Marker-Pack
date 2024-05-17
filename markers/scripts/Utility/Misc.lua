Utility.Misc = {
  --Sets all elements of a table to the specified value.
  ResetTable = function(table, value)
    for _, t in ipairs(table) do
      for i = 1, #t do
        t[i] = 0
      end
    end
  end,
}