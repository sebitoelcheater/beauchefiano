#id_comentario, id_user
#id_user, nombre, link_perfil
require "/Users/samhernandez/Developer/Team_67/Premios_U-cursos/Indice.rb"
require "/Users/samhernandez/Developer/Team_67/Premios_U-cursos/Tabla_metodos.rb"
require "/Users/samhernandez/Developer/Team_67/Premios_U-cursos/Message.rb"
require "/Users/samhernandez/Developer/Team_67/Premios_U-cursos/Pila.rb"

end_file=2
name_file=1
while name_file<end_file do
	k=Indice.new(-1)
	file = IO.readlines(name_file.to_s+".txt")
	previus(k,file)
	start(k,file)
	name_file+=1
end










