class MorseAFD
  def initialize(cadeia)
    @cadeia = cadeia
    @indice = 0
    @max = cadeia.size
    @estado = "q0"   # Estado inicial
    @resultadoF = "" # Resultado final após a tradução
  end

  def proximo
    if @indice == @max
      ""
    else
      @cadeia[@indice]
    end
  end

  def iniciar
    puts "Máquina iniciou no estado: #{@estado}"
    loop do
      case [proximo, @estado]
      in [".", "q0"]
          @estado = "qE"
      in ["-", "q0"]
          @estado = "qT"
      in [".", "qE"]
          @estado = "qI"
      in ["-", "qE"]
          @estado = "qA"
      in [".", "qT"]
          @estado = "qN"
      in ["-", "qT"]
          @estado = "qM"
      in [".", "qI"]
          @estado = "qS"
      in ["-", "qI"]
          @estado = "qU"
      in [".", "qA"]
          @estado = "qR"
      in ["-", "qA"]
          @estado = "qW"
      in [".", "qW"]
          @estado = "qP"
      in ["-", "qW"]
          @estado = "qJ" 
      in ["-", "qJ"]
          @estado = "q1"
      in [".", "qN"]
          @estado = "qD"
      in ["-", "qN"]
          @estado = "qK"
      in [".", "qM"]
          @estado = "qG"
      in ["-", "qM"]
          @estado = "qO"
      in [".", "qO"]
          @estado = "qVazio"
      in ["-", "qO"]
          @estado = "qStorto"
      in ["-", "qStorto"]
          @estado = "qZero"
      in [".", "qS"]
          @estado = "qH"
      in ["-", "qS"]
          @estado = "qV"
      in [".", "qU"]
          @estado = "qF"
      in ["-", "qU"]
          @estado = "qŬ"
      in [".", "qŬ"]
          @estado = "qÐ"
      in [".", "qR"]
          @estado = "qL"
      in ["-", "qR"]
          @estado = "qÆ"
      in [".", "qÆ"]
          @estado = "q+"
      in [".", "qD"]
          @estado = "qB"
      in ["-", "qD"]
          @estado = "qX"
      in [".", "qK"]
          @estado = "qC"
      in ["-", "qK"]
          @estado = "qY"
      in [".", "qG"]
          @estado = "qZ"
      in ["-", "qZ"]
          @estado = "qZtorto"
      in ["-", "qG"]
          @estado = "qQ"
      in ["-", "qF"]
          @estado = "q2"
      in ["-", "qV"]
          @estado = "q3"
      in ["-", "qH"]
          @estado = "q4"
      in [".", "qH"]
          @estado = "q5"
      in ["-", "qB"]
          @estado = "q6"
      in ["-", "qZ"]
          @estado = "q7"
      in [".", "qVazio"]
          @estado = "q8"
      in [".", "qStorto"]
          @estado = "q9"
      in ["-", "q+"]
          @estado = "qPonto"
      in ["-", "qZtorto"]
          @estado = "qVirgula"
      in ["-", "qX"]
          @estado = "qTraco"
      in [".", "qÐ"]
          @estado = "qInterrogacao"
      in [" ", _]  # Espaço sinaliza o fim de um caractere em qualquer estado
          @resultadoF += traduzir
          @estado = "q0"
      in ["/", _]  # Se encontrar "/", insere um espaço na saída para separar palavras
          @resultadoF += " "
          @estado = "q0"
      else  # Fim da string
        @resultadoF += traduzir
        puts "Tradução final: #{@resultadoF}"
        break
      end
      @indice += 1
      puts "Estado: #{@estado}"
    end
  end

  def traduzir # Um case absurdamente grande com toda a tradução de A-Z, números 0-9 e os símbolos ". , - ?"
    case @estado # Ao invés do buffer agora utiliza os próprios estados para tradução
    when "qA"
        "A"
    when "qB"
        "B"
    when "qC"
        "C"
    when "qD"
        "D"
    when "qE"
        "E"
    when "qF"
        "F"
    when "qG"
        "G"
    when "qH"
        "H"
    when "qI"
        "I"
    when "qJ"
        "J"
    when "qK"
        "K"
    when "qL"
        "L"
    when "qM"
        "M"
    when "qN"
        "N"
    when "qO"
        "O"
    when "qP"
        "P"
    when "qQ"
        "Q"
    when "qR"
        "R"
    when "qS"
        "S"
    when "qStorto"
        "Š"
    when "qT"
        "T"
    when "qU"
        "U"
    when "qV"
        "V"
    when "qW"
        "W"
    when "qX"
        "X"
    when "qY"
        "Y"
    when "qZ"
        "Z"
    when "qVazio"
        "Ø"
    when "qZero"
        "0" # <--- Essa é a tradução que pode dar problema
    when "q1"
        "1"
    when "q2"
        "2"
    when "q3"
        "3"
    when "q4"
        "4"
    when "q5"
        "5"
    when "q6"
        "6"
    when "q7"
        "7"
    when "q8"
        "8"
    when "q9"
        "9"
    when "qPonto"
        "."
    when "qVirgula"
        ","
    when "qTraco"
        "-"
    when "qInterrogacao"
        "?"
    else 
        "?" # Se não houver correspondência
    end
  end
end

# Código morse de teste
puts ("Digite o codigo morse a ser traduzido: ")
texto = gets.chomp
tradutor = MorseAFD.new(texto)
tradutor.iniciar