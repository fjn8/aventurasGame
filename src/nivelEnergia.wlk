import personajes.*
import wollok.game.*

// Buscarle la vuelta para instanciar
object nivelEnergia {
	var digitos = [primerDigito, segundoDigito]
	
	method dibujarDigitos() {
		digitos.forEach({ d => 
			game.addVisual(d)
		})
	}
	
	method actualizarDigitos(energia) { digitos.forEach({ d => d.actualizar(energia) }) }
	
}

class Digito {
	method colisionarConPersonaje(personaje) { }
	method guardar(elemento) { }
	method energia() = 0
}

object primerDigito inherits Digito {
	var property position = game.at(0, game.height() - 1)
	var property image = personajeNivel1.energia().div(10).stringValue() + ".png"
	
	method actualizar(energia) { image = energia.div(10).stringValue() + ".png" }
}

object segundoDigito inherits Digito {
	var property position = game.at(1, game.height() - 1)
	var property image = (personajeNivel1.energia() % 10).toString() + ".png"
	
	method actualizar(energia) { image = (energia % 10).toString() + ".png" }
}