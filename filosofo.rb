class Filosofo
	attr_reader :numero, :nome	

	def initialize(nome, numero, mesa)
		@nome = nome
		@numero = numero
		@mesa = mesa
	end	

	def comer!
		@mesa.pegar_garfo!(self, :direita)
		@mesa.pegar_garfo!(self, :esquerda)
		puts "#{@nome} comendo..."
		sleep(1)
		@mesa.devolver_garfos!(self)
		sleep(1)
	end

	def pensar
		puts "#{@nome} pensando..."
		sleep(1)
	end

end
