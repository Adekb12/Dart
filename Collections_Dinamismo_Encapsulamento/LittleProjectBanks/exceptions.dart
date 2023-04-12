class NegativeBalanceException implements Exception{
  static const String report = "Não é possível realizar operações com saldo negativo.";
  double valor;
  NegativeBalanceException({required this.valor});

  @override
  String toString(){
    return report;
  }
}

class InsuficentBalanceException implements Exception{
  static const String report = "Saldo insuficiente para realizar operação";
  double saldo;
  double tentativa;

  InsuficentBalanceException({required this.tentativa, required this.saldo});

  @override
  String toString(){
    return report;
  }
}