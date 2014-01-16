class Message
	attr_accessor :id
	attr_accessor :padre
	def Initizalize
		@id
		@padre
	end
	def value_padre(n)
		@padre=n
	end
	def save
	end
	def value_id(n)
		@id=n
	end
end