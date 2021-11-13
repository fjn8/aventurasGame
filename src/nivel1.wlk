import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel2.*
import utilidades.*
import nivelEnergia.*

object nivelBloques {

	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image="fondoPrimerNivel.jpg"))
				 
		// otros visuals, p.ej. bloques o llaves
		game.addVisual(new Bloque(position=game.at(13, 0)))
		game.addVisual(new Bloque(position=game.at(5, 2)))
		game.addVisual(new Bloque(position=game.at(2, 3)))
		game.addVisual(new Bloque(position=game.at(14, 5)))
		game.addVisual(new Provision(position=game.at(14, 1)))
		game.addVisual(new Provision(position=game.at(5, 3)))
		game.addVisual(new Provision(position=game.at(3, 4)))
		game.addVisual(new Provision(position=game.at(10, 0)))
		game.addVisual(deposito)
//		game.addVisual(energiaPrimerDigito)
//		game.addVisual(energiaSegundoDigito)
		nivelEnergia.dibujarDigitos()
			
		// personaje, es importante que sea el último visual que se agregue
		game.addVisual(personajeSimple)
		
		// teclado
		// este es para probar, no es necesario dejarlo
		keyboard.right().onPressDo({ personajeSimple.moverDerecha() })
		keyboard.left().onPressDo({ personajeSimple.moverIzquierda() })
		keyboard.up().onPressDo({ personajeSimple.moverArriba() })
		keyboard.down().onPressDo({ personajeSimple.moverAbajo() })
		keyboard.space().onPressDo({ personajeSimple.agarrarProvision() })
		// en este no hacen falta colisiones
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

