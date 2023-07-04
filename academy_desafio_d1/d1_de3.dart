void main() {
  String paragrafo =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam venenatis nunc et posuere vehicula. Mauris lobortis quam id lacinia porttitor.';

  print('Parágrafo: $paragrafo');

  List<String> palavras = paragrafo.split(' ');
  int numPalavras = palavras.length;
  print('Número de palavras: $numPalavras');

  int tamanhoTexto = paragrafo.length;
  print('Tamanho do texto: $tamanhoTexto');

  List<String> frases = paragrafo.split('. ');
  int numFrases = frases.length;
  print('Número de frases: $numFrases');

  int numVogais = contarVogais(paragrafo);
  print('Número de vogais: $numVogais');

  List<String> consoantes = encontrarConsoantes(paragrafo);
  print('Consoantes encontradas: ${consoantes.join(', ')}');
}

int contarVogais(String texto) {
  int numVogais = 0;
  for (int i = 0; i < texto.length; i++) {
    String caractere = texto[i].toLowerCase();
    if (caractere == 'a' ||
        caractere == 'e' ||
        caractere == 'i' ||
        caractere == 'o' ||
        caractere == 'u') {
      numVogais++;
    }
  }
  return numVogais;
}

List<String> encontrarConsoantes(String texto) {
  List<String> consoantes = [];
  for (int i = 0; i < texto.length; i++) {
    String caractere = texto[i].toLowerCase();
    if (caractere != ' ' &&
        !isVogal(caractere) &&
        !consoantes.contains(caractere)) {
      consoantes.add(caractere);
    }
  }
  return consoantes;
}

bool isVogal(String caractere) {
  return caractere == 'a' ||
      caractere == 'e' ||
      caractere == 'i' ||
      caractere == 'o' ||
      caractere == 'u';
}
