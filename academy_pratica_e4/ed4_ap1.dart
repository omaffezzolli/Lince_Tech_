bool ehAnoBissexto(int ano) {
  if (ano % 4 == 0) {
    if (ano % 100 == 0) {
      if (ano % 400 == 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  } else {
    return false;
  }
}
void main() {
  List<int> anos = [2016, 1988, 2000, 2100, 2300, 1993];
  for (int ano in anos) {
    if (ehAnoBissexto(ano)) {
      print('O ano $ano eh bissexto');
    } else {
      print('O ano $ano nao eh bissexto');
    }
  }
}
