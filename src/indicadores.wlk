import personajes.*
import wollok.game.*

class Indicador {
	var property posicionInicial 
	var property imagen
	var property nivelInicial
	var elementos = [new Icono(image = imagen, position = posicionInicial),
		 			new PrimerDigito(image = nivelInicial.div(10).toString() + ".png", position = posicionInicial.right(1)),
					new SegundoDigito(image = (nivelInicial % 10).toString() + ".png", position = posicionInicial.right(2))]
	
	method dibujarElementos() { elementos.forEach({ e => game.addVisual(e) })}
	
	method actualizarDigitos(valor) { elementos.forEach({ e => e.actualizar(valor) }) }
}

//para que no colisione con los elementos...
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