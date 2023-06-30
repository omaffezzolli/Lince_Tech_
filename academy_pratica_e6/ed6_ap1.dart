void main() {
  String userInput = '9999';
  convertStringToInt(userInput);
}
void convertStringToInt(String input) {
  try {
    int number = int.parse(input);
    print('Número digitado: $number');
  } catch (e) {
    print('Entrada inválida. Insira apenas números inteiros.');
  }
}