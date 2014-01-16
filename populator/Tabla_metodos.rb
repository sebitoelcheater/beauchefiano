
def previus(k,file)
	i=Indice.new(0)
	j=Indice.new(0)
	loop do
		file_row=filerow_setear_plusk(i,j,k,file)
		j.find_value(file_row,i,"<",">",0)
		break if file_row[i.value+1..j.value-1]=='div id="body"'
	end
	loop do
		file_row=filerow_setear_plusk(i,j,k,file)
		j.find_value(file_row,i,"<",">",0)
		break if file_row[i.value+1..j.value-1]=='h1'
	end
end
def start(k,file)
	i=Indice.new(0)
	j=Indice.new(0)
	length_file=file.length
	while(k.value+1<length_file)
		file_row=filerow_setear_plusk(i,j,k,file)
		j.find_value(file_row,i,"<",">",0)
		if file_row[i.value+1..j.value-1]=='h1'
			puts "--------------"
			puts "--------------"
			topic(k,file)
		end
	end
end
def topic(k,file)
	i=Indice.new(0)
	j=Indice.new(0)
	m=Message.new
	title(k,file,m)
	n_answer(k,file,m)
	plus_minus_one(k,file,m)
	users_date_category(k,file,m)
	text(k,file,m)
	m.value_id(permalink(k,file,m))
	i=Indice.new(0)
	j=Indice.new(0)
	x=Indice.new(0)
	y=Indice.new(0)
	lengt=file.length	
	pila=Pila.new
	pila.put(m)
	loop do 
		file_row=filerow_setear_plusk(i,j,k,file)
		k_new=Indice.new(k.value)
		file_row_new=filerow_setear_plusk(y,x,k_new,file)
		y.find_value(file_row_new,x,"<",">",0)
		break if file_row_new[x.value+1..y.value-1]=='h1'
		j.find_value(file_row,i,'"',"_",0)
		if file_row[i.value+1..j.value-1]=='mensaje'
			puts "--------------"
			message(k,file,pila)
		end
		break if (k.value+1)>lengt
	end
	m.save
end
def message(k,file,pila)
	m=Message.new
	users_date(k,file,m)
	text_message(k,file,m)
	m.value_id(permalink(k,file,m))
	m.value_padre(pila.watch.id)
	puts "padre="+pila.watch.id.to_s
	pila.put(m)
	i=Indice.new(0)
	j=Indice.new(0)
	x=Indice.new(0)
	y=Indice.new(0)
	k_pivot=Indice.new(k.value)
	lengt=file.length
	loop do 
		brek=0
		file_row=filerow_setear_plusk(i,j,k_pivot,file)
		k_new=Indice.new(k.value)
		file_row_new=filerow_setear_plusk(y,x,k_new,file)
		y.find_value(file_row_new,x,"<",">",0)
		break if file_row_new[x.value+1..y.value-1]=='h1'
		j.find_value(file_row,i,'"',"_",0)
		if file_row[i.value+1..j.value-1]=='mensaje'
			z1=Indice.new(0)	
			z2=Indice.new(0)	
			contador=0
			while z2.value<file_row.length do
				z2.find_value(file_row,z1,'<',">",0)
				if file_row[z1.value+1..z2.value-1]=='/div'
					contador+=1
				end
			end
			contador.times do
				pila.take
			end
			brek=1
		end
		break if (k_pivot.value+1)>lengt
		break if brek==1
	end
	m.save
end
def permalink(k,file,m)
	i=Indice.new(0)
	j=Indice.new(0)
	loop do #permalink
		brek=0
		file_row=filerow_setear_plusk(i,j,k,file)
		j.find_v(file_row,'"')
		if file_row[j.value+1]=='o'
			j.find_value(file_row,i,'"','"',1)
			permalink=file_row[i.value+1..j.value-1]
			puts "permalink:\t"+permalink
			#m.permalink=permalink
			return permalink
		end
		break if brek==1
	end
end

def filerow_setear_plusk(i,j,k,file)
	k.value+=1
	j.setear(i)
	file[k.value].to_s
end
def text(k,file,m)
	i=Indice.new(0)
	j=Indice.new(0)
	loop do #texto
		brek=0
		file_row=filerow_setear_plusk(i,j,k,file)
		j.find_value(file_row,i,"<"," ",0)
		if file_row[i.value+1..j.value-1]=='div'
			loop do 
				file_row=filerow_setear_plusk(i,j,k,file)
				j.find_value(file_row,i,"<"," ",0)
				if file_row[i.value+1..j.value-1]=='div'
					while file_row[i.value+1..j.value-1]!="img"
						file_row=filerow_setear_plusk(i,j,k,file)
						j.find_value(file_row,i,"<"," ",0)
					end
					j.find_v(file_row,'>')
					texto=file_row[j.value+1..file_row.length]
						loop do		
							file_row=filerow_setear_plusk(i,j,k,file)
							j.find_value(file_row,i,"<"," ",0)
							if file_row[i.value+1..j.value-1]!='ul'
								texto+=file_row
							else
								brek=1
							end
							break if brek==1
						end
					puts "texto:\t"+texto
					#m.texto=texto
				end
				break if brek==1
			end
		end
		break if brek==1
	end
end
def text_message(k,file,m)
	i=Indice.new(0)
	j=Indice.new(0)
	loop do 
		brek=0
		file_row=filerow_setear_plusk(i,j,k,file)
		j.find_value(file_row,i,"<"," ",0)
		if file_row[i.value+1..j.value-1]=='div'
			while file_row[i.value+1..j.value-1]!="img"
				file_row=filerow_setear_plusk(i,j,k,file)
				j.find_value(file_row,i,"<"," ",0)
			end
			j.find_v(file_row,'>')
			texto=file_row[j.value+1..file_row.length]
				loop do		
					file_row=filerow_setear_plusk(i,j,k,file)
					j.find_value(file_row,i,"<"," ",0)
					if file_row[i.value+1..j.value-1]!='ul'
						texto+=file_row
					else
						brek=1
					end
					break if brek==1
				end
			puts "texto:\t"+texto
			#m.texto=texto
		end
		break if brek==1
	end
end

def users_date(k,file,m)
	i=Indice.new(0)
	j=Indice.new(0)
	#u=User.new
	loop do
		brek=0
		file_row=filerow_setear_plusk(i,j,k,file)
		j.find_value(file_row,i,"<"," ",1)
		if file_row[i.value+1..j.value-1]=='a'
			loop do
				j.find_value(file_row,i,'"','"',1)
				break if file_row[i.value+1..j.value-1]=='usuario'
			end
			j.value+=1
			j.find_value(file_row,i,'"','"',1)
			users_link=file_row[i.value+1..j.value-1]
			j.find_value(file_row,i,'>','<',1)
			puts "usuario+="+users_link
			#m.users_link=users_link
			#u.link=users_link
			users_name=file_row[i.value+1..j.value-1]
			puts "usuario+="+users_name
			#m.users_name=users_name
			#u.name=users_name
			j.value+=1
			j.find_v(file_row,"<")
			j.find_value(file_row,i,'>','<',1)
			date=file_row[i.value+1..j.value-1]
			puts "date+="+date
			#m.date=date
			brek=1
		end
		break if brek==1
	end
	#u.save
end

def title(k,file,m)
	i=Indice.new(0)
	j=Indice.new(0)
	file_row=file[k.value]
	j.find_value(file_row,i,"<",">",0)
	loop do #title
		brek=0
		if file_row[i.value+1..j.value-1]=="h1" #titulo
			j.find_v(file_row,"<")
			j.find_v(file_row,">")
			j.find_v(file_row,"<")
			j.find_value(file_row,i,">","<",0)
			title=file_row[i.value+1..j.value-1]
			#m.title=title
			puts "title:\t"+title
			brek=1
		end
		break if brek==1
		file_row=filerow_setear_plusk(i,j,k,file)
		j.find_value(file_row,i,"<",">",0)
	end
end
def n_answer(k,file,m)
	i=Indice.new(0)
	j=Indice.new(0)
	loop do #n_answers
		brek=0
		file_row=filerow_setear_plusk(i,j,k,file)
		j.find_value(file_row,i,"<",">",0)
		if file_row[i.value+1..j.value-1]=='em'
			j.find_value(file_row,i,"(",")",0)
			n_answers=file_row[i.value+1..j.value-1]
			puts "answers:\t"+n_answers
			#m.answers=answers
			brek=1
		end
		break if brek==1
	end
end
def plus_minus_one(k,file,m)
	i=Indice.new(0)
	j=Indice.new(0)
	loop do #+1 y -1
		brek=0
		file_row=filerow_setear_plusk(i,j,k,file)
		j.find_value(file_row,i,"<",">",0)
		if file_row[i.value+1..j.value-1]=='span class="adhesion"'
			if file_row[j.value+1]=='<'
				if file_row[j.value+2]=='a'
					j.find_value(file_row,i,'+',' ',0)
					plus_one=file_row[i.value+1..j.value-1]
					#m.plus_one=plus_one
					puts "plus_one:\t"+plus_one
					file_row=filerow_setear_plusk(i,j,k,file)
					j.find_value(file_row,i,'<',' ',0)
					loop do
						if file_row[i.value+1..j.value-1]=='table'
							p=0
							i.value=j.value
							loop do #+1
								i.value+=1
								i.find_v(file_row,'<')
								j.value=i.value
								j.find_v(file_row,' ')
								
								if file_row[i.value+1..j.value-1]=='td'
									if p==0
										p=1
									else
										p=0
										3.times do
											j.find_v(file_row,'=')
											j.value+=1
										end
										j.find_value(file_row,i,'"','"',1)
										user_link=file_row[i.value+1..j.value-1]
										puts "user_link:\t"+user_link
										j.find_value(file_row,i,'>','<',0)
										name=file_row[i.value+1..j.value-1]
										puts "user_name:\t"+name
										#u=User.new
										#u.name=name
										#u.link=user_link
										#u.save
										#b=Plus_one.new
										#b.id_message=m.id
										#b.name=name
										#b.link=user_link
										#b.save
										
									end
								end
								break if file_row[i.value+1..j.value-1]=='col'
							end
							brek=1
						end
						break if brek==1
						file_row=filerow_setear_plusk(i,j,k,file)
						j.find_value(file_row,i,'<',' ',0)
					end
					file_row=filerow_setear_plusk(i,j,k,file)
					j.find_value(file_row,i,'-',' ',0)
					minus_one=file_row[i.value+1..j.value-1]
					if minus_one!=nil
						puts "minus_one:\t"+minus_one
					end
					#m.minus_one=minus_one
				end	
			elsif file_row[j.value+1]=='-'
				j.find_value(file_row,i,'-',' ',0)
				minus_one=file_row[i.value+1..j.value-1]
				puts "minus_one:\t"+minus_one
				#m.minus_one=minus_one
			end
			brek=1
		end
		break if brek==1
	end
end
def users_date_category(k,file,m)
	i=Indice.new(0)
	j=Indice.new(0)
	loop do #publicado_por
		brek=0
		file_row=filerow_setear_plusk(i,j,k,file)	
		j.find_value(file_row,i,'"','"',1)
		if file_row[i.value+1..j.value-1]=="autor"
			2.times do
				j.find_v(file_row,"=")
				j.value+=1
			end
			j.find_value(file_row,i,'"','"',1)
			publicado_por=file_row[i.value+1..j.value-1]
			puts "publicado_por:\t"+publicado_por
			j.find_value(file_row,i,'>','<',1)
			name_=file_row[i.value+1..j.value-1]
			puts "publicado_por:\t"+name_
			brek=1
			#u=User.new
			#u.name=name_
			#u.link=publicado_por
			#u.save
			#m.users_link=publicado_por
			#m.users_name=name_
		end
		break if brek==1
	end
	loop do #fecha
		brek=0
		file_row=filerow_setear_plusk(i,j,k,file)	
		j.find_value(file_row,i,'"','"',1)
		if file_row[i.value+1..j.value-1]=="fecha"
			j.find_value(file_row,i,'>','<',1)
			fecha=file_row[i.value+1..j.value-1]
			puts "fecha:\t"+fecha
			brek=1
		end
		#m.date=date
		break if brek==1
	end
	loop do #categoria
		brek=0
		file_row=filerow_setear_plusk(i,j,k,file)	
		j.find_value(file_row,i,'"','"',1)
		if file_row[i.value+1..j.value-1]=="tema"
			j.value+=2
			j.find_value(file_row,i,'>','<',1)
			categoria=file_row[i.value+1..j.value-1]
			puts "categoria:\t"+categoria
			#m.category=categoria
			brek=1
		end
		break if brek==1
	end
end