import 'dart:collection';
import 'dart:math';

void main() {
  final filaMercado = FilaMercado();

  for (int i = 0; i < 10; i++) {
    final pessoa = Pessoa(NomeGenerator.gerarNomeAleatorio());
    filaMercado.entrarNaFila(pessoa);
  }

  while (filaMercado.tamanho > 0) {
    final pessoaAtendida = filaMercado.atender();
    print('${pessoaAtendida.nome} foi atendido(a)');
  }
}

class FilaMercado {
  final Queue<Pessoa> fila = Queue<Pessoa>();

  void entrarNaFila(Pessoa pessoa) {
    fila.add(pessoa);
    print('${pessoa.nome} entrou na fila');
  }

  Pessoa atender() {
    return fila.removeFirst();
  }

  int get tamanho => fila.length;
}

class Pessoa {
  final String nome;

  Pessoa(this.nome);
}

class NomeGenerator {
  static final Random _random = Random();
  static final List<String> _nomes = [
    'João',
    'Maria',
    'Pedro',
    'Ana',
    'Carlos',
    'Mariana',
    'José',
    'Fernanda',
    'Rafael',
    'Laura',
  ];
  static final List<String> _sobrenomes = [
    'Silva',
    'Santos',
    'Souza',
    'Pereira',
    'Oliveira',
    'Almeida',
    'Lima',
    'Costa',
    'Ferreira',
    'Gomes',
  ];

  static String gerarNomeAleatorio() {
    final nomeAleatorio = _nomes[_random.nextInt(_nomes.length)];
    final sobrenomeAleatorio = _sobrenomes[_random.nextInt(_sobrenomes.length)];
    return '$nomeAleatorio $sobrenomeAleatorio';
  }
}
