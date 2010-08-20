use sdl, gl
import sdl, gl

particleFlags: enum from UChar
{
		TYPE_PART          = 0x01 //1
		TYPE_LIQUID        = 0x02 //2
		TYPE_SOLID         = 0x04 //4
		TYPE_GAS           = 0x08 //8
		PROP_CONDUCTS      = 0x10 //16
		PROP_RADIOACTIVE = 0x12 //18
}

status: Int;
//increments by one each time screen is updated...
frames: UInt = 0;

renderLoop: func {}

quit: func
{
		sdlQuit()
}

particle: class
{
		kill: func {}
}

renderScene: func
{
		sdlGLSwapBuffers()
}

glEnable2D: func ()
{
		vPort: Int* = gc_malloc(Int size * 4)
		glGetIntegerv(glEnum viewport, vPort)
		glMatrixMode(glEnum projection)
		glPushMatrix()
		glLoadIdentity()
		glOrtho(0, vPort[2] as GLdouble, 0, vPort[3], -1, 1)
		glPushMatrix()
		glLoadIdentity()
}

main: func
{
    "Starting The Powder Toy\n"
    sdlWMSetCaption("The Powder Toy", null);
    sdlInit(SDLInitFlags everything);
    screen: SDLSurface*= sdlSetVideoMode(640, 480, 16,
				(SDLVideoFlags opengl | SDLVideoFlags doubleBuffer))
    glEnable2D()
    sdlGLSetAttribute(SDLSurfaceFlags doubleBuffer, 1);
    renderLoop()
    quit()
}
