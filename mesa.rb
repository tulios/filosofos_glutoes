class Mesa

	#construtor
	def initialize
		@garfos = Hash.new
		5.times do |numero|
			@garfos[numero] = :livre
		end
		
		@mutex = Mutex.new
	end

	def pegar_garfo!(filosofo, posicao)

		@mutex.synchronize do

			if (posicao == :direita)
				pegar_garfo(filosofo.numero, filosofo, :direita)
				
			elsif(posicao == :esquerda)

				numero = a_esquerda(filosofo.numero)
				pegar_garfo(numero, filosofo, :esquerda)
			end

		end #mutex

	end

	def devolver_garfos!(filosofo)
		direita = filosofo.numero
		esquerda = a_esquerda(direita)

		@mutex.synchronize do
			@garfos[direita] = :livre
			@garfos[esquerda] = :livre

			puts "#{filosofo.nome} devolveu os garfos #{direita} e #{esquerda}"
		end		
	end
	
	private
	def a_esquerda(numero)
		(numero - 1) % 5
	end

	def pegar_garfo(numero, filosofo, direcao)
		while (@garfos[numero] == :ocupado)
			puts "#{filosofo.nome} => garfo a #{direcao} #{numero} esta ocupado!"
			@mutex.sleep(2)
		end
		
		# nesse momento o garfo esta livre
		@garfos[numero] = :ocupado
		puts "#{filosofo.nome} pegou o garfo a #{direcao} #{numero}"
	end

end




















