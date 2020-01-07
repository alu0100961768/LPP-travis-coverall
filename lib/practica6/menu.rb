# @autor Germán Alfonso Teixidó
class Menu
    # Los atributos son de lectura y escritura.
    attr_accessor :platosmenu, :descripcion, :preciosmenu, :preciofinal

    #
    # Constructor.
    #
    # @param [List] platosmenu Lista de platos del menú.
    #
    def initialize(aux, &block)

      @platosmenu= []
      @preciosmenu= []

      if block_given?
          if block.arity == 1
              yield self
          else
              instance_eval(&block) 
          end
      end
    end

    def descripcion (d)
      @descripcion= d
    end

    def componente (c= {})
      @platosmenu<< c[:descripcion] 
      @preciosmenu<< c[:precio]
    end

    def precio(pf)
      @preciofinal= pf
    end
    #
    # Impacto ambiental del menú.
    #
    # @return [Double] Impacto ambiental del menú.
    def impacto
      aux= 0.0.to_d
      @platosmenu.each do |plato|
        aux+= (plato[0].GEI* plato[1])  
      end
      return aux
    end
end