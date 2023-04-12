// programa bem incompleto, voltarei nele quando entender um pouco mais sobre listas de classes/objetos

import 'dart:io';

void main(){
  Transporte.imprimirTipos();
  String? opcao;
  menu();
  Set <Caminhao> terrestre = <Caminhao>{}; 
  String? modelo;
  String? marca;
  String? cor;
  String? placa;
  int? ano;
  double? distKm;
  double? cargaMax;
  double? comprimento;
  opcao = stdin.readLineSync();
  while(opcao != 'e'){
    switch(opcao){
      case 'a':
        print("Adicione os dados do veículo:");
        print("-Nome(modelo): ");
        modelo = stdin.readLineSync();
        print("-Marca: ");
        marca = stdin.readLineSync();
        print("-Cor: ");
        cor = stdin.readLineSync();
        print("-Ano de fabricação: ");
        opcao = stdin.readLineSync();
        ano = int.parse(opcao!);
        print("-Placa: ");
        placa = stdin.readLineSync();
        print("-Kms rodados: ");
        opcao = stdin.readLineSync();
        distKm = double.parse(opcao!);
        print("-Carga máxima suportada: ");
        opcao = stdin.readLineSync();
        cargaMax = double.parse(opcao!);
        print("-Comprimento: ");
        opcao = stdin.readLineSync();
        comprimento = double.parse(opcao!);
        Caminhao novo = Caminhao(modelo!, marca!, ano, 'Terrestre', distKm, cor!, placa!, true, cargaMax, comprimento);
        terrestre.add(novo);
      break;
      case 'c':
    
      break;
      case 'i':
      
      break;
      case 'p':

      break;
    }
    menu();
    opcao = stdin.readLineSync();
  }
}

class Veiculo{
  String modelo;
  String marca;
  int anoFabricacao;
  String tipo;
  double distKm;

  Veiculo(this.modelo,this.marca,this.anoFabricacao,this.tipo,this.distKm);

  int funcIdade(int year){
    return year - anoFabricacao;
  }
  void printar(){
    print("Modelo: $modelo");
    print("Marca: $marca");
    print("Ano de Fabricação: $anoFabricacao");
    print("Tipo: $tipo");
    print("Distãncia percorrida em kms: $distKm");
  }
}

class Terrestre extends Veiculo{
  String cor;
  String placa;
  bool isLegal;

  Terrestre(String modelo,String marca,int anoFabricacao,String tipo,double distKm,this.cor,this.placa,this.isLegal):super(modelo,marca,anoFabricacao,tipo,distKm);

  void funcSituacao(){
    if(isLegal){
      print("legalizado");
    }else{
      print("ilegal, necessário verificação");
    }
  }
}

class Aereo extends Veiculo{
  int capacidade;
  double horasVoo;
  String empresa;
  double tempoDesdeManutencao;
  String privadoParticular;

  Aereo(String modelo,String marca,int anoFabricacao,String tipo,double distKm,this.capacidade,this.horasVoo,this.empresa,this.tempoDesdeManutencao,this.privadoParticular):super(modelo,marca,anoFabricacao,tipo,distKm);

}

class Maritimo extends Veiculo{
  double tamanho;
  String cidadeOrigem;
  double profundidadeMedia;

  Maritimo(super.modelo,super.marca,super.anoFabricacao,super.tipo,super.distKm,this.tamanho,this.cidadeOrigem,this.profundidadeMedia);

}

class Caminhao extends Terrestre{
  double cargaMax;
  double comprimento;

  Caminhao(String modelo,String marca,int anoFabricacao,String tipo,double distKm,String cor,String placa,bool isLegal,this.cargaMax,this.comprimento):super(modelo,marca,anoFabricacao,tipo,distKm,cor,placa,isLegal);
}

class Navio extends Maritimo{
  String tipoOperacao;

  Navio(String modelo,String marca,int anoFabricacao,String tipo,double distKm,double tamanho,String cidadeOrigem,double profundidadeMedia,this.tipoOperacao):super(modelo,marca,anoFabricacao,tipo,distKm,tamanho,cidadeOrigem,profundidadeMedia);

}

void menu(){
  print("Selecione a operação a ser realizada:");
  print("(a) - adicionar veículo");
  print("(c) - checar a situação legal");
  print("(i) - verificar idade do veículo");
  print("(p) - imprimir informações básicas do veículo");
  print("(e) - encerrar");
}

enum Transporte{
  terrestre,aereo,maritmo;

  static void imprimirTipos(){
    print("Existem transportes terrestres, aéreos e maritmos.");
  }
}