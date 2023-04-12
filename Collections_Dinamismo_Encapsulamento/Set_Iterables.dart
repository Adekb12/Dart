//Nota: parece que estou fazer coisas nesse código que ainda são muito avançadas para o que sei

import 'dart:io';

void main(){
  Transporte.imprimirTipos();
  String? opcao;
  String? menus;
  String? menus2;
  menu();
  opcao = stdin.readLineSync();
  while(opcao != 'e'){
    switch(opcao){
      case 'a':
        menuAdicionar(0);
        menus = stdin.readLineSync();
        switch(menus){
          case '1':
            menuAdicionar(1);
            menus2 = stdin.readLineSync();
            switch(menus2){
              case '4':break;
              case '5':break;
              case '6':break;
            }
          break;  
          case '2':
            menuAdicionar(2);
            menus2 = stdin.readLineSync();
            switch(menus2){
              case '4':break;
              case '5':break;
              case '6':break;
            }
          break;
          case '3':
            menuAdicionar(3);
            menus2 = stdin.readLineSync();
            switch(menus2){
              case '4':break;
              case '5':break;
              case '6':break;
            }
          break;
          default:
            print("Opção inválida");
          break;
        }
      break;
      case 'c':
    
      break;
      case 'i':
      
      break;
      case 'p':

      break;
      default:
        print("Opção inválida");
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

void menuAdicionar(int escolheMenu){
  if(escolheMenu == 0){
    print("Escolha o tipo de veículo:");
    print("(1) - Terrestre");
    print("(2) - Aéreo");
    print("(3) - Marítmo");
  }else if(escolheMenu == 1){
    print("Escolha um dos tipos de veículo terrestre:");
    print("(4) - Caminhão");
    print("(5) - Carro");
    print("(6) - Moto");
  }else if(escolheMenu == 2){
    print("Escolha um dos tipos de veículo aéreo:");
    print("(4) - Avião");
    print("(5) - Helicóptero");
    print("(6) - Balão");
  }else if(escolheMenu == 3){
    print("Escolha um dos tipos de veículo marítmo:");
    print("(4) - Navio");
    print("(5) - Barco");
    print("(6) - Lancha");
  }
}

enum Transporte{
  terrestre,aereo,maritmo;

  static void imprimirTipos(){
    print("Existem transportes terrestres, aéreos e maritmos.");
  }
}
