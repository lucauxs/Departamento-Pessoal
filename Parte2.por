
programa
{	
	inclua biblioteca Util --> u
	real salarioLiquido= 0.0
	real salarioBrutoReal = 2000.0
	
	funcao inicio()
	{	
		real liquido = salarioRealLiquido(salarioBrutoReal)
		
		escreva("\nSalário bruto: ", salarioBrutoReal)
		u.aguarde(500)
		escreva("\nO seu salário liquido é de: ", liquido)
		u.aguarde(500)
		escreva("\n\n\n")
	}
	
	funcao real salarioRealLiquido(real salarioBruto){
		
        	salarioLiquido -= calcularIrrf(salarioLiquido)
		
		
	retorne salarioLiquido
	}
	
	funcao real calcularInss(real salarioBruto){
		
		real inss =0.0, contribuicaoTeto =0.0, parcelaDeduzir =0.0, aliquota =0.0, inssTotal =0.0
	
		se (salarioBruto <=1412.00){
			aliquota = 0.075
			parcelaDeduzir = 0.0
			contribuicaoTeto = 105.90
		}
		senao se(salarioBruto <=2666.68){
			aliquota = 0.09
			parcelaDeduzir = 18.18
			contribuicaoTeto = 195.90
		}
		senao se (salarioBruto <=4000.03){
			aliquota = 0.12
			parcelaDeduzir = 91.00
			contribuicaoTeto = 360.82
		}
		senao se (salarioBruto <=7786.02){
			aliquota = 0.14
			parcelaDeduzir = 163.82
			contribuicaoTeto = 903.92
		}
		senao {
			escreva("\nSalário bruto digitado inválido!")
			limpa()
			retorne 0.0
		}
		
		
		inssTotal =  (salarioBruto * aliquota) - parcelaDeduzir
		
		se (inssTotal > contribuicaoTeto){
			inssTotal = contribuicaoTeto
		}
		
		

		
		
	retorne inssTotal
	}
	
	funcao real calcularIrrf(real salarioInss){
		//irrf = imposto de renda
		real salarioSemInss = calcularInss(salarioBrutoReal)
		real aliquota =0.0, parcelaDeduzir =0.0, irrfTotal
		real dependentes

		
		salarioSemInss = salarioBrutoReal - salarioSemInss
		

		escreva("\nDigite quantos dependentes residem em sua casa: ")
		leia(dependentes)
		dependentes *= 189.59// puxar do cadastro
	
		se (salarioSemInss <=2259.00){
			aliquota = 0.0
			parcelaDeduzir = 0.0
			
		}
		senao se(salarioSemInss <=2826.65){
			aliquota = 0.075
			parcelaDeduzir = 164.44
			
		}
		senao se (salarioSemInss <=3751.05){
			aliquota = 0.15
			parcelaDeduzir = 381.44
			
		}
		senao se (salarioSemInss <=4664.68){
			aliquota = 0.2250
			parcelaDeduzir = 662.77
			
		}
		senao se (salarioSemInss >4664.68){
			aliquota = 0.2750
			parcelaDeduzir = 896.00
		}
		senao {
			escreva("\nSalário bruto digitado inválido!")

		}
		se (aliquota == 0.0){
			irrfTotal = salarioSemInss - parcelaDeduzir - dependentes
			irrfTotal *= -1
		}
		senao{
			irrfTotal =  (salarioSemInss * aliquota) - parcelaDeduzir - dependentes
			irrfTotal *= -1
		}
		
		retorne irrfTotal
		}
	
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 0; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {salarioLiquido, 5, 6, 14}-{salarioBrutoReal, 6, 6, 16}-{liquido, 10, 7, 7}-{salarioBruto, 19, 37, 12}-{inss, 29, 7, 4}-{contribuicaoTeto, 29, 18, 16}-{parcelaDeduzir, 29, 41, 14}-{aliquota, 29, 62, 8}-{inssTotal, 29, 77, 9}-{salarioInss, 71, 31, 11}-{salarioSemInss, 73, 7, 14}-{aliquota, 29, 62, 8}-{parcelaDeduzir, 29, 41, 14}-{irrfTotal, 74, 43, 9}-{dependentes, 75, 7, 11};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */