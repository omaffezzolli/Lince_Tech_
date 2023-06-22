import 'dart:math';

void main() {
  
  final random = Random();
  
  final lista = List.generate(50, (_) => random.nextInt(15));

  print('Lista original:');
  print(lista);

  lista.removeWhere((num) => num % 2 == 0);

  print('\nLista atualizada:');
  print(lista);
}
