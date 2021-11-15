import wollok.game.*
import nivel1.*
import personajes.*
import elementos.*
import fondo.*
import nivelEnergia.* 

object utilidadesParaJuego {
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
			personajeNivel1.energia(50)
			personajeNivel2.energia(50)
			personajeNivel2.salud(40)
			personajeNivel2.dinero(0)
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

