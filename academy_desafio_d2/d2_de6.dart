void main() {
  final baralho = Baralho();

  baralho.empilharCarta(Carta(Naipe.paus, 'A ♣'));
  baralho.empilharCarta(Carta(Naipe.copas, 'A ♥'));
  baralho.empilharCarta(Carta(Naipe.espadas, 'A ♠'));
  baralho.empilharCarta(Carta(Naipe.ouros, 'A ♦'));

  while (baralho.tamanho > 0) {
    final cartaRemovida = baralho.removerCarta();
    print('Carta removida: ${cartaRemovida.valor}');
  }
}

class Baralho {
  final List<Carta> cartas = [];

  void empilharCarta(Carta carta) {
    cartas.add(carta);
  }

  Carta removerCarta() {
    final cartaRemovida = cartas.last;
    cartas.removeLast();
    return cartaRemovida;
  }

  int get tamanho => cartas.length;
}

class Carta {
  final Naipe naipe;
  final String valor;

  Carta(this.naipe, this.valor);
}

enum Naipe { paus, copas, espadas, ouros }
