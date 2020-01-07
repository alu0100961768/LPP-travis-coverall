# @autor Germán Alfonso Teixidó
class List 
	# La clase es enumerable
	include Enumerable

	# Nodo que forma la Lista
	#
	# @param [<Template>] value Contenido del nodo.
	# @param [Node] next Siguiente nodo en la lista.
	# @param [Node] prev Anterior nodo en la lista.
	#
	Node= Struct.new(:value, :next, :prev)

	# Los atributos son de lecutra
    attr_reader :tail, :head, :size

	#
	# Constructor. Genera una Lista vacia, sin nodos, con head y tail nil.
	#
    def initialize
        @tail= nil
        @head= nil
        @size= 0
    end

	#
	# Introduce un elemento (nodo o valor) en la lista por la cabeza.
	# Si el valor es un nodo, se incluye directamente. Si no lo es, primero se transforma en nodo y se incluye en la lista.
	#
	# @param [<Template>] valor Nodo o valor a introducir en la lista.
	#
    def push_head(valor)
		if valor.class== Node
			addedNode= valor
		else
			addedNode= Node.new(valor)
		end
		addedNode.prev= nil
		addedNode.next= @head
		@head.prev= addedNode unless @head.nil?
		@head= addedNode
		@tail= addedNode if @tail.nil?	
		@size= @size+ 1
		return nil
	end

	#
	# Extrae un nodo en la lista por la cabeza.
	#
	# @return [<Template>] Valor del nodo extraido
    #
    def pop_head
		@head= @head.next unless @head== nil
		@head.prev= nil unless @head== nil
		@tail= nil if @head== nil
		if @size> 0
			@size= @size- 1
		end
		return nil
	end

	#
	# Introduce un elemento (nodo o valor) en la lista por la cola.
	# Si el valor es un nodo, se incluye directamente. Si no lo es, primero se transforma en nodo y se incluye en la lista.
	#
	# @param [<Template>] valor Nodo o valor a introducir en la lista.
	#
    def push_tail(valor)
		if valor.class== Node
			addedNode= valor
		else
			addedNode= Node.new(valor)
		end
		addedNode.next= nil
		addedNode.prev= @tail
		@tail.next= addedNode unless @tail.nil?
		@tail= addedNode
		@head= addedNode if @head.nil?	
		@size= @size+ 1
		return nil
	end

	#
	# Extrae un nodo en la lista por la cola.
	#
	# @return [<Template>] Valor del nodo extraido
    #
    def pop_tail
		@tail= @tail.prev unless @tail== nil
		@tail.next= nil unless @tail== nil
		@head= nil if @tail== nil
		if @size> 0
			@size= @size- 1
		end
		return nil
	end

	#
	# Emisiones emitidas por el total de alimentos de la lista, en caso de que la lista sea de #Comida
	#
	# @return [Double] Emisiones totales de la lista de alimentos.
    #
	def emisiones
		iterator= head
		emision= 0.0.to_d
		while iterator!= nil do
			emision= emision+ iterator.value.GEI.to_d
			iterator= iterator.next
		end

		return emision
	end

	#
	# Emisiones anuales emitidas por el total de alimentos de la lista, en caso de que la lista sea de #Comida
	#
	# @return [Double] Emisiones totales de la lista de alimentos en un año.
    #
	def emisionest
		return (emisiones* 365)
	end

	#
	# Coste de terreno en m2 del total de alimentos de la lista, en caso de que la lista sea de #Comida
	#
	# @return [Double] Coste de terreno en m2 de la lista de alimentos.
    #
	def terreno
		iterator= head
		coste= 0.0.to_d
		while iterator!= nil do
			coste= coste+ iterator.value.GEI.to_d
			iterator= iterator.next
		end

		return coste
	end

	#
	# Ejecuta un bloque de código para cada elemento de la Lista.
	#
	def each
		iterator= @head
		while iterator!= nil do
			yield iterator.value
			iterator= iterator.next
		end
	end

	#
	# Permite acceder a un elemento de la lista en concreto.
	#
	# @param [Integer] posición del nodo al que se desea acceder.
	#
	# @return [<Tempalte>] Valor del nodo al que se ha accedido.
	#
	def [] (index)
		if index.is_a?Integer
			if index== 0
				return @head.value
			elsif index== (@size- 1)
				return @tail.value
			elsif index< (@size- 1) && index> 0
				iterator= @head
				index.times{iterator= iterator.next}
				return iterator.value
			else
				return nil
			end
		end
	end

end