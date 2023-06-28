int somarNumerosPares(int numero) {
  int soma = 0;

  for (int i = 0; i <= numero; i += 2) {
    soma += i;
  }

  return soma;
}

void main() {
  // Gerando um número aleatório entre 100 e 1000
  int numeroAleatorio = 100 + DateTime.now().millisecondsSinceEpoch % 901;

  int somaPares = somarNumerosPares(numeroAleatorio);

  print('A soma dos números pares entre 0 e $numeroAleatorio é $somaPares.');
}
