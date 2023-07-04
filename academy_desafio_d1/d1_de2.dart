void main() {
 final List<double> temperaturasCelsius = [0.0, 4.2, 15.0, 18.1, 21.7, 32.0, 40.0, 41.0];

  for (double celsius in temperaturasCelsius) {
    double fahrenheit = converterParaFahrenheit(celsius);
    double kelvin = converterParaKelvin(celsius);

    print('Celsius: ${celsius.toStringAsFixed(2)}, Fahrenheit: ${fahrenheit.toStringAsFixed(2)}, Kelvin: ${kelvin.toStringAsFixed(2)}');
  }
}

double converterParaFahrenheit(double celsius) {
  return (celsius * 9 / 5) + 32;
}

double converterParaKelvin(double celsius) {
  return celsius + 273.15;
}
