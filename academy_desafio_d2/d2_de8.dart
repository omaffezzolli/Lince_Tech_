import 'dart:math';

void main() {
  final album = Album();
  final figurasRepetidas = <Figura>[];

  while (!album.estaCompleto()) {
    final pacoteFiguras = PacoteFiguras.gerarPacoteAleatorio();
    album.adicionarFiguras(pacoteFiguras.figuras);

    final repetidas = pacoteFiguras.figurasRepetidas;
    figurasRepetidas.addAll(repetidas);
  }

  print('Número de figuras repetidas: ${figurasRepetidas.length}');
  album.imprimirFigurasColadas();
}

class Album {
  final List<Figura> figurasColadas = [];

  bool estaCompleto() {
    return figurasColadas.length == 20;
  }

  void adicionarFiguras(List<Figura> figuras) {
    for (final figura in figuras) {
      if (!figurasColadas.contains(figura)) {
        figurasColadas.add(figura);
      }
    }
  }

  void imprimirFigurasColadas() {
    figurasColadas.sort((a, b) => a.codigo.compareTo(b.codigo));

    for (final figura in figurasColadas) {
      print('${figura.nome} - Código: ${figura.codigo}');
    }
  }
}

class PacoteFiguras {
  final List<Figura> figuras;
  final List<Figura> figurasRepetidas;

  PacoteFiguras(this.figuras, this.figurasRepetidas);

  static PacoteFiguras gerarPacoteAleatorio() {
    final random = Random();
    final figuras = <Figura>[];
    final figurasRepetidas = <Figura>[];

    for (int i = 0; i < 4; i++) {
      final figura = Figura.gerarFiguraAleatoria();
      if (figuras.contains(figura)) {
        figurasRepetidas.add(figura);
      } else {
        figuras.add(figura);
      }
    }

    return PacoteFiguras(figuras, figurasRepetidas);
  }
}

class Figura {
  final String nome;
  final int codigo;

  Figura(this.nome, this.codigo);

  static Figura gerarFiguraAleatoria() {
    final random = Random();
    final nome = 'Figura${random.nextInt(20) + 1}';
    final codigo = random.nextInt(1000) + 1;
    return Figura(nome, codigo);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Figura && other.codigo == codigo;
  }

  @override
  int get hashCode => codigo.hashCode;
}
