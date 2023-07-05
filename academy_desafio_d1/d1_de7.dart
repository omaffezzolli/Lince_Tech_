void main() {
  List<int> numeros = [3, 17, 23, 49, 328, 1358, 21, 429, 12, 103, 20021];

  int somaFor = calcularSomaFor(numeros);
  print("for: $somaFor");

  int somaWhile = calcularSomaWhile(numeros);
  print("while: $somaWhile");

  int somaRecursiva = calcularSomaRecursiva(numeros);
  print("recursao: $somaRecursiva");

  int somaLista = calcularSomaLista(numeros);
  print("lista: $somaLista");
}

int calcularSomaFor(List<int> numeros) {
  int soma = 0;

  for (int numero in numeros) {
    soma += numero;
  }

  return soma;
}

int calcularSomaWhile(List<int> numeros) {
  int soma = 0;
  int indice = 0;

  while (indice < numeros.length) {
    soma += numeros[indice];
    indice++;
  }

  return soma;
}

int calcularSomaRecursiva(List<int> numeros, {int indice = 0, int soma = 0}) {
  if (indice >= numeros.length) {
    return soma;
  }

  soma += numeros[indice];
  return calcularSomaRecursiva(numeros, indice: indice + 1, soma: soma);
}

int calcularSomaLista(List<int> numeros) {
  return numeros.reduce((valorAnterior, valorAtual) => valorAnterior + valorAtual);
}

