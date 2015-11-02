require ("minfont4x5")
require ("codebug")

function codebug_scroll_string(message,delay)
  for x = 1, string.len(message)	do
  	for scroll=1,8 do
		for i=1,5 do
			char1 = font[string.sub(message,x,x)][i] --
			char2 = font[string.sub(message,x+1,x+1)][i] --
			-- merge two characters bitmaps side by side
			char1 = bit.lshift(char1,scroll)
			char2 = bit.rshift(char2,5 - scroll)
			row = bit.bor(char1,char2)
			-- crop to screen
			row = bit.band(row,31)
			codebug_set_row(i-1,row)
		end
		tmr.delay(delay)
  	end
  end
end


codebug_scroll_string("ABCDEFGHIJKLMN",50000)
