import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()

	method esAtrapada(){
		return self.position() == silvestre.position()
	}

	method image() {
		return if (self.estaEnElNido()) {
			"pepita-grande.png"
			} else if (self.esAtrapada() or self.estaCansada() or self.estaCansada()){
				"pepita-gris.png"
				}
					else {
						"pepita.png"}
	}

	method come(comida) {
		if (self.position() == comida.position()) {
			energia = energia + comida.energiaQueOtorga()
			game.removeVisual(comida)
		}
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		if (self.energia() > 0) {
			self.vola(position.distance(nuevaPosicion))
			position = nuevaPosicion
			energia = energia - 1
		} else {
			game.schedule(2000, { game.stop() })
		}
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}

	method pepitaGano () = "Gané!"

	method pepitaPerdio () = "Perdí!"

	method estaEnElSuelo() {
		return position.y() == 0 
	}

}

