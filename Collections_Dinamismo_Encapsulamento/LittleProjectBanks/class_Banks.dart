//Classe Bank utilizada nas operações do main.dart

import 'exceptions.dart';

class Banks{
  String nomeBanco;
  Map<String,double>  _cliente_saldo = {};
  Map<String,String>  _cliente_extrato = {};
  
  Banks({required this.nomeBanco});

  bool isContain(String nome){
    return _cliente_saldo.containsKey(nome);
  }

  void adicionarCliente(String cliente, double saldo){
    if(_cliente_saldo.containsKey(cliente)){
      print("Erro ao adicionar cliente. Cliente já adicionado anteriormente");
      if(saldo < 0){
        throw NegativeBalanceException(valor: saldo);
      }
    }else{
      if(saldo < 0){
        throw NegativeBalanceException(valor: saldo);
      }
      _cliente_saldo[cliente] = saldo;
      _cliente_extrato[cliente] = "Cliente $cliente adicionado no sistema do banco $nomeBanco com saldo inicial de $saldo reais; ";
      print("Cliente adicionado com sucesso.");
    }
  }

  double? checarSaldo(String cliente){
    if(_cliente_saldo[cliente] != null){
      return _cliente_saldo[cliente];
    }else {
      return 0.0;
    }
  }

  void depositar(String cliente, double quantia){
    if(quantia < 0){
        throw NegativeBalanceException(valor: quantia);
    }
    if(_cliente_saldo.containsKey(cliente)){
      double? soma = _cliente_saldo[cliente];
      soma != null ? _cliente_saldo[cliente] = soma + quantia : _cliente_saldo[cliente] = quantia;
      String? anterior = _cliente_extrato[cliente]!;
      _cliente_extrato[cliente] = anterior + "Depositou $quantia reais; ";
    }else{
      print("Erro ao realizar depósito. Cliente não encontrado");
    }
  }

  void sacar(String cliente, double quantia){
    if(_cliente_saldo.containsKey(cliente)){
      if(quantia < 0){
        throw NegativeBalanceException(valor: quantia);
      }
      double? saldo = _cliente_saldo[cliente];
      if(saldo == null || quantia > saldo){
        saldo == null ? saldo = 0 : saldo = saldo;
        throw InsuficentBalanceException(tentativa: quantia, saldo: saldo);
      }else{
        _cliente_saldo[cliente] = saldo - quantia;
        String? anterior = _cliente_extrato[cliente]!;
        _cliente_extrato[cliente] = anterior + "Sacou $quantia reais; ";
      }
    }else{
      print("Erro ao realizar o saque. Cliente não encontrado");
    }
  }

  String verExtrato(String cliente){
    return _cliente_extrato[cliente]!;
  }

  void transferir(String remetente, double valor, String destino){
    if(valor < 0){
      throw NegativeBalanceException(valor: valor);
    }
    double? saldo = _cliente_saldo[remetente];
    if(saldo == null || valor > saldo){
      saldo == null ? saldo = 0 : saldo = saldo;
      throw InsuficentBalanceException(tentativa: valor, saldo: saldo);
    }
    _cliente_saldo[remetente] = saldo - valor;
    String? anterior = _cliente_extrato[remetente]!;
    _cliente_extrato[remetente] = anterior + "Transferiu $valor reais para $destino; ";
    saldo = _cliente_saldo[destino];
    saldo == null ? saldo = 0 : saldo = saldo;
    _cliente_saldo[destino] = saldo + valor;
    anterior = _cliente_extrato[destino]!;
    _cliente_extrato[destino] = anterior + "Recebeu uma transferência de $remetente no valor de $valor reais; ";
  }
  
  void removerCliente(String cliente){
    _cliente_saldo.remove(cliente);
    _cliente_extrato.remove(cliente);
  }

  Map<String,double> get verClientes{
    if(_cliente_saldo == {}){
      print("Não há clientes");
    }
    return _cliente_saldo;
  }
}
