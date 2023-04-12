// No dart há 4 tipos de parâmetros para as funções. Sendo eles:
// os Posicionais Obrigatórios, os Nomeados Opcionais, os com "Padrão" e os modificadores "required"

void funcIsCool(String nome,bool legal){
  if(legal){
    print("$nome é gente boa!");
  }else{
    print("$nome é gente boa!");
  }
}

//necessita-se do ? no nomeado por causa do nullsafety
void funcIsMaiorIdade(String nome,int idade,{ bool ?legal,double ?alt}){
  if(idade >= 18){
    print("$nome é maior de idade");
  }else{
    print("$nome não é maior de idade");
  }
  if(alt != null){
    print("e tem $alt de altura");
  }
  if(legal != null){
    funcIsCool(nome, legal);
  }
}

//
void funcX(String nome,int idade,{String sex = "indefinido"}){
  if(idade >= 18){
    print("$nome é maior de idade e é do sexo $sex");
  }else{
    print("$nome não é maior de idade e é do sexo $sex");
  }

}

void main(){
  String nome = "Gabriel";
  int idade = 18;
  double altura = 1.79;
  String sexo = "masculino";
  bool isGenteBoa = true;


// - Parâmetros Posicionais Obrigatórios: 
  funcIsCool(nome, isGenteBoa);
// Logo, todos os argumentos devem ser passados e suas posições precisam ser as mesmas correspontes aos parâmetros


// - Parâmetros Nomeados Opcionais:
  funcIsMaiorIdade(nome, idade, alt: altura);//ou funcIsMaiorIdade(nome, idade);
// Nesse caso, o argumento correspondente ao parâmetro nomeado é opcional, ou seja, mesmo que ele não exista não ocorrerá erro. Além disso, nesses argumentos a posição não importa


// - Parâmetros com "Padrão":
  funcX(nome,idade,sex: sexo); // ou funcX(nome,idade);
// Nesse tipo, caso o argumento correspondente ao parâmetro nomeado não existir, o parâmetro valerá o valor padrão definido na função, nesse caso, "indefinido"


// - Modificador "required":
// Ao colocarmos o "required" no parâmetro nomeado da função, tornamos ele um parâmtro obrigatório
//void funcX(String nome,int idade,{ required String sex}){
// if(idade >= 18){
//   print("$nome é maior de idade e é do sexo $sex");
// }else{
//   print("$nome não é maior de idade e é do sexo $sex");
// }
//}


}