List<T> removerElementoDaLista<T>(List<T>? lista, [T? elemento]) {
  return lista ?? []..remove(elemento);
}

void main() {
  List<int>? lista1 = [1, 2, 3, 4, 5];
  int? elemento1 = 3;

  List<String>? lista2;
  String? elemento2 = 'banana';

  List<int>? lista3 = null;
  int? elemento3 = null;

  print(removerElementoDaLista(lista1, elemento1));
  print(removerElementoDaLista(lista2, elemento2)); 
  print(removerElementoDaLista(lista3, elemento3)); 
}
