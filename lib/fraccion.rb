class Fraccion
    include Comparable
    attr_reader :num, :denom

    def initialize(n,d)
        raise 'El denominador no puede ser 0' unless d != 0
        @num, @denom = n, d

        if n == 0
            @denom = 1
        else
            reducir
        end
    end

    # OPERACIONES DE CONVERSIÓN
    def to_s
        "#{num}/#{denom}"
    end

    def to_f
        # to_f pasa a número flotante
        (@num.to_f/@denom.to_f)
    end

    # OPERACIONES DE COMPARACIÓN
    def <=>(other)
        d = @denom * other.denom
        (d/@denom)*@num <=> (d/other.denom)*other.num
    end

    # OPERACIONES ARITMÉTICAS
    def +(other)
        d = @denom * other.denom
        Fraccion.new((d/@denom)*@num + (d/other.denom)*other.num, d)
    end

    def -(other)
        d = @denom * other.denom
        Fraccion.new((d/@denom)*@num - (d/other.denom)*other.num, d)
    end

    def *(other)
        Fraccion.new(@num*other.num, @denom*other.denom)
    end

    def /(other)
        Fraccion.new(@num*other.denom, @denom*other.num)
    end

    def %(other)
        Fraccion.new(0, 1)
    end

    def -@
        Fraccion.new(-@num, @denom)
    end

    # OTRAS OPERACIONES
    def abs
        # En el método initialize se llama a "reducir", así que está
        # garantizado que si es negativo, será el numerador el que tenga el
        # signo.
        Fraccion.new(@num.abs, @denom)
    end

    def rec
        # Damos la vuelta a la fracción.
        Fraccion.new(@denom, @num)
    end

private

    # Pasa la fracción actual a su forma más reducida y coloca el signo de la
    # fracción en el numerador.
    def reducir
        # Si alguno es negativo, que sea el numerador. Si ambos son negativos,
        # se pasan a positivos.
        if @denom < 0
            @num = -@num
            @denom = -@denom
        end

        # Para reducir la fracción se dividen numerador y denominador entre el
        # máximo común divisor de ambos.
        mcd = gcd(@num, @denom)
        if mcd != 0
            @num /= mcd
            @denom /= mcd
        end
    end

    # Calcula el máximo común divisor entre dos números enteros a y b.
    def gcd(a, b)
        a,b = a.abs, b.abs
        while b != 0
            a, b = b, a % b
        end
        a
    end
end
