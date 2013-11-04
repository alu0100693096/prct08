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
end