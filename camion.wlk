import almacen.*
import cosas.*
import rutas.*

object camion {
	var property cosas = #{}

	const tara = 1000
		
	method cargar(unaCosa) {
		unaCosa.efectoDeCarga()
		cosas.add(unaCosa)
	}

	method descargar(cosa) {
		cosas.remove(cosa)
	}

	method ultimoCargado(){
		return cosas.asList().last()
	}

	method hayCosa(cosaBuscada) {
		return cosas.contains(cosaBuscada)
	} 

	method todoPesoPar() {
		return cosas.all({cosa => self.pesoPar(cosa)})
	} 

	method pesoPar(cosa){
		return (cosa.peso() % 2) == 0
	}

	method hayAlgunoQuePesa(peso){
		return cosas.any({cosa => cosa.peso() == peso})
	}

	method elDeNivel(nivel){
		self.verificarSiExisteUnaCosaConNivel(nivel)
		return cosas.find({cosa => cosa.nivelPeligrosidad() == nivel})
	}

	method verificarSiExisteUnaCosaConNivel(nivel){
		return if (not self.hayAlgunoConNivel(nivel)) self.error("No existe un elemento con el nivel: " + nivel)  
	}

	method hayAlgunoConNivel(nivel){
		return cosas.any({cosa => cosa.nivelPeligrosidad() == nivel})
	}

	method pesoTotal(){
		return tara + self.pesos()
	}

	method excedidoDePeso() {
		return self.pesoTotal() > 2500
	}

	method objetosQueSuperanPeligrosidad(nivel){
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}

	method objetosMasPeligrososQue(cosa){
		return self.objetosQueSuperanPeligrosidad(cosa.nivelPeligrosidad())
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return not (self.excedidoDePeso() || self.hayCosaConNivel(nivelMaximoPeligrosidad))
	}

	method hayCosaConNivel(nivel) {
		return not self.objetosQueSuperanPeligrosidad(nivel).isEmpty()
	}

	method tieneAlgoQuePesaEntre(min,max) {
		return cosas.any({cosa => cosa.peso() >= min && cosa.peso() <= max})
	}

	method cosaMasPesada(){
		self.verificarSiEstaVacia()
		return cosas.max({cosa => cosa.peso()})
	}

	method verificarSiEstaVacia() {
		return if(self.camionVacio()) self.error("No hay cosas en el camion")
	}

	method camionVacio() {
		return cosas.isEmpty()
	}

	method pesos(){
		return cosas.map({cosa => cosa.peso()}).sum()
	}

	method totalBultos(){
		return cosas.sum({cosa => cosa.bultos()})
	}

	method verificarSiPuedeViajar(destino,camino) { 
		return if (not self.puedeViajar(destino, camino)) self.error("El camion no puede viajar\nmaximoBultos: " + destino.maximoBultos() + "\n peso camion: " + self.pesoTotal() + "\n nivelMax: " + self.cosaMasPeligrosa() + "\n bultos Camion:" + self.totalBultos())
	}

	method puedeViajar(destino,camino) {
		return (not self.excedidoDePeso() && destino.puedeAlmacenar(self) && camino.puedeCircular(self))
	}

	method cosaMasPeligrosa(){
		self.verificarSiEstaVacia()
		return cosas.max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad() 
	}

	method transportar(destino, camino){
		self.verificarSiPuedeViajar(destino, camino)
		destino.almacenar(cosas)
		cosas = #{}


	}
}
