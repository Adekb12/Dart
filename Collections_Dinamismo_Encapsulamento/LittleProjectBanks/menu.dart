//menus para o switch do Main.dart
menu() {
  print(""); //opcional
  print(
      "Bem vindo ao sistema do banco, escolha abaixo uma operação a ser realizada: ");
  print("(a) - adicionar clinente e saldo bancário");
  print("(c) - checar o saldo do cliente");
  print("(d) - depositar quantia");
  print("(s) - sacar quantia");
  print("(e) - ver o extrato bancário");
  print("(t) - fazer transferência");
  print("(m) - mostrar todos os clientes adicionado e seus respectivos saldos");
  print("(r) - remover cliente");
  print("(f) - encerrar");
  final day = DateTime.now();
  print("|${day.day}/${day.month}/${day.year}|");
  print("Horário Local: ${day.hour}:${day.minute}:${day.second}");
  print("Digite a operação desejada: ");
}
