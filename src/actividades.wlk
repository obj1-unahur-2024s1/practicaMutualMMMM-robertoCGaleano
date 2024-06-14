class Viaje {
	const property idiomas= #{}
	
	method implicaEsfuezo()
	method sirveParaBroncearse()
	method diasDeActividad()
	method esInteresante()= idiomas.size()>= 2
	method esRecomendadaPara(unSocio){
		return self.esInteresante() and unSocio.leAtrae(self) and not unSocio.realizoActividad(self)
			//not unSocio.actividadesRealizadas().contains(self)
	}
}

class ViajeDePlaya inherits Viaje {
	var property largoPlaya
	
	override method diasDeActividad()= largoPlaya/ 500
	override method implicaEsfuezo()= largoPlaya>1200
	override method sirveParaBroncearse()= true
}

class ExcursionACiudad inherits Viaje{
	const property cantAtracciones
	
	override method diasDeActividad()= cantAtracciones/ 2
	override method implicaEsfuezo()= cantAtracciones.between(5,8)
	override method sirveParaBroncearse()= false
	override method esInteresante()= super() or cantAtracciones == 5
}
class ExcursionCiudadTropical inherits ExcursionACiudad{
	override method diasDeActividad()= super() + 1
	override method sirveParaBroncearse()= true
}

class SalidaTrekking inherits Viaje{
	var property kmSenderos
	const property cantDiasDeSol
	
	override method diasDeActividad()= kmSenderos/ 50
	override method implicaEsfuezo()= kmSenderos> 80
	override method sirveParaBroncearse()=
		cantDiasDeSol>200 or (cantDiasDeSol.between(100,200) and kmSenderos>120)
	override method esInteresante()= super() and cantDiasDeSol> 140
}

class ClaseDeGim {
	
	method idiomas()= #{"espaniol"}
	method implicaEsfuezo()= true
	method sirveParaBroncearse()= false
	method diasDeActividad()= 1
	method esInteresante()= false
}



