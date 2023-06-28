import 'dart:math';

void main() {
  final random = Random();
  final opcao = random.nextInt(6);

  switch (opcao) {
    case 0:
      print('Opcao invalida');
      return;
    case 1:
      print('Encontrado 1');
      return;
    case 2:
      print('Encontrado 2');
      return;
    case 3:
      print('Encontrado 3');
      return;
    case 4:
      print('Encontrado 4');
      return;
    case 5:
      print('Encontrado final');
      return;
    default:
      print('Opcao invalida');
  }
}
