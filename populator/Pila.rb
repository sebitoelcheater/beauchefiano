require "/Users/samhernandez/Developer/Team_67/Premios_U-cursos/Nodo.rb"
class Pila
	@pila
	def initialize
		@pila=Nodo.new
		@pila.value=0	
	end
	def put(obj)
		@pila.next=Nodo.new
		@pila.next.previous=@pila
		@pila=@pila.next
		@pila.value=obj
	end
	def take
		@pila=@pila.previous
	end
	def watch
		@pila.value
	end
end