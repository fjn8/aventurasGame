import wollok.game.*
import fondo.*
import personajes.*
import utilidades.*
import elementos.*
import utilidades.*

object nivelLlaves {
	var visualesNivel = [personajeNivel2, new Enemigo(image="personaje01.png", dineroQueOtorga = 200),
		new Enemigo(image="personaje02.png", dineroQueOtorga = 100), new Enemigo(image="personaje03.png", dineroQueOtorga = 60),
		new CeldaSorpresa(), new CeldaSorpresa()]
		
	var posiciones = utilidadesParaJuego.crearPosicionesAleatorias(visualesNivel.size())
	
	method configurate() {
		// Agregar el fondo
		game.addVisual(new Fondo(image="fondoSegundoNivel.png"))
			
			
		// Agregar visuales con posicion aleatoria
		(0..(visualesNivel.size() - 1)).forEach({ i => 
			visualesNivel.get(i).position(posiciones.get(i))
			game.addVisual(visualesNivel.get(i))
		})
			
		// Agregar indicador de energia
		// nivelEnergia.dibujarDigitos()
			
		keyboard.right().onPressDo({ personajeNivel2.moverDerecha() })
		keyboard.left().onPressDo({ personajeNivel2.moverIzquierda() })
		keyboard.up().onPressDo({ personajeNivel2.moverArriba() })
		keyboard.down().onPressDo({ personajeNivel2.moverAbajo() })
	}
	
	method ganar() {
		game.clear()
		game.addVisual(new Fondo(image="complete.png"))
		game.schedule(3000, {
			game.stop()
		})
	}
	
	
}
