// Micro projeto para entender mais sobre o funcionamento de Map, Set e Get, além da separação de arwuivos
// Arquivo com o main, importanto o menu de menu.dart e classe Banks de class_Banco.dart

import 'dart:async';
import 'dart:io';
import 'class_Banks.dart';
import 'class_BotClock.dart';
import 'exceptions.dart';
import 'menu.dart';

void main() async{
  Banks BrazilBank = Banks(nomeBanco: "Brazil_Banks");
  String? opcao;
  String? nome;
  String? nome2;
  String? valor;
  print("Inicializando o sistema, aguarde...");
  var timeWorkingStream = BotClock().timeWorking(interval: 1);
  StreamSubscription watchStream = timeWorkingStream.listen((event) {
    print('                                         Tempo de funcionamento: $event segundos');
  },onError: (e){
    print('Um erro aconteceu na stream: $e');
  });
  await BotClock().clock(seconds: 2);
  menu();
  opcao = stdin.readLineSync();
  while (opcao != 'f') {
    switch (opcao) {
      case 'a':
        print("Digite o nome do novo cliente:");
        nome = stdin.readLineSync();
        while (nome == '') {
          print("Por favor digite um nome válido:");
          nome = stdin.readLineSync();
        }
        print("Digite o saldo que será inicializado na conta:");
        valor = stdin.readLineSync();
        if (nome == null || valor == null) {
          print("Erro! ... tentativa de operar com valor(es) nulo(s).");
          break;
        }
        try {
          await BotClock().clock();
          BrazilBank.adicionarCliente(nome, double.parse(valor));
        } on FormatException catch (e) {
          await BotClock().clock(seconds: 2);
          print(e.message);
          print("Saldo inválido, cliente não adicionado");
        } on NegativeBalanceException catch (e) {
          await BotClock().clock(seconds: 2);
          print("${e.valor} não é um saldo válido!");
          print(e);
        }
        break;
      case 'c':
        print("Nome do cliente:");
        nome = stdin.readLineSync();
        await BotClock().clock(seconds: 2);
        if (nome == null) {
          print("Erro! ... tentativa de operar com valor(es) nulo(s).");
        } else if (BrazilBank.isContain(nome)) {
          print("Saldo atual de ${BrazilBank.checarSaldo(nome)} reais.");
        } else {
          print("Cliente não encontrado!");
        }
        break;
      case 'd':
        print("Nome do cliente:");
        nome = stdin.readLineSync();
        print("Quantia que deseja depositar:");
        valor = stdin.readLineSync();
        await BotClock().clock();
        if (nome == null || valor == null) {
          print("Erro! ... tentativa de operar com valor(es) nulo(s).");
          break;
        }
        try {
          BrazilBank.depositar(nome, double.parse(valor));
        } on FormatException catch (e) {
          print(e.message);
          print("Quantia inválida!");
        } on NegativeBalanceException catch (e) {
          print(("${e.valor} não é uma quantia válida!"));
          print(e);
        }
        break;
      case 's':
        print("Nome do cliente:");
        nome = stdin.readLineSync();
        print("Quantia que deseja sacar:");
        valor = stdin.readLineSync();
        await BotClock().clock();
        if (nome == null || valor == null) {
          print("Erro! ... tentativa de operar com valor(es) nulo(s).");
          break;
        }
        try {
          BrazilBank.sacar(nome, double.parse(valor));
        } on FormatException catch (e) {
          print(e.message);
          print("Quantia inválida!");
        } on NegativeBalanceException catch (e) {
          print(("${e.valor} não é uma quantia válida!"));
          print(e);
        } on InsuficentBalanceException catch (e) {
          print("Saldo na conta de $nome: ${e.saldo} reais");
          print("Valor requisitado para esta operação: ${e.tentativa} reais");
          print(e);
        }
        break;
      case 'e':
        print("Nome do cliente:");
        nome = stdin.readLineSync();
        await BotClock().clock(seconds: 2);
        if (nome == null) {
          print("Erro! ... tentativa de operar com valor(es) nulo(s).");
        } else if (BrazilBank.isContain(nome)) {
          print(BrazilBank.verExtrato(nome));
        } else {
          print("Cliente não encontrado");
        }
        break;
      case 't':
        print("Nome do remetente:");
        nome = stdin.readLineSync();
        if (nome == null) {
          print("Erro! ... tentativa de operar com valor(es) nulo(s).");
        } else if (BrazilBank.isContain(nome)) {
          print("Quantia a ser transferida:");
          valor = stdin.readLineSync();
          try {
            print("Nome do destinatário:");
            nome2 = stdin.readLineSync();
            if (nome2 == null || valor == null) {
              print("Erro! ... tentativa de operar com valor(es) nulo(s).");
              break;
            }
            if (BrazilBank.isContain(nome2)) {
              await BotClock().clock();
              if (nome == nome2) {
                print(
                    "Não é possível realizar uma transferência para si mesmo.");
              } else {
                BrazilBank.transferir(nome, double.parse(valor), nome2);
                print("Transferência concluída!");
              }
            } else {
              print("Destinatário não encontrado!");
            }
          } on FormatException catch (e) {
            print(e.message);
            print("Quantia inválida!");
          } on NegativeBalanceException catch (e) {
            print(("${e.valor} não é uma quantia válida!"));
            print(e);
          } on InsuficentBalanceException catch (e) {
            print("Saldo na conta de $nome: ${e.saldo} reais");
            print("Valor requisitado para esta operação: ${e.tentativa} reais");
            print(e);
          }
        } else {
          print("Cliente não encontrado!");
        }
        break;
      case 'r':
        print("Nome do cliente:");
        nome = stdin.readLineSync();
        await BotClock().clock();
        if (nome == null) {
          print("Erro! ... tentativa de operar com valor(es) nulo(s).");
        } else if (BrazilBank.isContain(nome)) {
          print("Digite 'CONFIRMAR' para remover cliente $nome:");
          nome2 = stdin.readLineSync();
          if (nome2 == 'CONFIRMAR') {
            await BotClock().clock();
            BrazilBank.removerCliente(nome);
            print(
                "Remoção de $nome do banco ${BrazilBank.nomeBanco} concluída com sucesso.");
          } else {
            print("Remoção de $nome interrompida!");
          }
        } else {
          print("Cliente não encontrado!");
        }
        break;
      case 'm':
        print(BrazilBank.verClientes);
        break;
      default:
        print("Operação inválida!!");
        break;
    }
    menu();
    opcao = stdin.readLineSync();
  }
  watchStream.cancel();
  print("Obrigado por utilizar nosso sistema");
  print("Encerrando...");
  await BotClock().clock(seconds: 2);
}
