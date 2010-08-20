use sdl, gl
import sdl, gl

particleFlags: enum from UChar
{
		TYPE_PART          = 0b00000001
		TYPE_LIQUID        = 0b00000010
		TYPE_SOLID         = 0b00000100
		TYPE_GAS           = 0b00001000
		TYPE_FLASH         = 0b00010000
		PROP_CONDUCTS      = 0b00100000
		PROP_RADIOACTIVE   = 0b01000000
}

status: Int;
//increments by one each time screen is updated...
frames: UInt = 0;

renderLoop: func {}

quit: func {
		sdlQuit()
}

particle: class {
		kill: func {}
}

renderScene: func {
		sdlGLSwapBuffers()
}

glEnable2D: func () {
		vPort: Int* = gc_malloc(Int size * 4)
		glGetIntegerv(glEnum viewport, vPort)
		glMatrixMode(glEnum projection)
		glPushMatrix()
		glLoadIdentity()
		glOrtho(0, vPort[2] as GLdouble, 0, vPort[3], -1, 1)
		glPushMatrix()
		glLoadIdentity()
}

main: func {
    "Starting The Powder Toy\n" println()
    sdlWMSetCaption("The Powder Toy", null);
    sdlInit(SDLInitFlags everything);
    screen := sdlSetVideoMode(640, 480, 16, (SDLVideoFlags opengl | SDLVideoFlags doubleBuffer))
    glEnable2D()
    sdlGLSetAttribute(SDLSurfaceFlags doubleBuffer, 1);
    renderLoop()
    quit()
}
