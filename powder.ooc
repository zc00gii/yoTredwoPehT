use sdl, gl
import sdl, gl, particle

main: func {
		"Starting The Powder Toy\n" println()
		sdlWMSetCaption("The Powder Toy", null);
		sdlInit(SDLInitFlags everything)
		screen := sdlSetVideoMode(640, 480, 16, (SDLVideoFlags opengl))
		sdlGLSetAttribute(SDLSurfaceFlags doubleBuffer, 1)
		glClearColor(0, 0, 0, 0)
		glMatrixMode(glEnum projection)
		glLoadIdentity()
		glOrtho(0, 640, 480, 0, 0, 1)
		glDisable(glEnum depthTest)
		while(1) {
				glClear(glBitfield colorBufferBit)
				glColor(255, 255, 255)
				glBegin(glEnum polygon)
				  glVertex(-7, -7)
				  glVertex(-7, 7)
				  glVertex(7, 7)
				  glVertex(7, -7)
				glEnd()
				glFlush()
				screen flip()
				screen updateRect(0, 0, 0, 0)
		}
}
