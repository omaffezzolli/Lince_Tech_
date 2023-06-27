void converterListaParaNumeros(List<String> lista) {
  List<int> listaConvertida = lista.map<int>((texto) => int.tryParse(texto) ?? 0).toList();
  print('Lista convertida: ${listaConvertida.join(', ')}');
}

void main() {
  List<String> lista = [
    '10',
    '2XXL7',
    'JOJ0',
    '99',
    '381',
    'AD44',
    '47',
    '2B',
    '123',
    '78',
  ];

  converterListaParaNumeros(lista);
}
