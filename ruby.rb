class Agenda
	def initialize
		@contactos = Hash.new
	end
	def menu
		opcion = 0
		while opcion != 6
			puts "1- Carga de un contacto en la agenda. \n"
			puts "2- Listado completo de la agenda. \n"
			puts "3- Consulta ingresando el nombre de la persona. \n"
			puts "4- Modificación de un teléfono \n"
			puts "5- Borrar contacto. \n"
			puts "-" * 50
			puts "Ingrese opción : "
			opcion = gets.to_i
			if opcion == 1
				cargar
			elsif opcion == 2
				listar
			elsif opcion == 3
				consultar
			elsif opcion == 4
				modificar
			elsif opcion == 5
				salir
			end
		end
	end
	def cargar
		for i in 1..2
			puts "Introduce el nombre del contacto"
			nombre = gets.chomp
			puts "Introduce telefono del contacto"
			numero = gets.to_i
			@contactos[nombre] = numero
			puts " \n"
			puts "[CORRECTO]Contacto creado"
			puts " \n"
		end
	end
	def listar
		puts "Listado completo de los contactos"
		puts "*" * 50
		@contactos.each do |nombre,numero|
			puts "Nombre: #{nombre}, Número: #{numero}"
		end
		puts "*" * 50
		puts "\n"
	end
	def consultar
		puts "Nombre del contacto a buscar"
		nom = gets.chomp
		if @contactos.include? nom
			puts "*" * 50
			puts "Nombre: #{nom}, Telefono: #{@contactos[nom]} \n"
			puts "*" * 50
		else
			puts "No existe ningún contacto con ese nombre \n"
		end
	end
	def modificar
		puts "Ingrese nombre del contacto a modificar"
		nom = gets.chomp
		if @contactos.include? nom
			puts "Nuevo numero:"
			telefono = gets.to_i
			if telefono.digits.count > 9
				puts "El telefono no puede tener más de 9 digitos \n"
			else
				puts " \n"
				puts "[CORRECTO]Numero modificado"
				puts " \n"
				@contactos[nom] = telefono
			end
			
		else
			puts "No existe ese contacto \n"
		end
	end
	def borrar
		puts "Nombre de contacto a borrar:"
		nombre = gets.chomp
		if @contactos.include? nombre
			@contactos.delete(nombre)
		else
			puts "No existe ese contacto"
		end
	end
end

agenda = Agenda.new
agenda.menu
