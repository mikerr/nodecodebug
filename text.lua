require ("minfont4x5")
require ("codebug")

-- demo individual letters
codebug_display_char("A")
tmr.delay(1000000)
codebug_display_char("B")
tmr.delay(1000000)

-- show entire font
for i, v in pairs(font) do
      codebug_display_char(tostring(i))
	 tmr.delay(1000000)
end

-- count 1 to 9
for i=0,9 do
      codebug_display_char(tostring(i))
	 tmr.delay(1000000)
end
