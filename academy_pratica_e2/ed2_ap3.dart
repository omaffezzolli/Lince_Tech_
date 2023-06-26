import 'dart:math';

void main() {
  
  final random = Random();
  
  final lista = List.generate(50, (_) => random.nextInt(11) + 10);

  print("Lista gerada:");
  print(lista);

  List<int> valoresUnicos = lista.toSet().toList();

  print("\nValores únicos:");
  print(valoresUnicos);
}
