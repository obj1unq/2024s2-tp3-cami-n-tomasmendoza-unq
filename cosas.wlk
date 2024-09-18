object knightRider {
	method peso() = 500
	
	method nivelPeligrosidad() = 10
}

object bumbleblee {
	var transformado = false
	
	method peso() = 800
	
	method nivelPeligrosidad() = if (transformado) 15 else 30
	
	method transformado(_transformado) {
		transformado = _transformado
	}
}

object paqueteDeLadrillos {
	var cantLadrillos = 0
	var nivelPeligrosidad = 2
	
	method peso() = cantLadrillos * 2
	
	method cargarLadrillos(cant) {
		cantLadrillos += cant
	}
	
	method cantLadrillos() = cantLadrillos
}

object arenaGranel {
	var property peso = null
	var nivelPeligrosidad = 1
}

object bateriaAntiarea {
	var tieneMisiles = false
	
	method peso() = if (tieneMisiles) 300 else 200
	
	method nivelPeligrosidad() = if (tieneMisiles) 100 else 0
}

object contenedorPortuario {
	
}
