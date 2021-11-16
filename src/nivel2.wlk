import wollok.game.*
import fondo.*
import personajes.*
import utilidades.*
import elementos.*
import nivelEnergia.*
import nivel1.*

object nivelLlaves {
	var property enemigosTotal = 0
//	var visualesNivel = [personajeNivel2, new Enemigo(image="personaje01.png", dineroQueOtorga = 5),
//		new Enemigo(image="personaje02.png", dineroQueOtorga = 10), new Enemigo(image="personaje03.png", dineroQueOtorga = 15),
//		new CeldaSorpresa(), new CeldaSorpresa()]
//		
//	var posiciones = utilidadesParaJuego.crearPosicionesAleatorias(visualesNivel.size())
	
	//method cantidadEnemigos() = visualesNivel.count({ v => v.esEnemigo()})
	
	//method sacarEnemigo(enemigo) { visualesNivel.remove(enemigo)}
	
	method inicializarVisuales() {
		var visualesNivel = [personajeNivel2, new Enemigo(image="personaje01.png", dineroQueOtorga = 5),
		new Enemigo(image="personaje02.png", dineroQueOtorga = 10), new Enemigo(image="personaje03.png", dineroQueOtorga = 15),
		new CeldaSorpresa(), new CeldaSorpresa()]
		enemigosTotal = visualesNivel.count({ v => v.esEnemigo()})
		var posiciones = utilidadesParaJuego.crearPosicionesAleatorias(visualesNivel.size())
		
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
		
		//personajeNivel2.indEnergia().actualizarDigitos(personajeNivel2.energia())
		
	}
	
	method configurate() {
		self.inicializarVisuales()
//		// Agregar el fondo
//		game.addVisual(new Fondo(image="fondoSegundoNivel.png"))
//			
//			
//		// Agregar visuales con posicion aleatoria
//		(0..(visualesNivel.size() - 1)).forEach({ i => 
//			visualesNivel.get(i).position(posiciones.get(i))
//			game.addVisual(visualesNivel.get(i))
//		})
//			
//		// Agregar indicadores
//		personajeNivel2.indDinero().dibujarElementos()
//		personajeNivel2.indSalud().dibujarElementos()
//		personajeNivel2.indEnergia().dibujarElementos()
			
		keyboard.right().onPressDo({ personajeNivel2.moverDerecha() })
		keyboard.left().onPressDo({ personajeNivel2.moverIzquierda() })
		keyboard.up().onPressDo({ personajeNivel2.moverArriba() })
		keyboard.down().onPressDo({ personajeNivel2.moverAbajo() })
	}
	
	method ganar() {
		game.clear()
		game.addVisual(new Fondo(image="winner.png"))
		/*personajeNivel1.energia(50)
		personajeNivel2.energia(50)
		personajeNivel1.indEnergia().actualizarDigitos(personajeNivel1.energia())
		personajeNivel2.indEnergia().actualizarDigitos(personajeNivel2.energia())
		personajeNivel2.enemigos(0)*/
		personajeNivel1.reiniciarIndicadores()
		personajeNivel2.reiniciarIndicadores()
		deposito.bloquesGuardados(0)
		keyboard.e().onPressDo{nivelBloques.configurate()}
		keyboard.s().onPressDo{game.stop()}

	}
	
}
