void main() {
  Map<String, int?> pessoas = {
    'Nelson': null,
    'Jane': null,
    'Jack': 16,
    'Rupert': 37,
    'Andy': 13,
    'Kim': 27,
    'Robert': 31,
  };

  pessoas.forEach((nome, idade) {
    String mensagem = (idade != null) ? '$nome - $idade' : '$nome - idade não informada';
    print(mensagem);
  });
}
