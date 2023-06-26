import 'dart:math';

void main() {
  List<int> numeros = gerarListaNumeros();

  imprimirNumerosConvertidos(numeros);
}

List<int> gerarListaNumeros() {
  Random random = Random();
  List<int> numeros = [];

  for (int i = 0; i < 15; i++) {
    numeros.add(random.nextInt(5000) + 1);
  }

  return numeros;
}

void imprimirNumerosConvertidos(List<int> numeros) {
  numeros.sort();

  for (int numero in numeros) {
    print('decimal: $numero, binário: ${decimalParaBinario(numero)}, octal: ${decimalParaOctal(numero)}, hexadecimal: ${decimalParaHexadecimal(numero)}');
  }
}

String decimalParaBinario(int numero) {
  return numero.toRadixString(2);
}

String decimalParaOctal(int numero) {
  return numero.toRadixString(8);
}

String decimalParaHexadecimal(int numero) {
  return numero.toRadixString(16);
}
