programa{
	inclua biblioteca Matematica --> m
	inclua biblioteca Util --> u
	inclua biblioteca Tipos --> t

    	// Constantes
    	const inteiro maxColaboradores = 5  // Aumentando o limite de números

    	// Variáveis globais
	inteiro total_colaboradores = 0
	cadeia nomes[maxColaboradores]
	cadeia cpfs[maxColaboradores]
	real salarios[maxColaboradores]
	real entrada[maxColaboradores]
	real saida[maxColaboradores]
	real horaTotal[maxColaboradores]
	inteiro resposta = 0 

    	funcao inicio(){
		// Agora utilizando a função para verificar a resposta
		cadeia escolher
        	
		enquanto (resposta != 6){
          	escreva("MENU DEPARTAMENTO PESSOAL")
	            escreva(".")
	            u.aguarde(600)
	            escreva(".")
	            u.aguarde(600)
	            escreva(".\n")
	            u.aguarde(600)
	            escreva("\nO que deseja executar?")
	            u.aguarde(700)
	            escreva("\n1 - Cadastrar Colaborador\n")
	            u.aguarde(300)
	            escreva("2 - Editar Colaborador\n")
	            u.aguarde(300)
	            escreva("3 - Relatório de Folha de Pagamento\n")
	            u.aguarde(300)
	            escreva("4 - Registrar Ponto\n")
	            u.aguarde(300)
	            escreva("5 - Mostrar lista de colaboradores\n")
	            u.aguarde(300)
	            escreva("6 - Sair\n")
	            u.aguarde(400)
	            escreva("Escolha uma opção: ")
	            
	            

		cadeia respostaTexto // Novo texto de resposta
		leia(respostaTexto)
            
		resposta = verificarResposta(respostaTexto)  // Usando a função para verificar a entrada
            
		escolha(resposta){
			caso 1:
				cadastrarColaborador()
               	pare
			caso 2:
           		editarColaborador()
               	pare
           	caso 3:
               	calcularFolhaPagamento() //adicionar  uma mensagem caso clicado sem colaboradores criados
               	pare
           	caso 4:
               	registrarPonto()
               	pare
           	caso 5:
               	listaDeColaboradores()
               	pare
           	caso 6:
               	u.aguarde(200)
               	escreva("\n\nDeseja realmente sair do programa?")
	            	u.aguarde(400)
	            	escreva("\n\nsair // retornar\n")
	            	escreva("\nDigite: ")
	            	leia(escolher)
	            	se (escolher == "sair" ou escolher == "SAIR"){
	            		escreva("Encerrando o programa...\n")
	            		u.aguarde(1000)
	            		limpa()
	            		pare
	            	}
	  			senao se (escolher == "retornar" ou  escolher == "RETORNAR"){
	  				escreva("\nRedirecionando...")
	  				u.aguarde(600)
	  				limpa()
	  				inicio()
	  				pare
	  			}
	  			
	  			senao{
	  				escreva("\nENTRADA INVALIDA!")
	  				escreva("\nPOR FAVOR, DIGITE UMA ENTRADA VÁLIDA!")
	  				u.aguarde(2500)
	  				escreva("\n\nRedirecionando...")
	  				u.aguarde(600)
	  				limpa()
	  				inicio()
	  			}
               	pare
           	caso contrario:
               	escreva("\n\nOpção inválida! Tente novamente.\n")
               	u.aguarde(2000)
               	limpa() 
            	}
        	}
    	}
	funcao cadastrarColaborador(){
		cadeia escolher
		
		se (total_colaboradores >= maxColaboradores){
			escreva("Limite de colaboradores atingido!\n")
        	}
        	senao{
        		limpa()
        		escreva("CADASTRO DE COLABORADORES\n\n")
            	escreva("Digite o nome do novo colaborador: ")
            	leia(nomes[total_colaboradores])
            	
            	escreva("Digite o CPF do novo colaborador: ")
            	leia(cpfs[total_colaboradores])
            	
            	escreva("Digite o salário do novo colaborador: R$ ")
            	leia(salarios[total_colaboradores])
            	
            	se (salarios[total_colaboradores] < 0){
            		escreva("\nO salário digitado é negativo!")
            		u.aguarde(1000)
            		escreva("\nRecomeçando cadastro..")
            		u.aguarde(1500)
            		cadastrarColaborador()
            	}
            	senao se(salarios[total_colaboradores] > 0){
	            	
	            	entrada[total_colaboradores] = 0.0
	            	saida[total_colaboradores] = 0.0
	
	            	total_colaboradores = total_colaboradores + 1
				
				escreva("\nColaborador cadastrado com sucesso!\n")
				u.aguarde(400)
				escreva("\nDeseja cadastrar mais um colaborador? ")
				u.aguarde(600)
		          escreva("\n\nsim // nao\n")
				escreva("\nDigite: ")
	            	leia(escolher)
	            	
	            	se (escolher == "sim" ou escolher == "SIM"){
	            		cadastrarColaborador()
	            		
	            	}
	  			senao se (escolher == "nao" ou  escolher == "NAO"){
	  				escreva("\nRedirecionando...")
	  				u.aguarde(600)
	  				limpa()
	  				
	  			}
	  			
	  			senao{
	  				escreva("\nENTRADA INVALIDA!")
	  				escreva("\nPOR FAVOR, DIGITE UMA ENTRADA VÁLIDA!")
	  				u.aguarde(2500)
	  				escreva("\n\nRedirecionando...")
	  				u.aguarde(600)
	  				limpa()
	  				inicio()
  			}
            }
            senao{
            	escreva("\n\nOpção inválida! Tente novamente.\n")
               	u.aguarde(2000)
               	limpa()
               	cadastrarColaborador()
            }
        }
    }
    	funcao editarColaborador(){
		cadeia cpf
        	inteiro indice = -1

		se (total_colaboradores == 0){
			limpa()
			escreva("*Nenhum colaborador encontrado para concluir a edição.*")
			u.aguarde(1000)
			escreva("\n\nTente cadastrar um colaborador selecionando '1 - CADASTRAR COLABORADOR' antes de tentar novamente!")
			u.aguarde(700)
			escreva("\n\nVoltando para o Menu Departamento Pessoal...")
			u.aguarde(3700)
			limpa()
			inicio()
		}
		limpa()
		escreva("EDIÇÃO DE COLABORADORES\n\n")
		escreva("Digite o CPF do colaborador para editar: ")
		leia(cpf)

	para (inteiro i = 0; i < total_colaboradores; i++){
		se (cpfs[i] == cpf){
     		indice = i
			pare
			}
		}

		se (indice == -1){
			escreva("\n\nColaborador não encontrado!\n")
			u.aguarde(1000)
			escreva("\n\nRedirecionando para o Menu Departamento Pessoal...")
			u.aguarde(2000)
			limpa()
		}
        	senao{
        		//escrever informações antigas do colaborador para depois:
			para (inteiro i = 0; i < maxColaboradores; i++){
			
				se(nomes[i] !=""){
	
		        	escreva("INFORMAÇÕES ANTERIORES:")
				escreva("\nCpf: ",cpfs[i])
				escreva("\nNome: ",nomes[i])
				escreva("\nSalário: ",salarios[i]) 
				u.aguarde(1000)
	        		pare
				}
			}
			escreva("\nDigite o novo nome: ")
			leia(nomes[indice])
			escreva("Digite o novo salário: R$")
			leia(salarios[indice])
			escreva("\n\nDados do colaborador atualizados com sucesso!\n")
			
			escreva("\n\nRedirecionando para o Menu Departamento Pessoal...")
			u.aguarde(2000)
			limpa()
	  
	 	}
    	}
    	funcao calcularFolhaPagamento(){
        	real salario_bruto, inss, irrf, salario_liquido
		inteiro escolher
		cadeia escolherCadeia
		cadeia cpf
		inteiro indice = -1
		
		
		testarQntdColaboradores()
		
        	para (inteiro i = 0; i < total_colaboradores; i++){
        		salario_bruto = salarios[i]
			real salarioSemInss = 0.0
	          
           	inss = calcularINSS(salario_bruto)  // Modularizando o cálculo do INSS
           	salarioSemInss = salario_bruto - inss
	          irrf = calcularIRRF(salarioSemInss)  // Modularizando o cálculo do IRRF
			
			
	          salario_liquido = salario_bruto - inss - irrf

			limpa()
			escreva("Gerando relatório da folha de pagamento")
			u.aguarde(500)
			escreva(".")
	          u.aguarde(600)
	          escreva(".")
	          u.aguarde(600)
	          escreva(".\n")
	          u.aguarde(600)
	          limpa()
	          escreva("Calculo pronto!")
	          u.aguarde(400)
	          limpa()
	          
		
			escreva("RELATÓRIO DA FOLHA DE PAGAMENTO")
            	escreva("\nColaborador:............... ", nomes[i])
            	escreva("\nCPF:....................... ", cpfs[i])
            	escreva("\nHora de Entrada:........... ", entrada[i])
			escreva("\nHora de Saída:............. ", saida[i])
            	escreva("\nHoras totais trabalhadas:", (entrada[i] - saida[i])*-1)
            	escreva("\nSalário Bruto:...........R$", salario_bruto)
            	escreva("\nINSS:....................R$", inss)
            	escreva("\nIRRF(Imposto de Renda):..R$", irrf)
            	escreva("\nSalário Líquido:.........R$", salario_liquido)
			escreva("\n----------------------------------\n")
			u.aguarde(2000)
			
			
        	}
        		escreva("\n\nDeseja retornar ao MENU DEPARTAMENTO PESSOAL?")
			u.aguarde(400)
	          escreva("\n1 para retornar //\t 2 para sair\n")
			escreva("\nDigite: ")
	          leia(escolher)
			
			escolha(escolher){
			caso 1:
	  			escreva("\nRedirecionando...")
	  			u.aguarde(600)
	  			limpa()
	  			inicio()
				
			pare
			caso 2:
               	u.aguarde(200)
               	escreva("\n\nDeseja realmente sair do programa?")
	            	u.aguarde(400)
	            	escreva("\n\nretornar // sair\n")
	            	escreva("\nDigite: ")
	            	leia(escolherCadeia)
	            	se (escolherCadeia == "sair" ou escolherCadeia == "SAIR"){
	            		escreva("Encerrando o programa...\n")
	            		u.aguarde(1000)
	            		resposta = 6 //puxar caso 6 da funcao inicio
	            		limpa()
	            		pare
	            	}
	            	
	  			senao{
	  				escreva("\nENTRADA INVALIDA!")
	  				escreva("\nPOR FAVOR, DIGITE UMA ENTRADA VÁLIDA!")
	  				u.aguarde(2500)
	  				escreva("\n\nRedirecionando...")
	  				u.aguarde(600)
	  				limpa()
	  				
	            	}
               pare
           	caso contrario:
               	escreva("\nENTRADA INVALIDA!")
  				escreva("\nPOR FAVOR, DIGITE UMA ENTRADA VÁLIDA!")
  				u.aguarde(2500)
  				escreva("\n\nRedirecionando...")
  				u.aguarde(600)
  				limpa()
  				inicio()
    	  } 
    	}
    	funcao real calcularINSS(real salario_bruto){
       	real salario_liquido
       	
        se (salario_bruto <= 1412){
            retorne salario_bruto * 0.075
        }
        senao se (salario_bruto <= 2666.68){
            retorne salario_bruto * 0.09
        }
        senao se (salario_bruto <= 4000.03){
            retorne salario_bruto * 0.12
        }
        senao{
            retorne salario_bruto * 0.14
        }
    }
    	funcao real calcularIRRF(real salario_bruto){
        se (salario_bruto <= 2112){
            retorne 0.0
        }
        senao se (salario_bruto <= 2826.65){
            retorne salario_bruto * 0.075
        }
        senao se (salario_bruto <= 3751.05){
            retorne salario_bruto * 0.15
        }
        senao se (salario_bruto <= 4664.68){
            retorne salario_bruto * 0.225
        }
        senao{
            retorne salario_bruto * 0.275
        }
    }	
	funcao registrarPonto() {
		cadeia cpf
		inteiro indice = -1
		real hr_entrada, hr_saida, hr_total
		limpa()
        
		se (total_colaboradores == 0){
			testarQntdColaboradores()
		}
     	senao{
 		escreva("REGISTRAR PONTO")
 		u.aguarde(1500)
 		escreva("\nDigite o CPF do colaborador: ")
		leia(cpf)
        
		para (inteiro i = 0; i < total_colaboradores; i++){
			se (cpfs[i] == cpf){ //fazer cpf aceitar cadeia
				indice = i
			pare
			}
		}

		se (indice == -1){
			escreva("\n\nColaborador não encontrado!\n")
			u.aguarde(1000)
			escreva("\n\nRedirecionando para o Menu Departamento Pessoal...")
			u.aguarde(2000)
			limpa()
        	}
        	senao{
            	escreva("Digite a hora de entrada: ")
            	leia(hr_entrada)
            	entrada[indice] = hr_entrada
            	//traduzir de real para cadeia

            	escreva("Digite a hora de saída: ")
            	leia(hr_saida)
            	saida[indice] = hr_saida
            	//traduzir de real para cadeia

            	escreva("Total de horas: ")
            	hr_total = hr_saida - hr_entrada
            	escreva(hr_total, "\n")
            	
            
            	escreva("Ponto registrado com sucesso!\n")
            	u.aguarde(2000)
            	limpa()
        }
    	}
    }
   	funcao inteiro verificarResposta(cadeia resposta){
        inteiro respostaInteiro 
        se(t.cadeia_e_inteiro(resposta, 10)){
            respostaInteiro = t.cadeia_para_inteiro(resposta, 10)
            retorne respostaInteiro
        }
        senao{
            escreva("Comando inválido\n")
            retorne 0 
        }
    }	
   	funcao testarQntdColaboradores(){
		se (total_colaboradores == 0){
				limpa()
				escreva("*Nenhum colaborador cadastrado para dar continuidade na ação selecionada!*")
				u.aguarde(1000)
				escreva("\n\nRedirecionando para o Menu Departamento Pessoal...")
				u.aguarde(2000)
				limpa()
		}
    }	
	funcao listaDeColaboradores(){

	limpa()
	escreva("LISTA DE COLABORADORES")
	u.aguarde(1000)
	para (inteiro i = 0; i < maxColaboradores; i++){
		para(inteiro j = 0; j < maxColaboradores; j++){
		se(nomes[i] !=""){
        	
		escreva("\nNome: ",nomes[i])
		escreva("\nCpf: ",cpfs[i])  
		escreva("\nSalário: ",salarios[i])   
		escreva("\n")
		u.aguarde(300)
		pare
        
		}
		}
	}
	u.aguarde(3000)
	limpa()
    }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 3151; 
 * @DOBRAMENTO-CODIGO = [107, 176, 236, 336, 352, 369, 420, 431, 441];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */