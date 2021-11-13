import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel2.*
import utilidades.*
import nivelEnergia.*

object nivelBloques {
	var visualesNivel = [new Petardo(), new Petardo(), new Petardo(), new Petardo(), 
		new Caramelo(image = "caramelo1.png", energia = 2), new Caramelo(image = "caramelo1.png", energia = 2), 
		new Caramelo(image = "caramelo2.png", energia = 5), new Caramelo(image = "caramelo3.png", energia = 10),
		deposito, personajeSimple
	] 
	
	method asignarPosiciones() {
		var posiciones = utilidadesParaJuego.crearPosicionesAleatorias(visualesNivel.size())
		var i = 0
		visualesNivel.size().times({ i => 
			visualesNivel.get(i - 1).position(posiciones.get(i - 1))
		})
	}
	
	method configurate() {
		game.addVisual(new Fondo(image="fondoPrimerNivel.jpg"))
		self.asignarPosiciones()
		visualesNivel.forEach({ v =>  
			game.addVisual(v)
		})
		
		nivelEnergia.dibujarDigitos()
			
		
		keyboard.right().onPressDo({ personajeSimple.moverDerecha() })
		keyboard.left().onPressDo({ personajeSimple.moverIzquierda() })
		keyboard.up().onPressDo({ personajeSimple.moverArriba() })
		keyboard.down().onPressDo({ personajeSimple.moverAbajo() })
		keyboard.space().onPressDo({ personajeSimple.agarrarProvision() })
	}
	
	method terminar() {
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image="fondoCompleto.png"))
		game.addVisual(personajeSimple)
		// después de un ratito ...
		game.schedule(2500, {
			game.clear()
			// cambio de fondo
			game.addVisual(new Fondo(image="finNivel1.png"))
			// después de un ratito ...
			game.schedule(3000, {
				// ... limpio todo de nuevo
				game.clear()
				// y arranco el siguiente nivel
				nivelLlaves.configurate()
			})
		})
	}
		
}

