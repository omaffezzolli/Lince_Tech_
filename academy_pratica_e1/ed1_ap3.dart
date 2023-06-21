import 'dart:math';

void main() {
  final random = Random();
  
  int numero1 = 1 + random.nextInt(100);
  int numero2 = 1 + random.nextInt(100);
  
  print('Valores originais:');
  print('Número 1: $numero1');
  print('Número 2: $numero2');
  
  final temp = numero1;
  numero1 = numero2;
  numero2 = temp;
  
  print('\nValores invertidos:');
  print('Número 1: $numero1');
  print('Número 2: $numero2');
}
