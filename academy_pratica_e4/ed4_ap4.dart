int calcularPercentualDesconto(int valorOriginal, int valorComDesconto) {
  return ((valorOriginal - valorComDesconto) * 100 ~/ valorOriginal);
}

void main() {
  int valorOriginal = 10;
  int valorComDesconto = 7;

  int percentualDesconto = calcularPercentualDesconto(valorOriginal, valorComDesconto);

  print('O produto custava $valorOriginal reais e foi vendido por $valorComDesconto reais.');
  print('O desconto dado foi $percentualDesconto%.');
}
