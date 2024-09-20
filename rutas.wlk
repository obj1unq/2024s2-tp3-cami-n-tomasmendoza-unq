import camion.*

object ruta9 {
    method puedeCircular(camion){
        return camion.puedeCircularEnRuta(11)
    }
}

object caminosVecinales {
    var pesoMaximoDeCirculacion = 0

    method pesoMaximoDeCirculacion(_pesoMaximoDeCirculacion) {
        pesoMaximoDeCirculacion = _pesoMaximoDeCirculacion
    }

    method puedeCircular(camion) {
        return camion.pesoTotal() < pesoMaximoDeCirculacion 
    }
}