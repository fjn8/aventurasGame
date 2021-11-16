import wollok.game.*
import fondo.*
import personajes.*
import utilidades.*
import elementos.*
import nivel1.*

object nivelLlaves {
	var property enemigosTotal = 0
	
	method inicializarVisuales() {
		var visualesNivel = [personajeNivel2, new Enemigo(image="personaje01.png", dineroQueOtorga = 5),
		new Enemigo(image="personaje02.png", dineroQueOtorga = 10), new Enemigo(image="personaje03.png", dineroQueOtorga = 15),
		new Enemigo(image="personaje04.png", dineroQueOtorga = 25), new Enemigo(image="personaje05.png", dineroQueOtorga = 20), 
		new CeldaSorpresa(), new CeldaSorpresa(), new CeldaSorpresa(), new CeldaSorpresa()]
		
		var posiciones = utilidadesParaJuego.crearPosicionesAleatorias(visualesNivel.size())
		
		//setea la cant de enemigos del nivel2
		enemigosTotal = visualesNivel.count({ v => v.esEnemigo()})
		
		// Agregar el fondo
		game.addVisual(new Fondo(image="fondoSegundoNivel.png"))
			
			
		// Agregar visuales con posicion aleatoria
		(0..(visualesNivel.size() - 1)).forEach({ i => 
			visualesNivel.get(i).position(posiciones.get(i))
			game.addVisual(visualesNivel.get(i))
		})
			
		// Agregar indicadores
		personajeNivel2.indDinero().dibujarElementos()
		personajeNivel2.indSalud().dibujarElementos()
		personajeNivel2.indEnergia().dibujarElementos()
				
	}
	
	method configurate() {
		self.inicializarVisuales()
			
		keyboard.right().onPressDo({ personajeNivel2.moverDerecha() })
		keyboard.left().onPressDo({ personajeNivel2.moverIzquierda() })
		keyboard.up().onPressDo({ personajeNivel2.moverArriba() })
		keyboard.down().onPressDo({ personajeNivel2.moverAbajo() })
	}
	
	method ganar() {
		game.clear()
		game.addVisual(new Fondo(image="winner.png"))
		personajeNivel1.reiniciarIndicadores()
		personajeNivel2.reiniciarIndicadores()
		deposito.bloquesGuardados(0)
		keyboard.e().onPressDo{nivelBloques.configurate()}
		keyboard.s().onPressDo{game.stop()}

	}
	
}
