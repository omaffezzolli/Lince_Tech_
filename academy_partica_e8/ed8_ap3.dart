abstract class AnimalComer {
  void comer();
}

abstract class AnimalDormir {
  void dormir();
}

class Camelo implements AnimalComer, AnimalDormir {
  @override
  void comer() {
    print("O camelo está comendo.");
  }

  @override
  void dormir() {
    print("O camelo está dormindo.");
  }
}

void main() {
  Camelo camelo = Camelo();
  camelo.comer();
  camelo.dormir();
}
