object knightRider {
	method peso() = 500
	
	method nivelPeligrosidad() = 10

	method efectoDeCarga() {}

	method bultos(){
		return 1
	}
}

object bumbleblee {
	var estadoTransformacion = auto
	
	method peso() = 800
	
	method nivelPeligrosidad() = estadoTransformacion.nivelPeligrosidad() 

	method transformarEnAuto() {
		estadoTransformacion = auto
	}

	method transnformarEnRobot() {
		estadoTransformacion = robot
	}

	method esRobot(){
		return estadoTransformacion == robot
	}
	
	method efectoDeCarga() { self.transnformarEnRobot()}

	method bultos(){
		return 2
	}
}

//----------------

object auto {
	method nivelPeligrosidad(){
		return 15
	}
}

object robot {
	method nivelPeligrosidad() {
		return 30
	}
}

//----------------

object paqueteDeLadrillos {
	var cantLadrillos = 0
	
	method nivelPeligrosidad() {
		return 2
	}
	
	method peso() = cantLadrillos * 2
	
	method cargarLadrillos(cant) {
		cantLadrillos += cant
	}
	
	
	method cantLadrillos() = cantLadrillos
	
	method efectoDeCarga() { self.cargarLadrillos(12)}

    method bultos() {
        if (cantLadrillos >= 1 && cantLadrillos <= 100) {
            return 1
        } else if (cantLadrillos >= 101 && cantLadrillos <= 300) {
            return 2
        } else if (cantLadrillos >= 301) {
            return 3
        } else {
            return 0 // En caso de que no haya ladrillos
        }
    }
}

object arenaGranel {
	
	var peso = 0

	method agregarArena(kilos){
		peso += kilos
	}

	method peso(){
		return peso
	}

	method nivelPeligrosidad() {
		return 1
	} 
	
	method efectoDeCarga() {self.agregarArena(20)}

	method bultos(){
		return 1
	}
}

object bateriaAntiarea {
	var tieneMisiles = false
	
	method peso() = if (tieneMisiles) 300 else 200
	
	method nivelPeligrosidad() = if (tieneMisiles) 100 else 0

	method cargarMisiles() {
		tieneMisiles = true
	}

	method descargarMisiles() {
		tieneMisiles = false
	}

	method estaCargado(){
		return tieneMisiles
	}
	
	method efectoDeCarga() {self.cargarMisiles()}

	method bultos(){
		if(tieneMisiles) {
			return 2
		}
		return 1
	}
}

object contenedorPortuario {
	const property cosas = []	

	method peso() = 100 + self.pesoDelResto()

	method nivelPeligrosidad(){
		return self.cosaMasPeligrosa()
	}

	method verificarSiEstaVacia() {
		return if(cosas.isEmpty()) self.error("No hay cosas en el contenedor")
	}

	method cosaMasPeligrosa(){
		self.verificarSiEstaVacia()
		return cosas.max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad() 
	}

	method agregarCosa(cosa) {
		cosas.add(cosa)
	}


	method pesoDelResto(){
		return cosas.sum({cosa => cosa.peso()})
	} 
	
	method efectoDeCarga() {cosas.forEach({cosa => cosa.efectoDeCarga()})}

	method bultos(){
		return 1 + self.bultosEnCosas()
	}

	method bultosEnCosas(){
		return cosas.sum({cosa => cosa.bultos()})
	}
}

object residuosRadioactivos {
	var peso = 0

	method agregarResiduos(kilos){
		peso += kilos
	}

	method peso(){
		return peso
	}
	method nivelPeligrosidad(){
		return 200
	} 
	
	method efectoDeCarga() {self.agregarResiduos(15)}

	method bultos(){
		return 1
	}
}

object embalajeDeSeguridad {
	var property  cosa = knightRider

	method peso() {
		return cosa.peso()
	}

	method nivelPeligrosidad() {
		return cosa.nivelPeligrosidad() / 2
	} 
	
	method efectoDeCarga() {}

	method bultos(){
		return 2
	}
}