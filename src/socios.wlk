import actividades.*

class Socio{
	const property actividadesRealizadas= []
	var property maxActividades
	var property edad
	const property idiomas=#{}
	
	method realizarActividad(unaActividad){
		if (actividadesRealizadas.size()== maxActividades){
			self.error("llego al maxilo de actividades")
		}
		actividadesRealizadas.add(unaActividad)
	}
	
	method esAdoradorDelSol()=
		actividadesRealizadas.all({a=> a.sirveParaBroncearse()})
	method actividaesEsforzadas()=
		actividadesRealizadas.filter({a=>a.implicaEsfuezo()})
		
	method leAtrae(unaActividad)
	method realizoActividad(unaActividad)= self.actividadesRealizadas().contains(unaActividad)
}

class SocioTranquilo inherits Socio{
	override method leAtrae(unaActividad)= unaActividad.diasDeActividad()>= 4
}

class SocioCoherente inherits Socio{
	override method leAtrae(unaActividad)=
		if(self.esAdoradorDelSol()) unaActividad.sirveParaBroncearse() else unaActividad.implicaEsfuezo()
}

class SocioRelajado inherits Socio{
	override method leAtrae(unaActividad)=
		not idiomas.intersection(unaActividad.idiomas()).isEmpty()
}


