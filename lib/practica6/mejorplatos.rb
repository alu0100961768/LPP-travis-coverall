# @autor Germán Alfonso Teixidó
class MejorPlato < Plato 

    #
    # Constructor
    #
    # @param [String] nombrePlato Nombre del plato.
	# @param [List] conjuntoAlimentos Lista de alimentos que forman el plato.
	# @param [List] conjuntoCantidades Lista de cantidades de cada alimento que forma el plato.
	#
    def initialize(nombrePlato, conjuntoAlimentos, conjuntoCantidades)
        super(nombrePlato, conjuntoAlimentos, conjuntoCantidades)
    end

    #
    # Cantidad de gases de efecto invernadero liberados por el plato en cuestión.
    #
    # @return [Double] Emisiones de efecto ivernaderos emitidas por el plato.
	#
    def emisionInvernadero 
        emision= 0.0.to_d
        conjuntoAlimentos.size.times do |i|
            emision+= (conjuntoAlimentos[i].GEI.to_d)* (conjuntoCantidades[i].to_d/100.0)
        end
        return emision
    end

    #
    # Cantidad de m2 que han necesitado ser utilizados para producir el plato.
    #
    # @return [Double] Coste en m2 de la producción del plato.
	#
    def costeTerreno
        coste= 0.0.to_d
        conjuntoAlimentos.size.times do |i|
            coste+= (conjuntoAlimentos[i].costeTerreno.to_d)* (conjuntoCantidades[i].to_d/1000.0)
        end
        return coste
    end

    #
    # Eficiencia energética del plato (kilocalorias)
    #
    # @return [Double] Kilocalorias producidas por el plato
	#
    def eficienciaEnergetica
        eficiencia= 0.0.to_d
        conjuntoAlimentos.size.times do |i|
            eficiencia+= (conjuntoAlimentos[i].kilocalorias.to_d)* (conjuntoCantidades[i].to_d/1000.0)
        end
        return eficiencia
    end

    # Practica 9: Paradigmas de programacción funcional

    #
    # Devuelve un entero en un rango [1 - 3] que indica el impacto medioambiental del plato según su valor calórico total y sus emisiones de efecto invernadero.
    #
    # @return [Integer] Huella nutricional del plato (1, 2, 3).
	#
    def huellaNutricional
        return (indicadorEnergia.to_i+ indicadorCarbono.to_i)/2.to_i
    end
    
    #
    # Vease #huellaNutricional
    #
    def indicadorEnergia
        if(valorCaloricoTotal< 670)
            return 1
        elsif(valorCaloricoTotal> 830)
            return 3
        else
            return 2
        end
    end

    #
    # Vease #huellaNutricional
    #
    def indicadorCarbono
        if(emisionInvernadero< 800)
            return 1
        elsif(emisionInvernadero> 1200)
            return 3
        else
            return 2
        end
    end

    #
    # Sobreescritura de la funcion <=> de la clase Comparable para comparar dos elementos
    #
    # @param [Comida] another Plato/MejorPlato con el que se pretende comparar este Plato (el plato con mayor #huellaNutricional será mayor).
    #
    def <=>(another)
        if another.class== MejorPlato
            huellaNutricional<=> another.huellaNutricional
        end
    end

    #
    # Dado un array de platos y un array de precios, incrementa el array de los precios en base al plato con mayor Huella Nutricional del array de platos.
    #
    # @param [Array[Float]] arrayPrecios Array de precios.
    # @param [Array[MejorPlato]] arrayPrecios Array de platos.
    #
    # @return [Array[Float]] array de precios arrayPrecio incrementado.
    #
    def self.aumentarPrecios(arrayPrecios, menu)
        if(menu.max.huellaNutricional== 1)
            arrayPrecios.map{ |a| a * 2}
        elsif(menu.max.huellaNutricional== 2)
            arrayPrecios.map{ |a| a * 3}
        elsif(menu.max.huellaNutricional== 3)
            arrayPrecios.map{ |a| a * 4}
        else
            return -1
        end
    end
    
end
