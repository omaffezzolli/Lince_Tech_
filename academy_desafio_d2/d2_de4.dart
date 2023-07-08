import 'dart:math' as math;

void main() {
  final comparador = ComparadorFormasGeometricas();

  final circuloA = Circulo('Circulo A', 3);
  final circuloB = Circulo('Circulo B', 8);
  final retanguloA = Retangulo('Retangulo A', 4, 3);
  final retanguloB = Retangulo('Retangulo B', 19, 11);
  final trianguloEquilateroA = TrianguloEquilatero('Triangulo Equilatero A', 5);
  final trianguloEquilateroB = TrianguloEquilatero('Triangulo Equilatero B', 7);
  final trianguloRetanguloA = TrianguloRetangulo('Triangulo Retangulo A', 3, 4);
  final trianguloRetanguloB = TrianguloRetangulo('Triangulo Retangulo B', 5, 12);
  final pentagonoRegularA = PentagonoRegular('Pentagono Regular A', 5);
  final pentagonoRegularB = PentagonoRegular('Pentagono Regular B', 8);
  final hexagonoRegularA = HexagonoRegular('Hexagono Regular A', 6);
  final hexagonoRegularB = HexagonoRegular('Hexagono Regular B', 10);

  final formas = [
    circuloA,
    circuloB,
    retanguloA,
    retanguloB,
    trianguloEquilateroA,
    trianguloEquilateroB,
    trianguloRetanguloA,
    trianguloRetanguloB,
    pentagonoRegularA,
    pentagonoRegularB,
    hexagonoRegularA,
    hexagonoRegularB,
  ];

  FormaGeometrica maiorArea = comparador.maiorFormaGeometrica(formas, (a, b) => a.area.compareTo(b.area));
  FormaGeometrica maiorPerimetro = comparador.maiorFormaGeometrica(formas, (a, b) => a.perimetro.compareTo(b.perimetro));

  print('A maior área é ${maiorArea.area.toStringAsFixed(2)} e pertence a ${maiorArea.nome}');
  print('O maior perímetro é ${maiorPerimetro.perimetro.toStringAsFixed(2)} e pertence a ${maiorPerimetro.nome}');
}

abstract class FormaGeometrica {
  final String nome;

  FormaGeometrica(this.nome);

  double get area;

  double get perimetro;
}

class Circulo extends FormaGeometrica {
  final double raio;

  Circulo(String nome, this.raio) : super(nome);

  @override
  double get area => math.pi * math.pow(raio, 2);

  @override
  double get perimetro => 2 * math.pi * raio;
}

class Retangulo extends FormaGeometrica {
  final double largura;
  final double altura;

  Retangulo(String nome, this.largura, this.altura) : super(nome);

  @override
  double get area => largura * altura;

  @override
  double get perimetro => (largura * 2) + (altura * 2);
}

class Quadrado extends Retangulo {
  final double lado;

  Quadrado(String nome, this.lado) : super(nome, lado, lado);
}

class TrianguloEquilatero extends FormaGeometrica {
  final double lado;

  TrianguloEquilatero(String nome, this.lado) : super(nome);

  @override
  double get area => (math.sqrt(3) / 4) * math.pow(lado, 2);

  @override
  double get perimetro => 3 * lado;
}

class TrianguloRetangulo extends FormaGeometrica {
  final double base;
  final double altura;

  TrianguloRetangulo(String nome, this.base, this.altura) : super(nome);

  @override
  double get area => (base * altura) / 2;

  @override
  double get perimetro => base + altura + math.sqrt(math.pow(base, 2) + math.pow(altura, 2));
}

class PentagonoRegular extends FormaGeometrica {
  final double lado;

  PentagonoRegular(String nome, this.lado) : super(nome);

  @override
  double get area => (lado * lado * math.sqrt(25 + 10 * math.sqrt(5))) / 4;

  @override
  double get perimetro => 5 * lado;
}

class HexagonoRegular extends FormaGeometrica {
  final double lado;

  HexagonoRegular(String nome, this.lado) : super(nome);

  @override
  double get area => (3 * math.sqrt(3) * math.pow(lado, 2)) / 2;

  @override
  double get perimetro => 6 * lado;
}

class ComparadorFormasGeometricas {
  FormaGeometrica maiorFormaGeometrica(List<FormaGeometrica> formas, int Function(FormaGeometrica a, FormaGeometrica b) compare) {
    FormaGeometrica maiorForma = formas[0];

    for (int i = 1; i < formas.length; i++) {
      if (compare(formas[i], maiorForma) > 0) {
        maiorForma = formas[i];
      }
    }

    return maiorForma;
  }
}
