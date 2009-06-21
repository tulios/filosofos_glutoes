#!/usr/local/bin/ruby

require_relative 'filosofo'
require_relative 'mesa'

mesa = Mesa.new

#inicializa os filosofos
filosofos = []
5.times do |numero|
	filosofos << Filosofo.new("Filosofo_#{numero}", numero, mesa)
end

#cria as threads
threads = []
filosofos.each do |filosofo|
	threads << Thread.new(filosofo) do |filosofo|
		loop do
			filosofo.pensar
			filosofo.comer!
		end
	end
end

threads.each(&:join)
