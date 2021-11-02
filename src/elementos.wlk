import wollok.game.*

class Bloque {
	var property position
	const property image = "market.png"
	
	method colisionar(personaje) {
			if(personaje.posicionAnterior().x() - personaje.position().x() == -1) {
				self.moverDerecha()
			}
			if(personaje.posicionAnterior().x() - personaje.position().x() == 1) {
				self.moverIzquierda()
			}
			if(personaje.posicionAnterior().y() - personaje.position().y() == -1) {
				self.moverArriba()
			}
			if(personaje.posicionAnterior().y() - personaje.position().y() == 1) {
				self.moverAbajo()
			}
	}
	
	method moverDerecha() {
		if(position.x() < game.width() - 1) {
			self.position(position.right(1))
		}
	}
	
	method moverIzquierda() {
		if(position.x() != 0){
			self.position(position.left(1))	
		}	
	}
	
	method moverArriba() {
		if(position.y() < game.height() - 1){
			self.position(position.up(1))		
		}
	}
	
	method moverAbajo() {
		if(position.y() != 0) {
			self.position(position.down(1))			
		}
	}
}

