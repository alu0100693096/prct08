require 'matrix.rb'

describe Matrix do
	before :all do
		@m1 = Matrix.new
	end

	describe "# Comprobación de variables" do
		it "Tiene que tener filas" do
			@m1.should respond_to :rows
		end
		it "Tiene que tener columnas" do
			@m1.should respond_to :columns
		end
		it "Tiene que poder modificar las filas" do
			@m1.rows = 3
			@m1.rows.should eq(3)
		end
		it "Tiene que poder modificar las columnas" do
			@m1.columns = 3
			@m1.columns.should eq(3)
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
			@m1.class.included_modules.include?(Enumerable).should eq(true)
		end
	end
end