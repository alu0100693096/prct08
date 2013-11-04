class Matrix
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

private
	# Se asegura que los valores pasados están dentro del rango [0, Infinito)
	# y que son números enteros. En caso contrario lanza una excepción.
	def validate_sizes(*values)
		values.each do |x|
			raise(ArgumentError, "#{x} no es un valor correcto") unless(x.integer? and x >= 0)
		end
	end
end