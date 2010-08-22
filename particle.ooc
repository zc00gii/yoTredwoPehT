particleFlags: enum from UShort
{
		TYPE_PART          = 0b0000000000000001
		ST_LIQUID          = 0b0000000000000010
		ST_SOLID           = 0b0000000000000100
		ST_GAS             = 0b0000000000001000
		ST_FLASH           = 0b0000000000010000
		TYPE_WALL          = 0b0000000000100000
		PROP_CONDUCTS      = 0b0000000001000000
		PROP_RADIOACTIVE   = 0b0000000010000000
}

temp: class {
		kelvin: Float
		celsius: Float
		fahrenheit: Float
		init: func (=kelvin) {
				this updateTemps()
		}
		setTemp: func (=kelvin) {
				updateTemps()
		}
		setTemps: func (=kelvin, =celsius, =fahrenheit)
		updateTemps: func() {
				// To celsius
				this celsius = this kelvin - 273.15
				//  To fahrenheit
				this fahrenheit = (this celsius * 1.8) + 32
		}
}

particle: class {
		freezingPoint: temp
		meltingPoint: temp
		boilingPoint: temp
		burningPoint: temp
		properties: UShort
}
