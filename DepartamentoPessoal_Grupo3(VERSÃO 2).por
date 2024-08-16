programa{
	inclua biblioteca Matematica --> m
	inclua biblioteca Util --> u
	inclua biblioteca Tipos --> t

    	// Constantes
    	const inteiro maxColaboradores = 10  // Aumentando o limite de números

    	// Variáveis globais
	inteiro total_colaboradores = 0
	cadeia nomes[maxColaboradores]
	cadeia cpfs[maxColaboradores]
	real salarios[maxColaboradores]
	real entrada[maxColaboradores]
	real saida[maxColaboradores]

    	funcao inicio(){
		inteiro resposta = 0 // Agora utilizando a função para verificar a resposta
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
	            escreva("3 - Calcular Folha de Pagamento\n")
	            u.aguarde(300)
	            escreva("4 - Registrar Ponto\n")
	            u.aguarde(300)
	            escreva("5 - Relatório de Folha de Pagamento\n")
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
               	relatorioFolhaPagamento()
               	pare
           	caso 6:
               	u.aguarde(200)
               	escreva("\n\nDeseja realmente sair do programa?")
	            	u.aguarde(400)
	            	escreva("\n\nsair //\t voltar\n")
	            	escreva("\nDigite: ")
	            	leia(escolher)
	            	se (escolher == "sair"){
	            		escreva("Encerrando o programa...\n")
	            		u.aguarde(1000)
	            		pare
	            	}
	  			senao{
	  				escreva("\nRedirecionando...")
	  				u.aguarde(600)
	  				limpa()
	  				inicio()
	  			}
               	pare
           	caso contrario:
               	escreva("Opção inválida! Tente novamente.\n")
               	limpa() 
            }
        }
    }

	funcao cadastrarColaborador(){
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

            	entrada[total_colaboradores] = 0.0
            	saida[total_colaboradores] = 0.0

            	total_colaboradores = total_colaboradores + 1
			escreva("\nColaborador cadastrado com sucesso!\n")
		u.aguarde(2000)
		limpa()
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
			escreva("\n\nDigite o novo nome: ")
			leia(nomes[indice])
			escreva("Digite o novo salário: R$ ")
			leia(salarios[indice])
			escreva("\n\n\nDados do colaborador atualizados com sucesso!\n")
			
			escreva("\n\nRedirecionando para o Menu Departamento Pessoal...")
			u.aguarde(2000)
			limpa()
        	}
    	}

    	funcao calcularFolhaPagamento(){
        	real salario_bruto, inss, irrf, salario_liquido

		testarQntdColaboradores()
		
        	para (inteiro i = 0; i < total_colaboradores; i++){
        		salario_bruto = salarios[i]
	          
           	inss = calcularINSS(salario_bruto)  // Modularizando o cálculo do INSS
	          irrf = calcularIRRF(salario_bruto)  // Modularizando o cálculo do IRRF
	
	          salario_liquido = salario_bruto - inss - irrf

			escreva("FOLHAS DE PAGAMENTO")
            	escreva("\nColaborador: ", nomes[i])
            	escreva("\nSalário Bruto: R$ ", salario_bruto)
            	escreva("\nINSS: R$ ", inss)
            	escreva("\nIRRF: R$ ", irrf)
            	escreva("\nSalário Líquido: R$ ", salario_liquido)
            	escreva("\n----------------------------------\n")
        	}
    	}

    funcao real calcularINSS(real salario_bruto){
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
		real hr_entrada, hr_saida
		limpa()
        
		se (total_colaboradores == 0){
			testarQntdColaboradores()
		}
     	senao{
 		escreva("Digite o CPF do colaborador: ")
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
            
            	escreva("Ponto registrado com sucesso!\n")
            	u.aguarde(2000)
            	limpa()
        }
    	}
    }

    funcao relatorioFolhaPagamento(){
		testarQntdColaboradores()
		
		para (inteiro i = 0; i < total_colaboradores; i++){
          limpa()
          escreva("FOLHA DE PAGAMENTO")
          escreva("\nColaborador: ", nomes[i])
		escreva("\nCPF: ", cpfs[i])
		escreva("\nSalário: R$ ", salarios[i])
		escreva("\nHora de Entrada: ", entrada[i])
		escreva("\nHora de Saída: ", saida[i])
		escreva("\n----------------------------------\n")
		u.aguarde(10000)
		limpa()
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
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 6752; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */