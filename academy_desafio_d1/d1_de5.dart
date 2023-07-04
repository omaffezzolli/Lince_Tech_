import 'dart:math';

void main() {
  List<String> nomes = [
    'Ana', 'Maria', 'Francisco', 'Joao', 'Pedro', 'Gabriel', 'Rafaela',
    'Marcio', 'Jose', 'Carlos', 'Patricia', 'Helena', 'Camila', 'Mateus',
    'Gabriel', 'Samuel', 'Karina', 'Antonio', 'Daniel', 'Joel', 'Cristiana',
    'Sebastiao', 'Paula'
  ];

  List<String> sobrenomes = [
    'Silva', 'Souza', 'Almeida', 'Azevedo', 'Braga', 'Barros', 'Campos',
    'Cardoso', 'Costa', 'Teixeira', 'Santos', 'Rodrigues', 'Ferreira',
    'Alves', 'Pereira', 'Lima', 'Gomes', 'Ribeiro', 'Carvalho', 'Lopes',
    'Barbosa'
  ];

  Random random = Random();

  String nomeCompleto = gerarNomeCompleto(nomes, sobrenomes, random);
  print(nomeCompleto);
}

String gerarNomeCompleto(List<String> nomes, List<String> sobrenomes, Random random) {
  String nome = nomes[random.nextInt(nomes.length)];
  String sobrenome = sobrenomes[random.nextInt(sobrenomes.length)];

  return '$nome $sobrenome';
}
