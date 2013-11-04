require 'matrix.rb'

describe Matrix do
	before :all do
		@m1 = Matrix.new(1, 1)
	end

	describe "# Comprobacion de variables" do
		it "Tiene que tener filas" do
			@m1.should respond_to :rows
		end
		it "Tiene que tener columnas" do
			@m1.should respond_to :columns
		end
		it "Tiene que poder modificar las filas" do
			@m1.rows = 3
			@m1.rows.should eq(3)
			expect { @m1.rows = -2 }.to raise_error
		end
		it "Tiene que poder modificar las columnas" do
			@m1.columns = 3
			@m1.columns.should eq(3)
			expect { @m1.columns = 3.56 }.to raise_error
		end
	end

	describe "# Acceso al contenido" do
		it "Debe poder acceder a una fila con []" do
			@m1.should respond_to(:[])
		end
		it "Debe poder acceder a un elemento con [x, y]" do
			@m1[0, 1]
		end
		it "Debe poder modificar el contenido de un elemento" do
			@m1[0, 0] = 13
			@m1[0, 0].should eq(13)
		end
		it "Debe ser enumerable" do
			# Comprobamos que haya incluido el módulo Enumerable
			@m1.class.included_modules.include?(Enumerable).should eq(true)

			# Creamos un contenido y luego utilizamos el método each para recorrer
			# la matriz y asegurarnos de que se hace en el orden correcto: Primero
			# filas y después columnas.
			@m1.rows = 2
			@m1.columns = 2
			@m1[0, 0] = 1
			@m1[0, 1] = 2
			@m1[1, 0] = 3
			@m1[1, 1] = 4
			i, j = 0, 0
			@m1.each do |x|
				x.should eq(@m1[i, j])
				if j == 0
					j = 1
				else
					j = 0
					i = 1
				end
			end
		end
	end
end