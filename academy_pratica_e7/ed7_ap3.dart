class Produto {
  String nome;
  double preco;

  Produto(this.nome, this.preco);

  double desconto(double percentualDesconto) {
    double valorDesconto = (percentualDesconto / 100) * preco;
    double precoComDesconto = preco - valorDesconto;
    return precoComDesconto;
  }
}

void main() {
  List<Produto> produtos = [
    Produto("Controle", 100.0),
    Produto("Teclado", 200.0),
    Produto("Mouse", 300.0),
    Produto("Monitor", 400.0),
    Produto("Jogo", 500.0),
  ];

  double percentualDesconto = 10.0;

  for (Produto produto in produtos) {
    double novoPreco = produto.desconto(percentualDesconto);
    print("Novo preço do produto ${produto.nome} (com desconto): $novoPreco");
  }
}
