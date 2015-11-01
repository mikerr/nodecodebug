id=0
sda=1
scl=2
CODEBUG=0x18
SET=3
GET=1

i2c.setup(id,sda,scl,i2c.SLOW)

function codebug_clear ()
	for i=0,4 do
		codebug_set_row(i,0)
	end	
end

function codebug_set_row(line, value)
	i2c.start(id)
	i2c.address(id,CODEBUG,i2c.TRANSMITTER)
	i2c.write(id,SET)
	i2c.write(id,line)
	i2c.write(id,value)
	i2c.stop(id)
end

function codebug_set_row_binary(line, value)
	codebug_set_row(line,tonumber(value,2))
end

function codebug_get_row(line)
	i2c.start(id)
	i2c.address(id,CODEBUG,i2c.TRANSMITTER)
	i2c.write(id,GET)
	i2c.write(id,line)
	i2c.stop(id)

	i2c.start(id)
	i2c.address(id, CODEBUG, i2c.RECEIVER)
	c=i2c.read(id,1)
	i2c.stop(id)

	return (tonumber(string.byte(c)))
end

function codebug_set_pixel(x,y,value)
	oldrowdata = codebug_get_row(y)
	newrowdata = bit.lshift(1,(4-x))

 	if (value == 1) then
		mergedata = bit.bor(oldrowdata, newrowdata)
	else
		newrowdata = bit.bxor(255,newrowdata) 
		mergedata = bit.band(oldrowdata, newrowdata)
	end
	codebug_set_row(y,mergedata)
end


codebug_clear()


for x=0,4 do
	for y = 0,4 do 
		codebug_set_pixel(x,y,1)
		tmr.delay(50000)
	end
end

for x=0,4 do
	for y = 0,4 do 
		codebug_set_pixel(x,y,0)
		tmr.delay(50000)
	end
end
