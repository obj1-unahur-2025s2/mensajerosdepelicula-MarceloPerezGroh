//mensajero
import vehiculos.*

object roberto{
    var vehiculo = bicicleta
    const peso = 50

    method peso() = peso + vehiculo.peso()

    method cambiaVehiculo(otroVehiculo){
        vehiculo = otroVehiculo
    } 

    method puedeLlamar() = false  
}

object chuck{
    const peso = 80
    method puedeLlamar() = true
}

object neo{
    method peso() = 0
    var tieneCredito = true
    method gastoCredito(){
        tieneCredito = false
    } 
    method puedeLlamar() = tieneCredito
}
