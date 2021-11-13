import wollok.game.*
import nivel1.*
import utilidades.*
import personajes.*

class Bloque {
	var property position
	const property image = "petardo.png"

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

object deposito {
	var property position = utilidadesParaJuego.posicionArbitraria()
	const property image = "alcantarilla.png"
	var property cajasGuardadas = 0
	
	method colisionarConPersonaje(personaje) { }
	
	method guardar(elemento) {
		game.removeVisual(elemento)
		cajasGuardadas += 1
		if(cajasGuardadas == 4) {
			nivelBloques.terminar()
		}
	}
	
	method esProvision() = false
}

class Provision {
	var property position
	var property image = "estrella.png"
	
	method colisionarConPersonaje(personaje) { }
	
	method esProvision() = true
	method energia() = 1
}