void main() {
  int userInput = 10;
  validateEvenNumber(userInput);
}

void validateEvenNumber(int number) {
  try {
    if (number % 2 != 0) {
      throw Exception('Entrada inválida. Insira apenas números pares.');
    }
    print('Entrada correta, você inseriu um número par.');
  } catch (e) {
    print('Exception: $e');
  }
}