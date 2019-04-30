Algoritmo "Banco"
// Disciplina  :  [Linguagem e Lógica de Programação]
// Professor   : Antonio Carlos Nicolodi
// Descrição   : Aqui você descreve o que o programa faz! (função)
// Autor(a)    : Douglas Ronchi
// Data atual  : 30/04/2019
Var
   // Seção de Declarações das variáveis
   ssair, sair, opcao,limemp,vezes,i,p,y,x,opcaox,querpagar:inteiro
   saldo,vlrsaque,ressaldo,vlrdeposito,maxemp,vlremprestimo,vlrpagamento:real
   saldodevedor,parce,vlrparcelas,aux:real
   enter,opcaoparcela:caractere
   parcelas : vetor [1..13] de real
Inicio
   // Seção de Comandos, procedimento, funções, operadores, etc...
   p:=1
procedimento ssair
inicio
   sair:=1
   escreval("Volte Sempre...")
fimprocedimento

procedimento sacar
inicio
   escreval("Qual o valor a sacar?")
   leia(vlrsaque)
   se vlrsaque>0 entao
      se (saldo > -2000) entao
         ressaldo:=saldo-vlrsaque
         se (ressaldo >= -2000) entao
            saldo:=saldo-vlrsaque
            escreval("Saque realizado com sucesso!")
         senao
            escreval("Limite do cheque especial: R$2000")
         fimse
      senao
         escreval("Limite do cheque especial: R$2000")
      fimse
   senao
      escreval("Você não pode sacar ZERO!")
   fimse
   ressaldo:=0
fimprocedimento

procedimento depositar
inicio
   escreval("Qual o valor do depósito?")
   leia(vlrdeposito)
   se vlrdeposito > 0 entao
      saldo:=saldo+vlrdeposito
      escreval("Depósito realizado com sucesso!")
   senao
      escreval("Você não pode depositar ZERO!")
   fimse
fimprocedimento

procedimento pegaremprestimo
inicio
   se limemp<1 entao
      escreval("Qual o valor do empréstimo?")
      leia(vlremprestimo)
      se vlremprestimo>0 entao
         se saldo>0 entao
            maxemp:=saldo*3
            se vlremprestimo<=maxemp entao
               saldo:=saldo+vlremprestimo
               saldodevedor:=saldodevedor+vlremprestimo
               limemp:=limemp+1
               //PARCELAS --------------------------------
               enquanto parce = 0 faca
                  escreval("Em quantas vezes você quer fazer o valor de ",vlremprestimo," Reais?")
                  leia(vezes)
                  para i de 1 ate vezes faca
                     vlrparcelas:=vlremprestimo/vezes
                     escreval(i," - Parcela: ",vlrparcelas)
                     parcelas[i]:=vlrparcelas
                  fimpara
                  escreval("Confirma? | sim || nao |")
                  leia (opcaoparcela)
                  escolha opcaoparcela
                  caso "sim"
                     parce:=1
                  caso "nao"
                     escreval("Ok..")
                  outrocaso
                     escreval("Opção Inválida")
                  fimescolha
               fimenquanto

               escreval("Empréstimo realizado com sucesso!")
            senao
               escreval("Você só pode realizar um empréstimo de R$",maxemp,".")
            fimse
         senao
            escreval("Negativo não pode pegar empréstimo!")
         fimse
      senao
         escreval("Você não pode pegar ZERO emprestado!")
      fimse
   senao
      escreval("Somente um empréstimo por vez!")
   fimse
fimprocedimento

procedimento pagaremprestimo
inicio
   se saldodevedor>0 entao
      escreval("Você deve: ",saldodevedor," Reais.")
      escreval("Deseja pagar como? | 1 - Valor Desejado | 2 - Parcelado |")
      leia(opcaox)
      escolha opcaox
      caso 1
         escreval("Quanto você deseja pagar?")
         leia(vlrpagamento)
         se vlrpagamento > 0 entao
            se saldo>0 entao
               se vlrpagamento<=saldodevedor entao
                  saldo:=saldo-vlrpagamento
                  saldodevedor:=saldodevedor-vlrpagamento
                  limemp:=limemp-1
                  escreval("Pagamento efetuado com sucesso!")
                  para i de 1 ate 12 faca
                     parcelas[i]:=0
                  fimpara
               senao
                  escreval("Você não deve tanto assim...")
                  escreval("Saldo Devedor: R$",saldodevedor)
               fimse

            senao
               escreval("Seu saldo está negativo!")
            fimse
         senao
            escreval("Você não pode pagar com ZERO!")
         fimse
      caso 2
         escreval("Você tem ",vezes," parcelas de ",vlrparcelas," Reais")
         para i de 1 ate vezes faca
            escreval(i," - Parcela: ",vlrparcelas)
         fimpara
         escreval("Quer pagar quantas parcelas?")
         leia(querpagar)
         se querpagar<=vezes entao
            para i de 1 ate querpagar faca
               saldo:=saldo-vlrparcelas
               saldodevedor:=saldodevedor-vlrparcelas
               parcelas[i]:=0
               x:=x+1
               vezes:=vezes-1
            fimpara
            y:=2
            enquanto (parcelas[1]=0) e (saldodevedor>0) faca
               para i de 1 ate 12 faca

                  aux:=parcelas[i]
                  parcelas[i]:=parcelas[i+1]
                  parcelas[i+1]:=0

               fimpara
            fimenquanto
         senao
            escreval("Não tem tantas parcelas assim!")
         fimse

      outrocaso
         escreval("Opcção Inválida...")
      fimescolha
   senao
      escreval("Você não tem saldo devedor.")
   fimse
fimprocedimento

procedimento parcelasemprestimo
inicio
   se saldodevedor>0 entao
      para i de 1 ate 12 faca
         se parcelas[i]<>0 entao
            escreval(i," - Parcela: ",parcelas[i])
         fimse
      fimpara
   senao
      escreval("Sem saldo devedor!")
   fimse

fimprocedimento


escreval("Qual o saldo inicial?")
leia(saldo)
enquanto sair=0 faca
   escreval("Saldo: R$",saldo)
   escreval("Pressione Enter...")
   leia(enter)
   limpatela
   escreval("")
   escreval("-------------------- BANCO --------------------")
   escreval("-----------------O-O---------OOOOOOO------------")
   escreval("----------------O---O---------O-----------------")
   escreval("---------------O--O--O----------O---------------")
   escreval("--------------O-------O-----------O-------------")
   escreval("-------------O---------O-----OOOOOOO------------")
   escreval("")
   escreval("1 - Saque")
   escreval("2 - Depósito")
   escreval("3 - Empréstimo")
   escreval("4 - Pagar empréstimo")
   escreval("5 - Listar Parcelas Empréstimo")
   escreval("6 - Sair")
   escreval("")
   escreval("------------------ Operação ------------------")
   leia(opcao)
   limpatela
   escolha opcao
   caso 1
      sacar
   caso 2
      depositar
   caso 3
      pegaremprestimo
   caso 4
      pagaremprestimo
   caso 5
      parcelasemprestimo
   caso 6
      ssair
   outrocaso
      escreval("Opção inválida")
   fimescolha

fimenquanto


Fimalgoritmo