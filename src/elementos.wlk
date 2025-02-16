import wollok.game.*
import nivel1.*
import utilidades.*
import personajes.*
import nivel2.*

// Elementos del tablero que el personaje puede mover
class Bloque {
	var property image
	var property position = 0

	method colisionarConPersonaje(personaje) {
		const movimientoX = personaje.posicionAnterior().x() - personaje.position().x()
		const movimientoY = personaje.posicionAnterior().y() - personaje.position().y()
		
		// si no esta en algun borde
		self.position(game.at(position.x() - movimientoX, position.y() - movimientoY))
		
		if(utilidadesParaJuego.hayColision(self)) {
			game.onCollideDo(self, { e => e.guardar(self)})
		}
		
		if(utilidadesParaJuego.estaFueraDelTablero(self){
			utilidadesParaJuego.perder()
		}
	}
	
	method energia() = 0
	method guardar(elemento) { }
}


// Alcantarilla donde se acumulan los elementos
object deposito {
	var property position = 0
	const property image = "alcantarilla.png"
	var property bloquesGuardados = 0
	
	method colisionarConPersonaje(personaje) { }
	
	method guardar(elemento) {
		game.removeVisual(elemento)
		bloquesGuardados += 1
		if(bloquesGuardados == 4) {
			const encendedor = new Bloque(image="encendedor.png")
			encendedor.position(utilidadesParaJuego.posicionArbitraria())
			game.addVisual(encendedor)
		}
		
		if(bloquesGuardados == 5) { 
			game.sound("explosion.mp3").play()
			game.schedule(2500, {
				nivelBloques.ganar()
			})
		}
	}
	
	method energia() = 0
}

// Provisiones que suman energia
class Caramelo {
	var property position = 0
	var property image 
	var property energia
	
	method colisionarConPersonaje(personaje) { }
	
	method guardar(elemento) { }
}

// Objetos nivel 2
class Enemigo {
	var property position = 0
	var property image
	var property dineroQueOtorga
	
	method colisionarConPersonaje(personaje) {
		self.darDinero(personaje)
		self.quitarSalud(personaje)
		personaje.indDinero().actualizarDigitos(personaje.dinero())
		personaje.indSalud().actualizarDigitos(personaje.salud())
		game.removeVisual(self)
		personaje.enemigos(personaje.enemigos()+1) //le sumo un enemigo

		if(personaje.enemigos() == nivelLlaves.enemigosTotal()){
			game.addVisual(puerta)
		}
		
	} 
	
	method esEnemigo() = true
	
	method quitarSalud(personaje) {
		personaje.salud(personaje.salud() - dineroQueOtorga.div(dineroQueOtorga)*3)
		personaje.indSalud().actualizarDigitos(personaje.salud())
		
		if(personaje.salud() < 1) {
			utilidadesParaJuego.perder()
		}
	}
	
	method darDinero(personaje) {
		personaje.dinero(personaje.dinero() + dineroQueOtorga)
		personaje.indDinero().actualizarDigitos(personaje.dinero())
	}
}

class CeldaSorpresa {
	var property position = 0
	var property image = "caja.png"
	var property saludQueOtorga = -10.randomUpTo(5).roundUp()
	var property energiaQueOtorga = -10.randomUpTo(5).roundUp()
	
	method colisionarConPersonaje(personaje) {
		personaje.salud(personaje.salud() + saludQueOtorga)
		personaje.energia(personaje.energia() + energiaQueOtorga)
		personaje.indSalud().actualizarDigitos(personaje.salud())
		personaje.indEnergia().actualizarDigitos(personaje.energia())
		game.removeVisual(self)
		if(personaje.salud() < 1) {
			utilidadesParaJuego.perder()
		}
	}
	
	method esEnemigo() = false
}

object puerta {
	var property position = utilidadesParaJuego.posicionArbitraria()
	var property image = "puerta.png"
	
	method colisionarConPersonaje(personaje){
		nivelLlaves.ganar()
	}
	
}