import 'dart:math';

void main() {
  List<double> raios = gerarListaRaios();

  for (double raio in raios) {
    double area = calcularArea(raio);
    double perimetro = calcularPerimetro(raio);

    imprimirDadosCirculo(raio, area, perimetro);
  }
}

List<double> gerarListaRaios() {
  Random random = Random();
  List<double> raios = [];

  for (int i = 0; i < 10; i++) {
    double raio = random.nextInt(100) + 1;
    raios.add(raio);
  }

  return raios;
}

double calcularArea(double raio) {
  return pi * raio * raio;
}

double calcularPerimetro(double raio) {
  return 2 * pi * raio;
}

void imprimirDadosCirculo(double raio, double area, double perimetro) {
  print('Raio: $raio, área: $area, perímetro: $perimetro');
}
