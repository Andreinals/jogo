def da_boas_vindas
	puts
  puts "        P  /_\  P                              "
  puts "       /_\_|_|_/_\                             "
  puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
  puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
  puts "  |' '  |  |_|  |'  ' |                        "
  puts "  |_____| ' _ ' |_____|                        " 
  puts "        \__|_|__/                              "
  puts
	puts "Qual é o seu nome?"
	nome = gets.strip
	puts "\n\n\n\ "
	puts "Começaremos o jogo para você, #{nome}" 
	nome
end

def pede_dificuldade
	puts "Qual o nivel de dificuldade que deseja? (1 fácil, 5 difícil)"
	dificuldade = gets.to_i
end

def sorteia_numero_secreto(dificuldade)
	case dificuldade
		when 1
	 		maximo = 30
		when 2
			maximo = 60
		when 3
  	  		maximo = 100
       	when 4
		    maximo = 150
		else
			maximo = 200 
	end	

 puts "Escolhendo um número secreto entre 1 e #{maximo}..."
 num_secreto = rand(maximo) + 1
 puts "Escolhido... que tal adivinhar hoje nosso número secreto?"
 num_secreto
end

def pede_um_numero(chutes, tentativa, limite_de_tentativas)
puts "\n\n\ "
puts "Tentativa #{tentativa} de #{limite_de_tentativas}" 
puts "Chutes até agora: #{chutes} " 
puts "Entre com o número:"
chute = gets.strip
puts "Será que você acertou?"
puts "Você chutou #{chute}" 
chute.to_i
end


def ganhou
  puts
  puts "             OOOOOOOOOOO               "
  puts "         OOOOOOOOOOOOOOOOOOO           "
  puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
  puts "    OOOOOO      OOOOO      OOOOOO      "
  puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
  puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
  puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
  puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
  puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
  puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
  puts "         OOOOOO         OOOOOO         "
  puts "             OOOOOOOOOOOO              "
  puts
  puts "           Parabéns, você acertou!     "
  puts
end

def verifica_se_acertou(num_secreto, chute)
acertou = num_secreto == chute.to_i

 if acertou
	 ganhou
	return true
 end
	maior = num_secreto > chute.to_i
	 if maior
	   puts "O número secreto é maior!"
	 
     else 
	   puts "O número secreto é menor!"
	   
     end
     false
end

def joga(nome, dificuldade)
	num_secreto = sorteia_numero_secreto dificuldade

	pontos_ate_agora = 1000
	limite_de_tentativas = 5
	chutes = []


	for tentativa in 1..limite_de_tentativas

		chute = pede_um_numero chutes, tentativa, limite_de_tentativas
		chutes << chute


	    if nome == "Ada"
	     	ganhou
	      break
	    end

		pontos_a_perder = (chute.to_i - num_secreto).abs / 2.0 
		pontos_ate_agora -= pontos_a_perder

	   if verifica_se_acertou num_secreto, chute
	     break
	   end  	

	end    

	puts "Você ganhou #{pontos_ate_agora} pontos."
end

def quer_jogar
	puts "Deseja jogar novamente? (S/N)"
	quero_jogar = gets.strip
	quero_jogar.upcase == "S"
end

nome = da_boas_vindas
dificuldade = pede_dificuldade

loop do
	joga nome, dificuldade
	if !quer_jogar
		break
	end	
end




