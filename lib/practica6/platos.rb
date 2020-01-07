# @autor Germán Alfonso Teixidó
class Plato 

    # La clase es comparable.
    include Comparable

    # Los atributos son de lectura y escritura.
    attr_accessor :nombrePlato, :conjuntoAlimentos, :conjuntoCantidades

    #
    # Constructor
    #
    # @param [String] nombrePlato Nombre del plato.
	# @param [List] conjuntoAlimentos Lista de alimentos que forman el plato.
	# @param [List] conjuntoCantidades Lista de cantidades de cada alimento que forma el plato.
    #
    def initialize(aux, &block)
        #@nombrePlato= nombrePlato
       
        @conjuntoAlimentos= []
        @conjuntoCantidades= []

        if block_given?
            if block.arity == 1
                yield self
            else
                instance_eval(&block) 
            end
        end

    end

    def nombre (nombre)
		@nombrePlato= nombre
	end

    def alimento (a= {})
        @conjuntoAlimentos<< a[:descripcion]
        @conjuntoCantidades<< a[:gramos]
    end

    #
    # Funcion auxiliar de #porProteinas, #porLipidos y #porCarbohidratos.
    #
    # @return [Double] Sumatorio de glucidos, lipidos y Proteinas.
    #
    def conjuntoPorcentaje
        aux= 0.0.to_d
        conjuntoAlimentos.size.times do |i|
            aux+= (conjuntoAlimentos[i].proteinas.to_d)* (conjuntoCantidades[i].to_d/1000.0)
            aux+= (conjuntoAlimentos[i].carbohidratos.to_d)* (conjuntoCantidades[i].to_d/1000.0)
            aux+= (conjuntoAlimentos[i].lipidos.to_d)* (conjuntoCantidades[i].to_d/1000.0)
        end
        return aux
    end

    #
    # % de proteinas del plato respecto a otros componentes.
    #
    # @return [Double] % de proteinas del plato.
    #
    def porProteinas 
        auxProteinas= 0.0.to_d
        conjuntoAlimentos.size.times do |i|
            auxProteinas+= (conjuntoAlimentos[i].proteinas.to_d)* (conjuntoCantidades[i].to_d/1000.0)
        end
        return ((auxProteinas/ conjuntoPorcentaje)* 100)
    end

    #
    # % de lipidos del plato respecto a otros componentes.
    #
    # @return [Double] % de lipidos del plato.
    #
    def porLipidos
        auxLipidos= 0.0.to_d
        conjuntoAlimentos.size.times do |i|
            auxLipidos+= (conjuntoAlimentos[i].lipidos.to_d)* (conjuntoCantidades[i].to_d/1000.0)
        end
        return ((auxLipidos/ conjuntoPorcentaje)* 100)
    end

    #
    # % de carbohidratos del plato respecto a otros componentes.
    #
    # @return [Double] % de carbohidratos del plato.
    #
    def porCarbohidratos
        auxCarbohidratos= 0.0.to_d
        conjuntoAlimentos.size.times do |i|
            auxCarbohidratos+= (conjuntoAlimentos[i].carbohidratos.to_d)* (conjuntoCantidades[i].to_d/1000.0)
        end
        return ((auxCarbohidratos/ conjuntoPorcentaje)* 100)
    end

    #
    # Calor calórico del plato.
    #
    # @return [Double] Valor calórico del plato.
    #
    def valorCaloricoTotal
        auxVCT= 0.0.to_d
        conjuntoAlimentos.size.times do |i|
            auxVCT+= (conjuntoAlimentos[i].kilocalorias.to_d)* (conjuntoCantidades[i].to_d/1000.0)
        end
        return auxVCT
    end

    # 
    # Foramte el plato a una cadena de texto legible.
    #
    # @return [String] Cadena de texto resumen del plato.
    #
    def to_s
        string= "#{@nombrePlato}:\n"
        conjuntoAlimentos.size.times do |i|
            string+= "#{conjuntoAlimentos[i].nombre}, #{conjuntoCantidades[i]};\n"
        end
        return string
    end

    #
    # Sobreescritura de la funcion <=> de la clase Comparable para comparar dos elementos
    #
    # @param [Comida] another Plato con el que se pretende comparar este Plato (el plato con mayor #porProteinas será mayor).
    #
    def <=>(another)
	if another.class.ancestors.include?Plato 
	    aux1= porProteinas
	    aux2= another.porProteinas
	    aux1 <=> aux2
	end
    end

    
end
