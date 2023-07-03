import 'dart:math';

class Pessoa {
  String _nome;
  int _idade;
  double _altura;

  set idade(int valor) {
    if (valor >= 0) {
      _idade = valor;
    }
  }

  int get idade {
    return _idade;
  }

  String get nome {
    return _nome;
  }

  double get altura {
    return _altura;
  }

  Pessoa(this._nome, this._idade, this._altura);
}

void main() {
  final random = Random();
  String nome = "João";
  int idade = random.nextInt(100) + 1;
  double altura = (random.nextDouble() * (2.3 - 1.0)) + 1.0;

  Pessoa pessoa = Pessoa(nome, idade, altura);

  print("Nome: ${pessoa.nome}");
  print("Idade: ${pessoa.idade}");
  print("Altura: ${pessoa.altura}");
}
