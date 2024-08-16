//Cadastro de colaboradores:
//1- Incluir o dados e armazenar em um vetor
//2- Cadastro: Nome , Cpf , Salário
//3- Cadastrar novos Colaboradores 
//4- Verificar se o límite maximo de 100 ja foi atingido
//5- Editar colaboradores 
		
programa{
		inclua biblioteca Matematica --> m
		inclua biblioteca Tipos --> t
		inclua biblioteca Util --> u
		const inteiro Vcadastro = 2
		const inteiro Vlinha = 2
		const inteiro Vcoluna = 5
	funcao inicio(){
		cadeia MatrizGeral[Vlinha][Vcoluna]
		menu(MatrizGeral)
		
		
	}
	funcao  cadastrar(cadeia &matriz[][]){
		escreva("==Cadastar novo colaborador==")
		u.aguarde(500)
		cadeia nome , CPF , Salario, dependentes
		logico cadastrou = falso
		
		

		para(inteiro i =0; i<Vlinha; i++){
			se(matriz[i][0] == ""){
				escreva("\nEscreva o nome completo do colaborador que deseja cadastrar: ")
		      	leia(nome)
				u.aguarde(200)
				escreva("Escreva o CPF do colaborador que deseja cadastrar: ")
				leia(CPF)
				u.aguarde(200)
				escreva("Escreva o salário do colaborador que deseja cadastrar: ")
				leia(Salario)
				escreva("Escreva o número de dependentes ligados ao colaborador: ")
				leia(dependentes)
				u.aguarde(200)
				limpa()
				
				matriz[i][0] = CPF
				matriz[i][1] = nome
				matriz[i][2] = Salario
				matriz[i][3] = "0"
				matriz[i][4] = dependentes
				cadastrou = verdadeiro
				
				
	       }
	       se(cadastrou == verdadeiro){
	       	escreva("Colaborador Cadastrado!!")
	       	pare
	       }
		}
		se(cadastrou == falso){
			escreva("Não foi possível cadastrar, sistema cheio")	
		}
		menu(matriz)
	}
	funcao menu(cadeia &matriz[][]){
	   inteiro opcao
	   
//		inteiro informacoesColaboradores[Vlinha][Vcoluna]
		escreva("Menu de Departamento Pessoal")
		escreva(".")
		u.aguarde(500)
		escreva(".")
		u.aguarde(500)
		escreva(".")
		u.aguarde(500)

		escreva("\n1- Cadastro de Colaboradores")
		u.aguarde(500)
		escreva("\n2- Registrar Ponto")
		u.aguarde(500)
		escreva("\n3- Calcular Folha de pagamento")
		u.aguarde(500)
		escreva("\n4- Editar")
		u.aguarde(500)
		escreva("\n5- Sair")
		escreva("\nEscolha uma opção: ")
		leia(opcao)
		limpa()

//		para(inteiro i = 0; i < u.numero_linhas(matriz); i++){
//			para(inteiro j = 0; j < u.numero_colunas(matriz); j++)
		escolha (opcao){
			caso 1:
				cadastrar(matriz)
			pare
			
			caso 2:
				escreva("registrarPonto")
			pare	
			caso 3:
				escrevaSalario(matriz)
			pare
			caso 4:
				editaFuncionario(matriz)
				pare
			caso 5:
				escrevaMatriz(matriz)
			 	pare
			caso contrario:
			escreva("escolha uma opção válida!")
			u.aguarde(500)		 
	      	
		}
			
	   }
	funcao editaFuncionario(cadeia &matriz[][]){
		 cadeia resposta = pesquisafuncionario(matriz)
		 cadeia nome, CPF, Salario
		 inteiro opcao
		 caracter quereditar = 'S'
		 se(resposta == ""){
		 	menu(matriz)
		 }
		 para(inteiro  i = 0; i< Vlinha; i++){
		 	se(resposta == matriz[i][0]){
		 		faca{
		 		escreva("\n1.nome\n2.CPF\n3.Salário\n4.dependentes\n0. Voltar para o menu\nQual informação do colaborador(a)" + matriz[i][1] + " você deseja editar?")
		 		leia(opcao)
		 		
		 		
		 		escolha(opcao){
		 			caso 1:// edita nome
		 				escreva("\nEscreva o novo nome Nome: ")
		 				leia(nome)
		 				matriz[i][1] = nome
		 				escreva("\nNome do colaborador foi editado com sucesso", nome, "!")
		 				limpa()
		 				pare
		 			caso 2:// edita CPF
						escreva("\nEscreva o novo CPF do Colaborador: ")
						leia(CPF)
						matriz[i][0] = CPF
						escreva("\nO CPF do colaborador foi editado com sucesso", CPF, "!")
						limpa()
						pare
		 			caso 3:// edita salario
		 			escreva("\nEscreva o novo salário do colaborador: R$")
		 			leia(Salario)
		 			matriz[i][2] = Salario
		 			escreva("\nO novo salario é de: R$", Salario)
		 			limpa()
		 				pare
		 			caso 4:
		 			 menu(matriz)
		 			     pare	
		 			
		 		}
		 		escreva("\nVocê deseja continuar editando?(S/N) ")
		 		leia(quereditar)
		 		enquanto((quereditar != 'S') e (quereditar != 's') e (quereditar != 'n') e (quereditar != 'N')){
				escreva("\nInsira um caracter válido(S/N): ")
				leia(quereditar)
			}
		 	   }enquanto(quereditar == 's' ou quereditar == 'S')
		 	   	se(quereditar == 'n' ou quereditar == 'N'){
		 	   		menu(matriz)
		 	   	}
		 	}
		 }
	}
	funcao cadeia pesquisafuncionario(cadeia &matriz[][]){
		cadeia resposta = ""
		cadeia cpf
		caracter querpesquisar = 's'
	  faca{	
		escreva("Digite o CPF do colaborador desejado: ")
		leia(cpf)
	
		para(inteiro i = 0; i<Vlinha; i++){
			se(matriz[i][0] == cpf){
				resposta = cpf
				retorne resposta	
			}
		}
		se(resposta == ""){
			escreva("Não foi encontrado nenhum colaborador com esse cpf :c")
			escreva("\nDeseja pesquisar novamente? (S/N): ")
			leia(querpesquisar)
			enquanto((querpesquisar != 'S') e (querpesquisar != 's') e (querpesquisar != 'n') e (querpesquisar != 'N')){
				escreva("\nInsira um caracter válido(S/N): ")
				leia(querpesquisar)
			}
		}
	}
	enquanto(querpesquisar == 's' ou querpesquisar == 'S' )
		retorne resposta
	}
	funcao escrevaMatriz(cadeia &matriz[][]){
		para(inteiro i = 0; i<Vlinha; i++){
			para(inteiro j = 0; j<Vcoluna; j++){
				escreva(" [", matriz[i][j],"] ")
			}
		escreva("\n")
	  }	
	  menu(matriz)
	}

//INICIO PARTE 2	
	real salarioLiquido= 0.0
	real salarioBruto = menu(matriz[i][2] = Salario)
	
	funcao escreverSalario()
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
		
		dependentes = (matriz[i][4] = dependentes)
		
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
 * @POSICAO-CURSOR = 5607; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, funcao;
 */