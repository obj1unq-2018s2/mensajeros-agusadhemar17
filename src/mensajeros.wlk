object roberto{
	
	var property pesoIndividual 
	var property vehiculo 
	
	
	method peso(){
		return vehiculo.peso()+pesoIndividual
			}
	method puedeLlamar(){
		return false
	}
}/*Roberto: viaja en bicicleta ó camión y debemos contar tanto su peso como el del transporte. La bicicleta pesa 8kg,
 *  mientras que el camión pesa media tonelada por cada acoplado. Roberto no tiene un mango, 
 * gracias que tiene cubiertas, y no puede llamar a nadie.*/


object chuckNorris{
	
	method peso(){
		return 900
	}
	method puedeLlamar(){
		return true
	}
} 

object neo{
	var property tieneCredito = true
	method peso(){
		return 0
	}
	method puedeLlamar(){
		 return tieneCredito
	}
}