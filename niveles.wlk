import pepita.*
import comidas.*
import extras.*
import wollok.game.*


object mensajeEnergia{
	const property position = game.at(2, 9)
	method text() = "Energia Pepita: " + pepita.energia()
	method textColor() = "#ffffffff"  
}

object tutorial1 {
	method iniciar() {
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisualCharacter(pepita)
	}
}

object tutorial2 {
	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarGravedad()  
	}
}

object tutorial3 {
	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		game.addVisual(mensajeEnergia)
		config.configurarTeclas()
		config.configurarColisiones()
		config.configurarGravedad()
	}
}

object config {
	method configurarTeclas() {
		keyboard.left().onPressDo({ if (pepita.position().x() != 0){pepita.irA(pepita.position().left(1)) }})
		keyboard.right().onPressDo({ if (pepita.position().x() != 9){pepita.irA(pepita.position().right(1)) }})
		keyboard.up().onPressDo({ if (pepita.position().y() != 9){pepita.irA(pepita.position().up(1)) } })
		keyboard.down().onPressDo({ if (pepita.position().y() != 0){pepita.irA(pepita.position().down(1)) }})
		keyboard.c().onPressDo({pepita.come(manzana)})
		keyboard.c().onPressDo({pepita.come(alpiste)})
	}
	
	method configurarColisiones() {
		game.onCollideDo(pepita, { algo => algo.teEncontro(pepita) })
	}

	method configurarGravedad() {
		game.onTick(800, "gravedad", { pepita.gravedad(pepita.position().down(1))})
	}
}
