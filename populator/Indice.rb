class Indice 
	attr_accessor :value
	attr_accessor :end
	def initialize(n)
		@value=n
		@end=0
	end
	def position_clean(s,c) 
		while @value<s.length && s[@value]==c  do
			@value+=1
		end
		if value==s.length
			@end=1
		end
	end
	def find_v(s,c) 
		while @value<s.length && s[@value]!=c do
			@value+=1
		end
	end
	def find_value(file_row,i,c1,c2,n)	
		find_v(file_row,c1)
		i.value=@value
		@value+=n
		find_v(file_row,c2)
	end
	def setear(i)
		@value=0
		i.value=0
	end
	def end_row?
		if @end==0
			false
		else 
			true
		end
	end
end


