import wollok.game.*
import nivel1.*
import utilidades.*
import personajes.*

class Bloque {
	var property position = 0

	method colisionarConPersonaje(personaje) {
		const movimientoX = personaje.posicionAnterior().x() - personaje.position().x()
		const movimientoY = personaje.posicionAnterior().y() - personaje.position().y()
		
		self.position(game.at(position.x() - movimientoX, position.y() - movimientoY))
		
		if(utilidadesParaJuego.hayColision(self)) {
			game.onCollideDo(self, { e => e.guardar(self)})
		}
	}
	
	method esProvision() = false
	method guardar(elemento) { }
}

class Petardo inherits Bloque {
	var property image = "petardo.png"
}

object encendedor inherits Bloque {
	var property image = "encendedor.png"
}

object deposito {
	var property position = 0
	const property image = "alcantarilla.png"
	var property cajasGuardadas = 0
	
	method colisionarConPersonaje(personaje) { }
	
	method guardar(elemento) {
		game.removeVisual(elemento)
		cajasGuardadas += 1
		if(cajasGuardadas == 4) {
			encendedor.position(utilidadesParaJuego.posicionArbitraria())
			game.addVisual(encendedor)
		}
		
		if(cajasGuardadas == 5) { 
			game.sound("explosion.mp3")
			game.schedule(2500, {
				nivelBloques.terminar()
			})
		}
	}
	
	method esProvision() = false
}

class Caramelo {
	var property position = 0
	var property image 
	var property energia
	
	method colisionarConPersonaje(personaje) { }
	
	method esProvision() = true
	method guardar() { }
}