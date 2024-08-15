programa {
    inclua biblioteca Matematica --> m
    inclua biblioteca Tipos --> t
    inclua biblioteca Util --> u
    const inteiro Vcadastro = 2
    const inteiro Vlinha = 2
    const inteiro Vcoluna = 6

    cadeia cpf
    real hrEntra[Vlinha] // Vetor para armazenar horas de entrada
    real hrSaida[Vlinha] // Vetor para armazenar horas de sa�da

    funcao inicio() {
        cadeia MatrizGeral[Vlinha][Vcoluna]
        menu(MatrizGeral)
    }

    funcao cadastrar(cadeia &matriz[][]) {
        escreva("==Cadastrar novo colaborador==")
        u.aguarde(500)
        cadeia nome, CPF, Salario
        logico cadastrou = falso

        para(inteiro i = 0; i < Vlinha; i++) {
            se(matriz[i][0] == "") {
                escreva("\nEscreva o nome completo do colaborador que deseja cadastrar: ")
                leia(nome)
                u.aguarde(200)
                escreva("Escreva o CPF do colaborador que deseja cadastrar: ")
                leia(CPF)
                u.aguarde(200)
                escreva("Escreva o sal�rio do colaborador que deseja cadastrar: ")
                leia(Salario)
                u.aguarde(200)
                limpa()

                matriz[i][0] = CPF
                matriz[i][1] = nome
                matriz[i][2] = Salario
                matriz[i][3] = "0"
                matriz[i][4] = "0" // Hor�rio de entrada inicial
                matriz[i][5] = "0" // Hor�rio de sa�da inicial
                cadastrou = verdadeiro
            }
            se(cadastrou == verdadeiro) {
                escreva("Colaborador Cadastrado!!")
                pare
            }
        }
        se(cadastrou == falso) {
            escreva("N�o foi poss�vel cadastrar, sistema cheio")
        }
        menu(matriz)
    }

    funcao menu(cadeia &matriz[][]) {
        inteiro opcao

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
        escreva("\nEscolha uma op��o: ")
        leia(opcao)
        limpa()

        escolha(opcao) {
            caso 1:
                cadastrar(matriz)
                pare

            caso 2:
                ponto(matriz)
                pare    

            caso 3:
                escreva("Calcular Folha de Pagamento")
                pare

            caso 4:
                editaFuncionario(matriz)
                pare

            caso 5:
                escrevaMatriz(matriz)
                pare

            caso contrario:
                escreva("Escolha uma op��o v�lida!\n")
                u.aguarde(500)    
                menu(matriz)     
        }
    }

    funcao editaFuncionario(cadeia &matriz[][]) {
        cadeia resposta = pesquisafuncionario(matriz)
        cadeia nome, CPF, Salario
        inteiro opcao
        caracter quereditar = 'S'
        se(resposta == "") {
            menu(matriz)
        }
        para(inteiro i = 0; i < Vlinha; i++) {
            se(resposta == matriz[i][0]) {
                faca {
                    escreva("\n1. Nome\n2. CPF\n3. Sal�rio\n4. Voltar para o menu\nQual informa��o do colaborador(a) ", matriz[i][1], " voc� deseja editar?")
                    leia(opcao)

                    escolha(opcao) {
                        caso 1: // Edita nome
                            escreva("\nEscreva o novo nome: ")
                            leia(nome)
                            matriz[i][1] = nome
                            escreva("\nNome do colaborador foi editado com sucesso para ", nome, " Boa sorte!!")
                            pare

                        caso 2: // Edita CPF
                            escreva("\nEscreva o novo CPF do colaborador: ")
                            leia(CPF)
                            matriz[i][0] = CPF
                            escreva("\nO CPF do colaborador foi editado com sucesso para ", CPF, " Boa sorte!!")
                            pare

                        caso 3: // Edita sal�rio
                            escreva("\nEscreva o novo sal�rio do colaborador: R$")
                            leia(Salario)
                            matriz[i][2] = Salario
                            escreva("\nO novo sal�rio � de: R$", Salario)
                            pare

                        caso 4:
                            menu(matriz)
                            pare
                    }
                    escreva("\nVoc� deseja continuar editando? (S/N) ")
                    leia(quereditar)
                    enquanto(quereditar != 'S' e quereditar != 's' e quereditar != 'n' e quereditar != 'N') {
                        escreva("\nInsira um caractere v�lido (S/N): ")
                        leia(quereditar)
                    }
                } enquanto (quereditar == 's' ou quereditar == 'S')
                se(quereditar == 'n' ou quereditar == 'N') {
                    menu(matriz)
                }
            }
        }
    }

    funcao cadeia pesquisafuncionario(cadeia &matriz[][]) {
        cadeia resposta = ""
        caracter querpesquisar = 's'
        faca {    
            escreva("Digite o CPF do colaborador desejado: ")
            leia(cpf)

            para(inteiro i = 0; i < Vlinha; i++) {
                se(matriz[i][0] == cpf) {
                    resposta = cpf
                    retorne resposta    
                }
            }
            se(resposta == "") {
                escreva("N�o foi encontrado nenhum colaborador com esse CPF :c")
                escreva("\nDeseja pesquisar novamente? (S/N): ")
                leia(querpesquisar)
                enquanto(querpesquisar != 'S' e querpesquisar != 's' e querpesquisar != 'n' e querpesquisar != 'N') {
                    escreva("\nInsira um caractere v�lido (S/N): ")
                    leia(querpesquisar)
                }
            }
        } enquanto (querpesquisar == 's' ou querpesquisar == 'S')
        retorne resposta
    }

    funcao escrevaMatriz(cadeia &matriz[][]) {
        para(inteiro i = 0; i < Vlinha; i++) {
            para(inteiro j = 0; j < Vcoluna; j++) {
                escreva(" [", matriz[i][j], "] ")
            }
            escreva("\n")
        }    
        menu(matriz)
    }

    funcao ponto(cadeia &matriz[][]) {
        inteiro res
        escreva("FOLHA DE PONTO")
        escreva("\nVoc� quer marcar entrada ou sa�da? [1] para entrada, [2] para sa�da, [3] folha de ponto, [4] Voltar ao menu\n")
        leia(res)
        escolha(res) {
            caso 1:
                real hr
                escreva("Qual CPF: ")
                leia(cpf)
                logico encontrado = falso
                para(inteiro i = 0; i < Vlinha; i++) {
                    se(matriz[i][0] == cpf) {
                        encontrado = verdadeiro
                        escreva("Hora de entrada: ")
                        leia(hr)
                        hrEntra[i] = hr
                        matriz[i][4] = hrEntra[i] + ""
                        escreva("Ponto de entrada marcado com sucesso \nHor�rio de entrada: ", hrEntra[i], "\n")
                        ponto(matriz)
                        pare
                    }
                }
                se(encontrado == falso) {
                    escreva("CPF INV�LIDO!\n")
                    ponto(matriz)
                }
                pare

            caso 2:
                real hr
                escreva("Qual CPF: ")
                leia(cpf)
                logico encontrado = falso
                para(inteiro i = 0; i < Vlinha; i++) {
                    se(matriz[i][0] == cpf) {
                        encontrado = verdadeiro
                        escreva("Hora de sa�da: ")
                        leia(hr)
                        hrSaida[i] = hr
                        matriz[i][5] = hrSaida[i] + ""
                        escreva("Ponto de sa�da marcado com sucesso\nHor�rio de sa�da: ", hrSaida[i], "\n")
                        ponto(matriz)
                        pare
                    }
                }
                se(encontrado == falso) {
                    escreva("CPF INV�LIDO!\n")
                    ponto(matriz)
                }
                pare

            caso 3:
                cargaHora(matriz)
                pare

            caso 4:
                inicio()
                pare
        }
    }

    funcao cargaHora(cadeia &matriz[][]) {
        real totalHora
        real hrExtra
        escreva("Qual o CPF do funcion�rio: ")
        leia(cpf)
        logico encontrado = falso
        para(inteiro i = 0; i < Vlinha; i++) {
            se(matriz[i][0] == cpf) {
                encontrado = verdadeiro
                totalHora = hrSaida[i] - hrEntra[i]
                hrExtra = totalHora - 8
                escreva("Funcion�rio: ", matriz[i][1], "\nHoras trabalhadas: ", totalHora, "\nHoras extras: ", hrExtra, "\n")
                ponto(matriz)
                pare
            }
        }
        se(encontrado == falso) {
            escreva("\nCPF INV�LIDO\n")
            cargaHora(matriz)
        }
    }
}
