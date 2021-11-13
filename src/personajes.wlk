import wollok.game.*
import utilidades.*
import nivel1.*
import elementos.*
import fondo.*
import nivelEnergia.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición

object personajeSimple {
	var property position = game.at(10,8)
	const property image = "edys.png"	
	var property posicionAnterior
	var property energia = 99

	method agarrarProvision() {
		if(self.hayProvisionesAlrededor()) {
			self.provisionesAlrededor().forEach({ p => 
				energia += p.energia()
				game.removeVisual(p)
			})
			nivelEnergia.actualizarDigitos(energia)
		}
	}
	
	method hayProvisionesAlrededor() {
		return not self.provisionesAlrededor().isEmpty()
	}
	
	method provisionesAlrededor() {
		var provisiones = []
		game.getObjectsIn(position.right(1)).forEach({ p => provisiones.add(p) })
		game.getObjectsIn(position.left(1)).forEach({ p => provisiones.add(p) })
		game.getObjectsIn(position.up(1)).forEach({ p => provisiones.add(p) })
		game.getObjectsIn(position.down(1)).forEach({ p => provisiones.add(p) })
		
		return provisiones.filter({ p => p.esProvision() })
	}
	
	method cambiarPosicion(pos) {
		self.posicionAnterior(self.position())
		self.position(pos)
		energia -= 1
		nivelEnergia.actualizarDigitos(energia)
		if(utilidadesParaJuego.hayColision(self)) {
			game.onCollideDo(self, { e => e.colisionarConPersonaje(self) })
		}
		
		if(energia == 0) {
			utilidadesParaJuego.perder()
		}
	}
	
	method moverDerecha() { 
		if(position.x() < game.width() - 1) {
			self.cambiarPosicion(position.right(1))
		} else {
			self.cambiarPosicion(game.at(0, position.y()))
		}
	}
	
	method moverIzquierda() { 
		if(position.x() != 0) {
			self.cambiarPosicion(position.left(1))
		} else {
			self.cambiarPosicion(game.at(game.width() - 1, position.y()))
		}
	}
	
	method moverArriba() { 
		if(position.y() < game.height() - 1) {
			self.cambiarPosicion(position.up(1))
		} else {
			self.cambiarPosicion(game.at(position.x(), 0))
		}
	}
	
	method moverAbajo() { 
		if(position.y() != 0) {
			self.cambiarPosicion(position.down(1))
		} else {
			self.cambiarPosicion(game.at(position.x(), game.height() - 1))
		}
	}	
}

