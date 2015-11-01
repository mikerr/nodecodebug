id=0
sda=1
scl=2
CODEBUG=0x18
SET=3
GET=1

i2c.setup(id,sda,scl,i2c.SLOW)

function codebug_set_row(line, value)
	i2c.start(id)
	i2c.address(id,CODEBUG,i2c.TRANSMITTER)
	i2c.write(id,SET)
	i2c.write(id,line)
	i2c.write(id,tonumber(value,2))
	i2c.stop(id)
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

	print(string.byte(c))
end

function codebug_clear ()
	for i=0,4 do
		codebug_set_row(i,0)
	end
	
end


codebug_clear()
