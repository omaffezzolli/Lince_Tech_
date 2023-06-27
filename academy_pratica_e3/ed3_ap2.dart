import 'dart:math';

void main() {
  print('Resultado A(B): ${A(B)}');
  print('Resultado A(C): ${A(C)}');
}

int A(Function(int) funcao) {
  int resultado1 = funcao(gerarNumeroAleatorio());
  int resultado2 = funcao(gerarNumeroAleatorio());

  return resultado1 + resultado2;
}

int B(int numero) {
  return numero - 10;
}

int C(int numero) {
  return numero * 2;
}

int gerarNumeroAleatorio() {
  Random random = Random();
  return random.nextInt(101);
}
