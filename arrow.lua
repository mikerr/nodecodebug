id=0
sda=1
scl=2
CODEBUG=0x18
SET=3

i2c.setup(id,sda,scl,i2c.SLOW)

function codebug_set_row(line, value)
	i2c.start(id)
	i2c.address(id,CODEBUG,i2c.TRANSMITTER)
	i2c.write(id,SET)
	i2c.write(id,line)
	i2c.write(id,tonumber(value,2))
end

codebug_set_row(4, 11100)
codebug_set_row(3, 11000)
codebug_set_row(2, 10100)
codebug_set_row(1, 00010)
codebug_set_row(0, 00001)
