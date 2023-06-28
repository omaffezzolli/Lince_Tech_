List<int> obterNumerosImpares(int valorMaximo) {
  List<int> numerosImpares = [];

  for (int i = 1; i <= valorMaximo; i += 2) {
    numerosImpares.add(i);
  }

  return numerosImpares;
}

void main() {
  int valorFornecido = 9;
  List<int> numerosImpares = obterNumerosImpares(valorFornecido);

  for (int numero in numerosImpares) {
    print('Impar: $numero');
  }
}
