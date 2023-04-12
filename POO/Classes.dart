import 'dart:io';

class Carro{
  String nome;
  String marca;
  String cor;
  int ano;
  String placa;

  Carro(this.nome,this.marca,this.cor,this.ano,this.placa);

  void isOld(){
    if(ano <= 2000){
      print('É velho!');
    }else{
      print('É novo!');
    }
  }

  void printar(){
    print('Informações do carro:');
    print('-Nome: $nome;');
    print('-Marca: $marca;');
    print('-Cor: $cor;');
    print('-Ano: $ano;');
    print('-Placa: $placa.');
  }
}


void main(){
  String? name,model,color,year,plc;
  name = stdin.readLineSync();
  model = stdin.readLineSync();
  color = stdin.readLineSync();
  year = stdin.readLineSync();
  plc = stdin.readLineSync();
  Carro novo = Carro(name!, model!, color!, int.parse(year!), plc!);
  print('${novo.nome} é um carro da marca ${novo.marca}, ele é ${novo.cor}. Sua placa é ${novo.placa}, sendo do ano de ${novo.ano}.');
  novo.isOld();
  novo.printar();
  
}