class Matriz
	include Enumerable
	attr_reader :rows, :columns

	def initialize(rows = 0, columns = 0)
		validate_sizes(rows, columns)
		@rows, @columns = rows, columns
		@container = Array.new(rows){ Array.new(columns, nil) }
	end

	def rows=(value)
		validate_sizes(value)

		if value > @rows
			(value - @rows).times { @container << Array.new(columns, nil) }
		elsif value < @rows
			@container.slice!(-1, @rows - value)
		end

		@rows = value
	end

	def columns=(value)
		validate_sizes(value)

		if value != @columns
			@container.each do |x|
				if value > @columns
					(value - @columns).times { x << nil }
				else
					x.slice!(-1, @columns - value)
				end
			end
		end

		@columns = value
	end

	def [](row, column = nil)
		if(column.nil?)
			@container[row]
		else
			@container[row][column]
		end
	end

	def []=(row, column, value)
		@container[row][column] = value
	end

	# Método que recorre todos los elementos de la matriz, para utilizar el módulo
	# "Enumerable".
	def each()
		@container.each do |x|
			x.each { |y| yield y }
		end
	end

	def +(other)
		if((@rows == other.rows) && (@columns == other.columns))
			sum = Matriz.new(@rows, @columns)
			i = 0
			while i < @rows do
				j = 0
				while j < @columns do
					sum[i, j] = @container[i][j] + other[i, j]
					j = j+1
				end
				i = i+1
			end
			sum
		else
			puts "Las matrices no se pueden sumar, no son del mismo tamanio"
		end
	end
	
	def -(other)
                if((@rows == other.rows) && (@columns == other.columns))
                        sum = Matriz.new(@rows, @columns)
                        i = 0
                        while i < @rows do
                                j = 0
                                while j < @columns do
                                        sum[i, j] = @container[i][j] - other[i, j]
                                j = j+1
                                end
                        i = i+1
                        end
                        sum
                else
                puts "Las matrices no se pueden restar, no son del mismo tamanio"
                end
        end

	def *(other)
  		# Comprobamos que el número de columnas de la matriz 1 y el número de filas
		# de la matriz 2 coinciden para poder realizar la multiplicación.
		if columns != other.rows
			raise(ArgumentError, "Matrices no multiplicables.")
			return
		end

		# Crea una matrix con tantas filas como la matriz 1 y tantas columnas como la matriz 2.
		result = Matriz.new(rows, other.columns)

		# Algoritmo de la multiplicación de matrices.
		for i in 0...result.rows
			for j in 0...result.columns
				for k in 0...columns
					if result[i, j] != nil
						result[i, j] = result[i, j] + (@container[i][k] * other[k, j])
					else
						result[i, j] = @container[i][k] * other[k, j]
					end
				end
			end
		end
		result
	end

	def ==(other)
		if(rows != other.rows || columns != other.columns)
			return false
		end
		for i in 0...rows
			for j in 0...columns
				if(self[i, j] != other[i, j])
					return false
				end
			end
		end
		true
	end

private
	# Se asegura que los valores pasados están dentro del rango [0, Infinito)
	# y que son números enteros. En caso contrario lanza una excepción.
	def validate_sizes(*values)
		values.each do |x|
			raise(ArgumentError, "#{x} no es un valor correcto") unless(x.integer? and x >= 0)
		end
	end
end
