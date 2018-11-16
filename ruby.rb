class Alumnos
	def initialize
    	@notas = Hash.new
  	end

	def menu
		opcion = 0
		while opcion !=4
			puts "*" * 80
			puts "1 - Nuevo alumno \n"
			puts "2 - Listar alumnos \n"
			puts "3 - Listar los que superen un 7 \n"
			puts "4 - Salir \n"
			puts "*" * 80
			puts "Ingrese su opción \n"
			puts "*" * 80
			opcion = gets.to_i
			if opcion == 1
				cargar
			elsif opcion == 2
				listar
			elsif opcion == 3
				listarmayores
			else
				salir
			end
		end
	end
	def cargar
		for indice in 1..3
			puts "Inserte el nombre del alumno"
			alumno = gets.chomp
			puts "Nota del alumno"
			no = gets.to_i
			@notas[alumno] = no
		end
	end
	def listar
		puts "-" * 80
		puts "Listado de alumnos"
		puts "-" * 80
		@notas.each do |nombre,nota|
		puts "Alumno: #{nombre}, nota #{nota} \n"
		end
	end
	def listarmayores
		puts "-" * 80
		puts "Listado de alumnos que superan 7"
		puts "-" * 80
		@notas.each do |nombre,nota|
			if nota > 7
				puts "Alumno: #{nombre}, nota #{nota} \n"
			else
				puts "Ningún alumno supera el 7"
			end
		end
	end
	def salir
		puts "Saliendo del programa ..."
		exit
	end
end

#Creamos un nuevo alumno y llamamos al menú para que nos aparezca 
alumnos = Alumnos.new
alumnos.menu
