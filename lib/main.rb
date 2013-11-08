require './lib/fraccion.rb'
require './lib/matriz.rb'

m1 = Matriz.new(2, 2)
m2 = Matriz.new(2, 2)

m1[0, 0] = Fraccion.new(1, 2)
m1[0, 1] = Fraccion.new(1, 3)
m1[1, 0] = Fraccion.new(1, 4)
m1[1, 1] = Fraccion.new(1, 5)

m2[0, 0] = Fraccion.new(1, 2)
m2[0, 1] = Fraccion.new(2, 3)
m2[1, 0] = Fraccion.new(3, 4)
m2[1, 1] = Fraccion.new(4, 5)

m3 = m1+m2
m4 = m1*m2

m3.each { |x| puts x }
print "\n"
m4.each { |x| puts x }
