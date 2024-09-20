import cosas.*
import camion.*

object almacen {
    const property deposito = #{arenaGranel}

    var property maximoBultos = 3

    method puedeAlmacenar(camion){
        return camion.totalBultos()+self.totalBultos() < maximoBultos
    }

    method totalBultos(){
        return deposito.sum({cosa => cosa.bultos()})
    }

    method almacenar(cosas) {
        deposito.addAll(cosas)
    }
}