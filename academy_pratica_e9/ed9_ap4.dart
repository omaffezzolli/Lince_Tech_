import 'dart:async';

Future<void> buscarDados() async {
  print('Iniciando busca de dados...');

  await Future.delayed(Duration(seconds: 2));
  print('Buscando dados...');

  await Future.delayed(Duration(seconds: 3));
  print('Dados encontrados!');

  print('Fim da busca de dados.');
}

void main() {
  buscarDados();
}
