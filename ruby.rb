=begin require 'net/http'
require 'json'
api = '1f173bbd326f78baeae668ba99a77e06125300d6'
url = 'https://go.opensistemas.com/issues.json?offset=0&project_id=957&key=' + api

uri = URI(url)
response = Net::HTTP.get(uri) #haces la petición get
json = JSON.parse(response) #parseas a json los datos de la web
respuesta = JSON.pretty_generate(json) #con el pretty_generate sale euivalente al pre de php
File.open("prueba.txt", 'w+') {|f| f.write(respuesta)}# muestro la salida en un archivo de texto


n = [123,51,434,633,7,3,7,8,6,4]
i = 0
contador = 0
while i < n.length 
	if n[i] > 100
		contador = contador + 1
	end
	i = i + 1
end
puts "Los numeros que superan a 100 son #{contador}"


n = []
n1 = []
i = 0
while i < 4
	puts "Ingrese sueldo de turno de mañana"
	sueldo1 = gets.chomp
	n.push(sueldo1)

	puts "Ingrese sueldo de turno de tarde"
	sueldo2 = gets.chomp
	n1 << sueldo2
	i = i + 1
end
print "#{n}\n"
print "#{n1}"


n = [1,4,500,6,700]
contador = 0
for i in n
   if i > 100 
   		contador = contador + 1
   end
end
puts "La cantidad de valores que superan a 100 son : #{contador}"


array = [1.98, 1.78, 1.50, 2.02, 1.66]
suma = 0
promedio = 0
contador = 0
array.each {|i| suma = suma + i}
promedio = suma/array.length
array.each {|j| if j > promedio
	contador = contador + 1
end}
puts "El promedio es : #{promedio}"
puts "El numero de personas por encima de la media es : #{contador}"

def cuadrado
	puts "Ingrese valor para elevarlo al cuadrado:"
	num = gets.to_i
	num = num * num
	puts num
end

def producto
	puts "Ingrese valores para obtener su producto:"
	num = gets.to_i
	num2  = gets.to_i
	total = num * num2
	puts total
end
cuadrado
puts "*" * 80
producto


def mensaje(msg)
	contador = 0
	msg.each_char do |i|
		if i == 'a' || i == 'e' || i == 'i' || i == 'o' || i == 'u'then
			contador = contador + 1
		end
	end
	puts contador
end
mensaje('gola')


class Persona
  def inicializar(nombre,edad)
    @nombre = nombre
    @edad = edad
  end

  def imprimir
    puts "El nombre es #{@nombre}"
  end
  def edad
  	puts "La edad es #{@edad}"
  	if @edad >= 18 # referenciamos al atributo en la misma funcion
  		puts "Es mayor de edad"
  	end
  end
end

persona1 = Persona.new
persona1.inicializar "Ivan",25
persona1.imprimir
persona1.edad

class Triangulo
	def inicializar(lado1,lado2,lado3)
		@lado1 = lado1
		@lado2 = lado2
		@lado3 = lado3
	end

	def mayor
		if @lado1 > @lado2 && @lado1 > @lado3
			puts "El lado 1 es el mayor"
		end
	end

	def equilatero
		if @lado1 == @lado2 && @lado1 == @lado3
			puts "El triangulo es equilatero"
		end
	end
end

triangulo = Triangulo.new
triangulo.inicializar 7,7,7
triangulo.mayor
triangulo.equilatero


class Empleado
	def initialize
		puts "Ingrese nombre y sueldo del empleado"
		@nombre = gets.chomp
		@sueldo = gets.to_i
	end
	def imprimir
		print "El nombre es #{@nombre} y el salario #{@sueldo} \n"
		if @sueldo >= 3000
			puts "Debe pagar impuestos"
		end
	end
end

empleado = Empleado.new
empleado.imprimir

#igual que el anterior pero con el metodo initialize con parametros
class Empleado
	def initialize(nombre,sueldo)
		@nombre = nombre
		@sueldo = sueldo
		# con esto necesitamos ahora definir el proceso  para imprimir ahora 
		# tanto el nombre como el sueldo del tio
	end
	def imprimir
		print "El nombre es #{@nombre} y el salario #{@sueldo} \n"
		if @sueldo >= 3000
			puts "Debe pagar impuestos"
		end
	end
end

empleado = Empleado.new "Pepe",3000
empleado.imprimir
=end
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