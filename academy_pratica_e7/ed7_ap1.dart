class ContaBancaria {
  String titular;
  double saldo;

  ContaBancaria(this.titular, this.saldo);

  void depositar(double valor) {
    saldo += valor;
  }

  void sacar(double valor) {
    if (valor <= saldo) {
      saldo -= valor;
    } else {
      print("Saldo insuficiente.");
    }
  }

  void imprimirSaldo() {
    print("Saldo atual: $saldo");
  }
}

void main() {
  ContaBancaria conta = ContaBancaria("João", 0);
  conta.depositar(5000.0);
  conta.sacar(500.0);
  conta.imprimirSaldo();
}
