# @autor Germán Alfonso Teixidó
class Comida
  # La clase es comparable
  include Comparable;
  # Los atributos son de lectura
  attr_reader :nombre, :proteinas, :carbohidratos, :lipidos, :GEI, :costeTerreno

  #
  # Constructor
  #
  # @param [String] nombre Nombre del alimento.
  # @param [Integer] proteinas Cantidad en gramos de proteinas.
  # @param [Integer] carbohidratos Cantidad en gramos de carbohidratos.
  # @param [Integer] lipidos Cantidad en gramos de lipidos.
  # @param [Integer] gei Gases de efecto invernadero emitidos en la producción de 1000g de este alimento
  # @param [Integer] costeTerreno m2 utilizados en la producción de 1000g de este alimento
  #
  def initialize(nombre, proteinas, carbohidratos, lipidos, gei, costeTerreno)
    @nombre, @proteinas, @carbohidratos, @lipidos, @GEI, @costeTerreno= nombre, proteinas, carbohidratos, lipidos, gei, costeTerreno
  end
  
  #
  # Devuelve un string con un resumen del alimento
  #
  # @return [String] Cadena del resumen del alimento.
  #
  def resumen()
    "#{@nombre}:\n
    -Proteinas:#{@proteinas}g.\n
    -Carbohidratos:#{@carbohidratos}g.\n
    -Lipidos:#{@lipidos}g.\n
    -GEI:#{@GEI}kgCO2eq.\n
    -Coste del terreno:#{@costeTerreno}m2año.\n"
  end

  #
  # Devuelve un double con las kilocalorias que proporciona el alimento
  #
  # @return [Double] Kilocalorias que devuelve el alimento.
  #
  def kilocalorias
    ((@proteinas* 4.0.to_d)+ (@lipidos* 9.0.to_d)+ (@carbohidratos* 4.0.to_d))
  end

  #
  # Sobreescritura de la funcion <=> de la clase Comparable para comparar dos elementos
  #
  # @param [Comida] another Alimento con el que se pretende comparar este alimento (el alimento que proporcione mayor kilocalorias será mayor).
  #
  def <=>(another)
    if another.class== Comida
      aux1= kilocalorias
      aux2= another.kilocalorias
      aux1<=> aux2
    end
  end
  
end

