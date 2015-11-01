id=0
sda=1
scl=2
CODEBUG=0x18
SET=3
LED_LINE=1

i2c.setup(id,sda,scl,i2c.SLOW)
i2c.start(id)
i2c.address(id,CODEBUG,i2c.TRANSMITTER)
i2c.write(id,SET)
i2c.write(id,LED_LINE)
i2c.write(id,15)
-- 15 = 01111 in binary - lighting up those 4 LEDS
