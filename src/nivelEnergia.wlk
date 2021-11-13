import personajes.*
import wollok.game.*

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
}

object primerDigito inherits Digito {
	var property position = game.at(0, game.height() - 1)
	var property image = personajeSimple.energia().div(10).stringValue() + ".png"
	
	method actualizar(energia) { image = energia.div(10).stringValue() + ".png" }
}

object segundoDigito inherits Digito {
	var property position = game.at(1, game.height() - 1)
	var property image = (personajeSimple.energia() % 10).toString() + ".png"
	
	method actualizar(energia) { image = (energia % 10).toString() + ".png" }
}