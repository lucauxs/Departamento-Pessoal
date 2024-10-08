programa{
	inclua biblioteca Matematica --> m
	inclua biblioteca Util --> u
	inclua biblioteca Tipos --> t
    	// Constantes
    	const inteiro maxColaboradores = 2  // Aumentando o limite de números
    	// Variáveis globais
	inteiro total_colaboradores = 0
	cadeia nomes[maxColaboradores]
	cadeia cpfs[maxColaboradores]
	real salarios[maxColaboradores]
	real entrada[maxColaboradores]
	real saida[maxColaboradores]
	real horaTotal[maxColaboradores]
	real horaExtra[maxColaboradores]
	caracter resposta// Respota agora é caracter assim aceita numeros e letras 
	caracter escolher
    	funcao inicio(){// tirei a opcao do loop, mas sempre que digitarem errado volta para a funçao
		
		escreva("MENU DEPARTAMENTO PESSOAL")
		escreva(".")
		u.aguarde(500)
		escreva(".")
		u.aguarde(500)
		escreva(".\n")
		u.aguarde(500)
		escreva("\nO que deseja executar?")
		u.aguarde(500)
		escreva("\n1 - Cadastrar Colaborador\n")
		u.aguarde(300)
		escreva("2 - Editar Colaborador\n")
		u.aguarde(300)
		escreva("3 - Registrar Ponto\n")
		u.aguarde(300)
		escreva("4 - Relatório de Folha de Pagamento\n")
		u.aguarde(300)
		escreva("5 - Mostrar lista de colaboradores\n")
		u.aguarde(300)
		escreva("6 - Sair\n")
		u.aguarde(500)
		escreva("Escolha uma opção: ")
		leia(resposta)   
		escolha(resposta){
			caso '1':
				cadastrarColaborador()
               pare
			caso '2':
           		editarColaborador()
               pare
           	caso '3':
               	registrarPonto()
               pare
           	caso '4':
               	calcularFolhaPagamento() //adicionar  uma mensagem caso clicado sem colaboradores criados
               pare
           	caso '5':
               	listaDeColaboradores()
               pare
           	caso '6'://mudei opcao de sair, colocando confirmaçao para sair ou retorna           		
               	escreva("\n\nDeseja realmente sair do programa?")
	            	u.aguarde(400)
	            	escreva("\n[1] para retornar // [2] para sair")
	            	escreva("\nDigite: ")
	            	leia(escolher)
	            	escolha(escolher){
		            	caso '1' :
		            		escreva("\n\nRedirecionando para o Menu Departamento Pessoal...")
		            		u.aguarde(1000)
		            		limpa()
		            		inicio()
		            	pare            	
		            	caso '2':
		            		escreva("\n\nEncerrando o programa...")
		            		u.aguarde(1000)		            		
		            		limpa()
		            	pare
		  			caso contrario:
		  				escreva("\nENTRADA INVALIDA!")
		  				escreva("\nPOR FAVOR, DIGITE UMA ENTRADA VÁLIDA!")
		  				u.aguarde(1000)
		  				escreva("\n\nRedirecionando...")
		  				u.aguarde(600)
		  				limpa()
		  				inicio()	
            		}
            	pare          		
           	caso contrario:
               	escreva("\n\nOpção inválida! Tente novamente.\n")
               	u.aguarde(1000)
               	limpa()
               	inicio()
		}
        	
    	}
	funcao cadastrarColaborador(){
		se (total_colaboradores >= maxColaboradores){
			limpa()
			escreva("ATENÇÃO!")
			u.aguarde(300)
			escreva("\nLimite de colaboradores atingido!\n")
			u.aguarde(500)
			escreva("\nRedirecionando...")
  			u.aguarde(1500)
  			limpa()
  			inicio()	
        	}
        	senao{
        		limpa()
        		escreva("CADASTRO DE COLABORADORES\n\n")
            	escreva("Digite o nome do novo colaborador: ")
            	leia(nomes[total_colaboradores])
            	
            	escreva("Digite o CPF do novo colaborador: ")
            	leia(cpfs[total_colaboradores])
            	
            	escreva("Digite o salário (somente em números) do novo colaborador: R$ ")
            	leia(salarios[total_colaboradores])
            	
            	se (salarios[total_colaboradores] < 0){
            		escreva("\nO salário digitado é negativo!")
            		u.aguarde(1000)
            		escreva("\nRecomeçando cadastro..")
            		u.aguarde(1000)
            		cadastrarColaborador()
            	}
            	senao se(salarios[total_colaboradores] > 0){
	            	entrada[total_colaboradores] = 0.0
	            	saida[total_colaboradores] = 0.0
	            	total_colaboradores = total_colaboradores + 1
				
				escreva("\nColaborador cadastrado com sucesso!\n")
				u.aguarde(500)
				
           	}
	          senao{
	            	escreva("\n\nOpção inválida! Tente novamente.\n")
               	u.aguarde(1000)
               	limpa()
               	cadastrarColaborador()
          	}
			escreva("\nDeseja cadastrar mais um colaborador? ")
			u.aguarde(500)
	          escreva("\n\n[1] para sim [2] para não \n")
			escreva("\nDigite: ")
	       	leia(escolher)
	       	
	       	se (escolher == '1'){
	       		cadastrarColaborador()       		
	       	}
			senao se (escolher == '2'){//adcionei funçao de confirmaçao de saida diminuindo a linha de codigo
				inicioSair()
			}			
			senao{
				escreva("\nENTRADA INVALIDA!")
				escreva("\nPOR FAVOR, DIGITE UMA ENTRADA VÁLIDA!")
				u.aguarde(1000)
				escreva("\n\nRedirecionando...")
				u.aguarde(500)
				limpa()
				inicio()
			}
        }
    }
    	funcao editarColaborador(){
		cadeia cpf
        	inteiro indice = -1
		inteiro res
		se (total_colaboradores == 0){
			limpa()
			escreva("*Nenhum colaborador encontrado para concluir a edição.*")
			u.aguarde(500)
			escreva("\n\nTente cadastrar um colaborador selecionando '1 - CADASTRAR COLABORADOR' antes de tentar novamente!")
			u.aguarde(1000)
			escreva("\n\nVoltando para o Menu Departamento Pessoal...")
			u.aguarde(1000)
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
	     		escreva("INFORMAÇÕES ANTERIORES:\n")
				escreva("\nCpf: ",cpfs[i])
				escreva("\nNome: ",nomes[i])
				escreva("\nSalário: ",salarios[i]) 
				u.aguarde(500)
				escreva("\n\nOque deseja editar:\n[1] Nome [2] CPF [3] Salario")//adicionado opção para escolher oq qr edita 
				escreva("\nDigite: ")
				leia(escolher)
				se(escolher =='1'){
					escreva("\nDigite o novo nome: ")
					leia(nomes[indice])
				}
				senao se(escolher =='2'){
					escreva("\nDigite o novo CPF: ")
					leia(cpfs[indice])
				}	
				senao se(escolher =='3'){
					escreva("\nDigite o novo salario (somente em números): ")
					leia(salarios[indice])
				}
				senao{
					escreva("\nOpção invalida !!")					
					escreva("\nRedirecionando...")
					u.aguarde(500)
					editarColaborador()
					}
									
			}
		 }	
			se(indice == -1){
				escreva("\n\nColaborador não encontrado!\n")
				u.aguarde(500)
				escreva("\n\nRedirecionando...")
				u.aguarde(500)
				limpa()
				editarColaborador()				
			}
		
		limpa()
		escreva("Dados do colaborador atualizados com sucesso!\n")								  
	 	u.aguarde(500)
	 	escreva("\nDeseja editar outro colaborador ?\n[1] para sim [2] para não ")
	 	u.aguarde(500)
	 	escreva("\nDigite: ")
	 	leia(escolher)
	 	se(escolher =='1'){
	 		editarColaborador()
	 	}
	 	senao{
	 		inicioSair()	
 		}			
    	}
    	funcao calcularFolhaPagamento(){
        	real salario_bruto, inss, irrf, salario_liquido
		cadeia cpf
		inteiro indice = -1
		
		testarQntdColaboradores()
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
        	para (inteiro i = 0; i < total_colaboradores; i++){
        		salario_bruto = salarios[i]
			real salarioSemInss = 0.0					          
           	inss = calcularINSS(salario_bruto)  // Modularizando o cálculo do INSS
           	salarioSemInss = salario_bruto - inss
	          irrf = calcularIRRF(salarioSemInss)  // Modularizando o cálculo do IRRF
	          salario_liquido = salario_bruto - inss - irrf
	          
			
			escreva("\nRELATÓRIO DA FOLHA DE PAGAMENTO")
            	escreva("\nColaborador:............... ", nomes[i])
            	escreva("\nCPF:....................... ", cpfs[i])
            	escreva("\nHora de Entrada:........... ", entrada[i])
			escreva("\nHora de Saída:............. ", saida[i])
            	escreva("\nHoras totais trabalhadas:.. ", horaTotal[i])
            	escreva("\nHoras Extras:.............. ", horaExtra[i])
            	escreva("\nSalário Bruto:............R$", salario_bruto)
            	escreva("\nINSS:.....................R$", inss)
            	escreva("\nIRRF(Imposto de Renda):...R$", irrf)
            	escreva("\nSalário Líquido:..........R$", salario_liquido)
			escreva("\n----------------------------------\n")
			u.aguarde(1500)	
        	} 
        	inicioSair() 
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
		real hr_entrada, hr_saida, hr_total,hr_extra,res
		limpa()
        
		se (total_colaboradores == 0){
			testarQntdColaboradores()
		}
     	senao{
 		escreva("REGISTRAR PONTO")
 		u.aguarde(500)
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
				u.aguarde(500)
				escreva("Deseja voltar?")
				u.aguarde(500)
		          escreva("\n\n[1] para sim [2] para não \n")
				escreva("Digite: ")
		       	leia(escolher)
		       	
		       	se (escolher == '1'){
		       		registrarPonto()       		
		       	}
				senao se (escolher == '2'){//adcionei funçao de confirmaçao de saida diminuindo a linha de codigo
					inicioSair()
				}			
				senao{
					escreva("\nENTRADA INVALIDA!")
					escreva("\nPOR FAVOR, DIGITE UMA ENTRADA VÁLIDA!")
					u.aguarde(1000)
					escreva("\n\nRedirecionando...")
					u.aguarde(500)
					limpa()
					inicio()
				}
				escreva("\n\nReiniciando..")
				u.aguarde(500)
				limpa()
				registrarPonto()
		        	}
	        	senao{
	        		escreva("\nINFORMAÇÕES DO COLABORADOR:\n")
				escreva("Cpf: ",cpfs[indice])
				escreva("\nNome: ",nomes[indice])
	            	escreva("\n\nDigite a hora de entrada: ")
	            	leia(hr_entrada)
	            	entrada[indice] = hr_entrada
	            	//traduzir de real para cadeia
	
	            	escreva("Digite a hora de saída: ")
	            	leia(hr_saida)
	            	saida[indice] = hr_saida
	            	//traduzir de real para cadeia
	
	            	escreva("Total de horas: ")
	            	hr_total = hr_saida - hr_entrada
	            	horaTotal[indice] = hr_total
	            	
	            	hr_extra = hr_total - 8.0
	            	horaExtra[indice] = hr_extra
	            	
	            	escreva(hr_total, "\n")
	            	
	            	escreva("Horas Extras: ",horaExtra[indice])
	            	
	            
	            	escreva("\nPonto registrado com sucesso!\n")
	            	u.aguarde(500)
	            	
	        	}
			escreva("\n\nDejesar Registra novo ponto?\n[1] para sim [2] para não ")
		 	u.aguarde(500)
		 	escreva("\nDigite: ")
		 	leia(res)
		 	se(res ==1){
		 		registrarPonto()	 		
		 	}
		 	senao{
		 		inicioSair()	
			}        
		}
    }  		
   	funcao testarQntdColaboradores(){
		se (total_colaboradores == 0){
				limpa()
				escreva("*Nenhum colaborador cadastrado para dar continuidade na ação selecionada!*")
				u.aguarde(1000)
				escreva("\n\nRedirecionando para o Menu Departamento Pessoal...")
				u.aguarde(1500)
				limpa()
				inicio()
		}
    }	
	funcao listaDeColaboradores(){
		limpa()
		testarQntdColaboradores()
		escreva("LISTA DE COLABORADORES")
		u.aguarde(1000)
		para (inteiro i = 0; i < maxColaboradores; i++){	
			se(nomes[i] !=""){
				escreva("\nNome:....",nomes[i])
				escreva("\nCpf:.....",cpfs[i])  
				escreva("\nSalário:.",salarios[i])   
				escreva("\n")
				u.aguarde(500)
			}
		}
		u.aguarde(500)		
		inicioSair()
    }
	funcao inicioSair(){//funçao nova para confirma ser deseja sair ou retornar
		caracter escolher5,escolher4
		
		escreva("\n\nDeseja retornar ao MENU DEPARTAMENTO PESSOAL?")
		u.aguarde(400)
          escreva("\n[1] para retornar // [2] para sair\n")
		escreva("\nDigite: ")
          leia(escolher4)		
		escolha(escolher4){
		caso '1':
  			escreva("\nRedirecionando...")
  			u.aguarde(600)
  			limpa()
  			inicio()			
		pare
		caso '2':			
          	u.aguarde(200)
          	escreva("\n\nDeseja realmente sair do programa?")
            	u.aguarde(400)
            	escreva("\n[1] para retornar // [2] para sair")
            	escreva("\nDigite: ")
            	leia(escolher5)
            	escolha(escolher5){
            	caso '1' :
            		escreva("\n\nRedirecionando para o Menu Departamento Pessoal...")
            		u.aguarde(1000)
            		limpa()
            		inicio()
            	pare            	
            	caso '2':
            		escreva("\n\nEncerrando o programa...")
            		u.aguarde(1000)            		
            		limpa()
            	pare
  			caso contrario:
  				escreva("\nENTRADA INVALIDA!")
  				escreva("\nPOR FAVOR, DIGITE UMA ENTRADA VÁLIDA!")
  				u.aguarde(500)
  				escreva("\n\nRedirecionando...")
  				u.aguarde(600)
  				limpa()
  				inicioSair()	
            	}
          pare
      	caso contrario:
          	escreva("\nENTRADA INVALIDA!")
			escreva("\nPOR FAVOR, DIGITE UMA ENTRADA VÁLIDA!")
			u.aguarde(2500)
			escreva("\n\nRedirecionando...")
			u.aguarde(600)
			limpa()
			inicioSair()
	  	} 
	}
}


/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 14489; 
 * @DOBRAMENTO-CODIGO = [94, 163, 238, 281, 297];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */