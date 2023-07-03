abstract class Animal {
  void comer();
  void beber();
}

class Cachorro extends Animal {
  @override
  void comer() {
    print("O animal está comendo.");
  }

  @override
  void beber() {
    print("O animal está bebendo.");
  }

  void latir() {
    print("O cachorro está latindo.");
  }
}

void main() {
  Cachorro cachorro = Cachorro();
  cachorro.beber();
  cachorro.comer();
  cachorro.latir();
}
