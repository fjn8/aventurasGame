import wollok.game.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición

object personajeSimple {
	var property position = game.at(10,8)
	const property image = "player.png"	
	var property posicionAnterior
	
	method hayColision() {
		return game.colliders(self) != []
	}
	
	method cambiarPosicion(pos) {
		self.posicionAnterior(self.position())
		self.position(pos)
		if(self.hayColision()) {
			game.onCollideDo(self, { e => e.colisionar(self)})
		}
	}
	
	method moverDerecha() { 
//		self.posicionAnterior(position)
		if(position.x() < game.width() - 1) {
			self.cambiarPosicion(position.right(1))
		} else {
			self.cambiarPosicion(game.at(0, position.y()))
		}
	}
	
	method moverIzquierda() { 
//		self.posicionAnterior(position)
		if(position.x() != 0) {
			self.cambiarPosicion(position.left(1))
		} else {
			self.cambiarPosicion(game.at(game.width() - 1, position.y()))
		}
	}
	
	method moverArriba() { 
//		self.posicionAnterior(position)
		if(position.y() < game.height() - 1) {
			self.cambiarPosicion(position.up(1))
		} else {
			self.cambiarPosicion(game.at(position.x(), 0))
		}
	}
	
	method moverAbajo() { 
//		self.posicionAnterior(position)
		if(position.y() != 0) {
			self.cambiarPosicion(position.down(1))
		} else {
			self.cambiarPosicion(game.at(position.x(), game.height() - 1))
		}
	}
}

