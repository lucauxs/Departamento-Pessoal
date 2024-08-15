//Cadastro de colaboradores:
//1- Incluir o dados e armazenar em um vetor
//2- Cadastro: Nome , Cpf , Salário
//3- Cadastrar novos Colaboradores 
//4- Verificar se o límite maximo de 100 ja foi atingido
//5- Editar colaboradores 
		
programa
{
	
	inclua biblioteca Matematica --> m
	inclua biblioteca Tipos --> t
	inclua biblioteca Util --> u
	const inteiro Vcadastro = 2
	const inteiro Vlinha = 2
	const inteiro Vcoluna = 4
	funcao inicio()
{
		cadeia MatrizGeral[Vlinha][Vcoluna]
		menu(MatrizGeral)
		
		
	}
	funcao  cadastrar(cadeia &matriz[][]){
		escreva("==Cadastar novo colaborador==")
		u.aguarde(500)
		cadeia nome , CPF , Salario
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
				u.aguarde(200)
				limpa()
				
				matriz[i][0] = CPF
				matriz[i][1] = nome
				matriz[i][2] = Salario
				matriz[i][3] = "0"
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
				escreva("CalcularFolhaDePagamento")
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
		 		escreva("\n1. nome\n2.CPF\n3.Salário\n4. Voltar para o menu\nQual informação do colaborador(a)" + matriz[i][1] + " você deseja editar?")
		 		leia(opcao)
		 		
		 		
		 		escolha(opcao){
		 			caso 1:// edita nome
		 				escreva("\nEscreva o novo nome Nome: ")
		 				leia(nome)
		 				matriz[i][1] = nome
		 				escreva("\nNome do colaborador foi editado com sucesso", nome, "Boa sorte!!")
		 				pare
		 			caso 2:// edita CPF
						escreva("\nEscreva o novo CPF do Colaborador: ")
						leia(CPF)
						matriz[i][0] = CPF
						escreva("\nO CPF do colaborador foi editado com sucesso", CPF, "Boa sorte!!")
						pare
		 			caso 3:// edita salario
		 			escreva("\nEscreva o novo salário do colaborador: R$")
		 			leia(Salario)
		 			matriz[i][2] = Salario
		 			escreva("\nO novo salario é de: R$", Salario)
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
}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2535; 
 * @DOBRAMENTO-CODIGO = [20, 59, 110, 162, 189];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, funcao;
 */