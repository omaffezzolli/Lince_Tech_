class Retangulo {
  double largura;
  double altura;

  Retangulo(this.largura, this.altura);

  double calcularArea() {
    return largura * altura;
  }
}

void main() {
  Retangulo retangulo = Retangulo(10.5, 9.5);
  double area = retangulo.calcularArea();
  print("Área do retângulo: $area");
}
