String obterLetraDoAlfabeto(int numero) {
  if (numero < 1 || numero > 26) {
    throw Exception('Número deve estar entre 1 e 26.');
  }

  int codigoLetraA = 'A'.codeUnitAt(0);
  int codigoLetra = codigoLetraA + numero - 1;

  return String.fromCharCode(codigoLetra);
}

void main() {
  List<int> numerosAleatorios = [1, 5, 7, 2, 11];

  for (int numero in numerosAleatorios) {
    String letra = obterLetraDoAlfabeto(numero);
    print('Número $numero -> Letra $letra');
  }
}
