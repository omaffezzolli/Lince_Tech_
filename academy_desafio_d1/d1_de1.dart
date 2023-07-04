import 'dart:math';

void main() {
  List<double> raios = [5, 8, 12, 7.3, 18, 2, 25];

  for (double raio in raios) {
    double area = calcularAreaCirculo(raio);
    double perimetro = calcularPerimetroCirculo(raio);

    print('Raio: $raio, área: ${area.toStringAsFixed(2)}, perímetro: ${perimetro.toStringAsFixed(2)}.');
  }
}

double calcularAreaCirculo(double raio) {
  return pi * pow(raio, 2);
}

double calcularPerimetroCirculo(double raio) {
  return 2 * pi * raio;
}
