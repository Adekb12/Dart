//esse é um projeto que eu peguei da Alura pra dar um estudada. Modifiquei e adicionei algumas coisas

void main() {
  String nome = "Laranja";
  double peso = 100.2;
  String cor = "Verde e Amarela";
  String sabor = "Doce e cítrica";
  int diasDesdeColheita = 40;
  bool? isMadura;

  if (diasDesdeColheita >= 30) {
    isMadura = true;
  } else {
    isMadura = false;
  }

  Citricas Limao = Citricas('Limão',50,'verde',6,7.8);

  Limao.separarIngredientes();
  Limao.fazerMassa();
  Limao.assar();
}

bool funcEstaMadura(int dias) {
  if (dias >= 30) {
    return true;
  } else {
    return false;
  }
}

mostrarMadura(String nome, int dias, {required String cor}) {
  if (dias >= 30) {
    print("A $nome está madura.");
  } else {
    print("A $nome não está madura.");
  }

  print("A $nome é $cor.");
}

int funcQuantosDiasMadura(int dias) {
  int diasParaMadura = 30;
  int quantosDiasFaltam = diasParaMadura - dias;
  return quantosDiasFaltam;
}

abstract class Bolo {
  void separarIngredientes();
  void fazerMassa();
  void assar();
}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  void printAlimento() {
    print("Este/a $nome pesa $peso gramas e é $cor.");
  }
}

class Fruta extends Alimento implements Bolo {
  int diaDesdeColheita;
  bool? isMadura;

  Fruta(String nome, double peso, String cor, this.diaDesdeColheita,
      {this.isMadura})
      : super(nome, peso, cor);

  void fazerSuco() {
    print("Você fez um belo suco de $nome");
  }

  @override
  void separarIngredientes() {
    print("Separar a quantidade necessária de $nome para fazer o bolo");
  }

  @override
  void fazerMassa() {
    print("Adicionar os outros ingredientes junto com a(o) $nome numa vasília e então misture e misture...");
  }

  @override
  void assar() {
    print("Colocar a massa numa forma e por no forno!");
  }
}

class Legume extends Alimento implements Bolo {
  bool isPrecisaCozinhar;

  Legume(String nome, double peso, String cor, this.isPrecisaCozinhar)
      : super(nome, peso, cor);

  void cozinhar() {
    (isPrecisaCozinhar)
        ? print("Pronto, o $nome está cozinhado!")
        : print("Nem precisou cozinhar");
  }
  
  @override
  void separarIngredientes() {
     print("Separe a quantidade necessária; Lave bem o $nome para depois picar");
  }

  @override
  void fazerMassa() {
    print("Adicionar os outros ingredientes junto com a(o) $nome numa vasília e então misture e misture...");
  }

  @override
  void assar() {
    print("Colocar a massa numa forma e por no forno!");
  }
}

class Citricas extends Fruta {
  double nivelAzedo;

  Citricas(String nome, double peso, String cor, int diaDesdeColheita,
      this.nivelAzedo)
      : super(nome, peso, cor, diaDesdeColheita);

  void existeRefri(bool existe) {
    (existe)
        ? print("Existe refri de $nome")
        : print("Não existe refri de $nome");
  }

  @override
  void separarIngredientes(){
    super.separarIngredientes();
    print("Antes de mecher com a massa retirar as sementes e a casca");
  }
}

class Nozes extends Fruta {
  double porcentagemOleoNatural;

  Nozes(String nome, double peso, String cor, int diaDesdeColheita,
      this.porcentagemOleoNatural)
      : super(nome, peso, cor, diaDesdeColheita);

  @override
  void fazerMassa() {
    print("Tirar a casca");
    super.fazerMassa();
  }
}