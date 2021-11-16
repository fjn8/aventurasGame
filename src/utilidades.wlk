import wollok.game.*
import nivel1.*
import personajes.*
import elementos.*
import fondo.*

object utilidadesParaJuego {
	
	//chequear elementos que caen del tablero
	
	method estaFueraDelTablero(elemento) = not(elemento.position().y().between(0, game.height() - 1)) or not(elemento.position().x().between(0, game.width() - 1))
	
	method posicionArbitraria() {
		return game.at(
			1.randomUpTo(game.width() - 1).truncate(0), 1.randomUpTo(game.height() - 1).truncate(0)
		)
	}
	
	method hayColision(elemento) {
		return game.colliders(elemento) != []
	}
	
	method perder() {
		game.schedule(0, {
			game.clear()
			game.addVisual(new Fondo(image="gameover.png"))
			personajeNivel1.reiniciarIndicadores()
		    personajeNivel2.reiniciarIndicadores()
			deposito.bloquesGuardados(0)
			keyboard.e().onPressDo{nivelBloques.configurate()}
		    keyboard.s().onPressDo{game.stop()}
		})
	}
	
	method crearPosicionesAleatorias(n) {
		var posiciones = []
		
		n.times({ i =>  self.agregarPosicionAleatoria(posiciones) })
		
		return posiciones
	}
	
	method agregarPosicionAleatoria(lista) {
		var posicion = self.posicionArbitraria()
		
		if(lista.contains(posicion)) {
			self.agregarPosicionAleatoria(lista)
		} else {
			lista.add(posicion)
		}
	}
}

