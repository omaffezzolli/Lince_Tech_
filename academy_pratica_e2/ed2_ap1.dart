import 'dart:math';

void main() {
  
  final random = Random();
  
  List <int> lista = [];
  
  for(int i = 0; i < 10; i++){
    int numero = 1 + random.nextInt(100);
    lista.add(numero); 
  }
  for(int i = 0; i < lista.length; i++){
    int numero = lista[i];
    int posicao = i +0;
    print("Posição: $posicao , Valor: $numero ");
    
  }
    // ...
}