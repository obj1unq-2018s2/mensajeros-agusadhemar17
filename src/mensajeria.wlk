import destinos.*
import mensajeros.*
import vehiculos.*
import paquete.*

object mensajeria {
	var property mensajeros = []
	var property paquetesEnviados = []
	var property paquetesTotales = []
	var property paquetesRecibidos = []
		
	
	method contratar(alguien) {
 		mensajeros.add(alguien)
 	}
 	method despedir (alguien){
 		mensajeros.remove(alguien)
 	}
 	method despedirATodos(){
 		mensajeros.clear()
 	}
	method esGrande(){
		return mensajeros.size()>2
	} 	
	method puedeSerEntregadoPorPrimero(paquete){
		return paquete.puedeSerEntregadoPor(mensajeros.first())
	}
	method pesoUltimoMensajero(){
		return mensajeros.last().peso()
	}	
	method paquetePuedeSerEntregado(paquete){
		return mensajeros.any({empleado=> paquete.puedeSerEntregadoPor(empleado)})
	}
	method esPaqueteFacil (paquete){
		return mensajeros.all({empleado=> paquete.puedeSerEntregadoPor(empleado)})
	}
	method candidatos(){
		return mensajeros.filter({empleado=> paquete.puedeSerEntregadoPor(empleado)})
	}
	method tieneSobrepeso(){
		return mensajeros.sum({empleado=>empleado.peso()})/mensajeros.size() >500
	}
		
	
	method enviarPaquete(paquete){
			if(self.paquetePuedeSerEntregado(paquete)){
				paquetesEnviados.add(paquete)
				paquetesRecibidos.remove(paquete)
			}else{
				self.error("No hay empleado disponible para esta tarea")
			}
	}
	 	 
	method recibirPaquete(paquete){
		paquetesRecibidos.add(paquete)
		paquetesTotales.add(paquete)
	}	
	
	method enviarTodosLosPosibles() {
		paquetesRecibidos.forEach({ paquete => if (self.paquetePuedeSerEntregado(paquete)) self.enviarPaquete(paquete)})
	} 
	method paqueteMasCaro(){
		return paquetesRecibidos.map({elemento=>elemento.precio()}.max())
	}
	method porcentajeEficacia (){
		return (paquetesEnviados.size() / paquetesTotales.size() *100).roundUp()
	}//el porcentaje de paquetes que lograron ser enviados desde que empezó a funcionar. Debe devolver un número entero
	
} 
