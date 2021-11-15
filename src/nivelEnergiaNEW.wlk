import personajes.*
import wollok.game.*
//
//// Buscarle la vuelta para instanciar
//object nivelEnergia {
//	var digitos = [new PrimerDigito(y=-1), new SegundoDigito(y=-1), iconoRayo]
//	
//	method dibujarDigitos() {
//		digitos.forEach({ d => 
//			game.addVisual(d)
//		})
//	}
//	
//	method actualizarDigitos(energia) { digitos.forEach({ d => d.actualizar(energia) }) }
//	
//}
//
//object nivelVida {
//	var digitos = [new PrimerDigito(y=-2), new SegundoDigito(y=-2), iconoRayo]
//	
//	method dibujarDigitos() {
//		digitos.forEach({ d => 
//			game.addVisual(d)
//		})
//	}
//	
//	method actualizarDigitos(energia) { digitos.forEach({ d => d.actualizar(energia) }) }
//	
//}
//
//object nivelDinero {
//	var digitos = [new PrimerDigito(y=-3), new SegundoDigito(y=-3), iconoRayo]
//	
//	method dibujarDigitos() {
//		digitos.forEach({ d => 
//			game.addVisual(d)
//		})
//	}
//	
//	method actualizarDigitos(energia) { digitos.forEach({ d => d.actualizar(energia) }) }
//	
//}
//
//class Digito {
//	var property y = 0
//	method colisionarConPersonaje(personaje) { }
//	method guardar(elemento) { }
//	method energia() = 0
//}
//
//object iconoRayo {
//	var property position = game.at(0, game.height() - 1)
//	var property image = "rayo.png"
//}
//object iconoPulso {
//	var property position = game.at(0, game.height() - 2)
//	var property image = "pulso.png"
//}
//
//object iconoDinero {
//	var property position = game.at(0, game.height() - 3)
//	var property image = "dinero.png"
//}

//class PrimerDigito inherits Digito {
//	var property position = game.at(1, game.height() - y)
//	var property image = personajeNivel1.energia().div(10).stringValue() + ".png"
//	
//	method actualizar(energia) { image = energia.div(10).stringValue() + ".png" }
//}
//
//class SegundoDigito inherits Digito {
//	var property position = game.at(2, game.height() - y)
//	var property image = (personajeNivel1.energia() % 10).toString() + ".png"
//	
//	method actualizar(energia) { image = (energia % 10).toString() + ".png" }
//}

class Indicador {
	var property posicionInicial 
	var property imagen
	var property nivelInicial
	var elementos = [new Icono(image = imagen, position = posicionInicial),
		 			new PrimerDigito(image = nivelInicial.div(10).toString() + ".png", position = posicionInicial.right(1)),
					new SegundoDigito(image = (nivelInicial % 10).toString() + ".png", position = posicionInicial.right(2))]
	
	method dibujarElementos() {
		elementos.forEach({ e => 
			game.addVisual(e)
		})
	}
	
	method actualizarDigitos(valor) { elementos.forEach({ e => e.actualizar(valor) }) }
}

class ItemIndicador {
	method colisionarConPersonaje(personaje) { }
	method guardar(elemento) { }
	method energia() = 0
}

class Icono inherits ItemIndicador {
	var property position
	var property image
	
	method actualizar(valor) { }
}

class PrimerDigito inherits ItemIndicador {
	var property position 
	var property image 
	
	method actualizar(valor) { image = valor.div(10).stringValue() + ".png" }
}

class SegundoDigito inherits ItemIndicador {
	var property position 
	var property image 
	
	method actualizar(valor) { image = (valor % 10).toString() + ".png" }
}