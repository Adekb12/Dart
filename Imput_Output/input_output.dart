import 'dart:io';//importaar biblioteca de imput/output

void main(){
  int idade = 18;
  print(18);
  print("Minha idade é " + idade.toString());
  print("I am ${idade + 1} years old");

  //stdin.readLineSync() sempre retorna um texto
  String? input = stdin.readLineSync();
  // a interrogação é necessária por causa do nullsafety
  if(input != null){
    double altura = double.parse(input);
    print("Minha altura é $altura.");
  }
  // podemos também utilizar a exclamação
  double alto = double.parse(input!);
  print("O prédio tem ${alto*10}m de altua.");

}