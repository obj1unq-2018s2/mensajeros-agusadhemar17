import destinos.*
object paquete{
	var precio
	var property estaPago = false
	var property destino
	method puedeSerEntregadoPor(mensajero){
		return estaPago and destino.puedePasar(mensajero)
	}
}

object paquetito{
	const property precio = 0
	method puedeSerEntregadoPor(mensajero){
		return  true
	}
}

object paqueton{
	const property precio = 100
	var property totalPagado= 0
	var property destinos =[]
	var property estaPago = totalPagado.equals(destinos.size()*precio)
	
	
	method puedeSerEntregadoPor(mensajero){
		return estaPago and destinos.all({destino=> destino.puedePasar(mensajero)})
	}
	
	method pagar(monto){
		totalPagado += monto
	}
}	
/*puede tener más de un destino y para poder enviarse todos los destinos tienen 
 * que autorizar al mensajero a pasar. 
 Su precio es 100$ por cada destino. 
 Además, se puede ir pagando parcialmente. 
 Obviamente tiene que estar totalmente pago para poder ser enviado.*/
