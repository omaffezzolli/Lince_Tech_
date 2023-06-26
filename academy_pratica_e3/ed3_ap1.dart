import 'dart:math';

void main() {
  List<int> lista1 = gerarListaAleatoria(5);
  List<int> lista2 = gerarListaAleatoria(5);

  imprimirLista(lista1);
  imprimirLista(lista2);

  List<int> listaFinal = somarListas(lista1, lista2);

  imprimirLista(listaFinal);
}

List<int> gerarListaAleatoria(int tamanho) {
  Random random = Random();
  List<int> lista = [];

  for (int i = 0; i < tamanho; i++) {
    lista.add(random.nextInt(101));
  }

  return lista;
}

void imprimirLista(List<int> lista) {
  if (lista.isEmpty) {
    print('Lista vazia');
  } else {
    String listaFormatada = lista.join(', ');
    print('Lista: $listaFormatada');
  }
}

List<int> somarListas(List<int> lista1, List<int> lista2) {
  List<int> listaFinal = [];

  if (lista1.length != lista2.length) {
    print('As listas têm tamanhos diferentes. Retornando uma lista vazia.');
    return listaFinal;
  }

  for (int i = 0; i < lista1.length; i++) {
    listaFinal.add(lista1[i] + lista2[i]);
  }

  return listaFinal;
}
