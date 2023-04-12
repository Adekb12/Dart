import 'dart:io';
void main(){

    //NULL Safety ----------

    /*String? testa;
    testa = "paparamericanas";
    print(testa);
    testa = null;*/

    /*late String testa2;
    testa2 = "é isso aí meu!";
    print(testa2);*/

    //-----------------------
    /*print(testa.runtimeType);
    listadenomes.insert(1, "Erasmo");
    print('${listadenomes[0]} -- ${listadenomes[1]} -- ${listadenomes[2]}');*/

    /// entrada de dados
    //String? numero = stdin.readLineSync();
    //int number = int.parse(numero!);
    //print(number + 10);

    ///Comentário de Documentação
    
    //double exp = 7.74e9;
    //print(exp);

    List<dynamic> GFT = ['Gabriel Furtado Teixeira',18,1.80,'Adekb12'];
    String texto = 'Nos jogos eu uso ${GFT[3]}, mas meu nome é ${GFT[0]}. Tenho ${GFT[1]} anos e ${GFT[2]}m de altura';
    print(texto);

    //contains verifica se a lista contém o elemento
    print(GFT.contains('Gabriel Furtado Teixeira'));

    List<int> numbers = [4,6,8,1,3,7,9,-44,0,-5,56,41];
    numbers.sort((a,b) => a - b);
    print(numbers);
    print(numbers.take(7));
    print(numbers.skip(7));
    print(numbers.skip(3).take(4).skip(2));

    String linha = GFT.reduce((value, element){
      return value + ' ' + element.toString();
    });
    print(linha);
        
    GFT.add('Vish_kk');
    GFT.remove('Adekb12');
    print(GFT);

    List<int> sublist = numbers.sublist(3,8);
    print(sublist);

    Iterable maior = numbers.where((element) => element > 4);
    print(maior); // or print(maior.toList())
    List<int> maiores = numbers.where((element) => element < 4).toList();
    print(maiores);
    
    numbers.add(100);
    numbers.remove(0);
    print(numbers);

    GFT.forEach((element) {
      print(element);
    });

    
}