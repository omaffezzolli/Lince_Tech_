import 'dart:math';

void main() {
  final pessoa = Pessoa();
  final fornecedores = [
    FornecedorDeBebidas(),
    FornecedorDeSanduiches(),
    FornecedorDeBolos(),
    FornecedorDeSaladas(),
    FornecedorDePetiscos(),
    FornecedorUltraCaloricos(),
  ];

  for (var i = 0; i < 5; i++) {
    final fornecedor = fornecedores[Random().nextInt(fornecedores.length)];
    pessoa.refeicao(fornecedor);
  }

  pessoa.informacoes();
}

abstract class Fornecedor {
  Produto fornecer();
}

class Produto {
  Produto(this.nome, this.calorias);

  final String nome;
  final int calorias;
}

class FornecedorDeBebidas implements Fornecedor {
  final _random = Random();
  final _bebidasDisponiveis = <Produto>[
    Produto('Agua', 0),
    Produto('Refrigerante', 200),
    Produto('Suco de fruta', 100),
    Produto('Energetico', 135),
    Produto('Cafe', 60),
    Produto('Cha', 35),
  ];

  @override
  Produto fornecer() {
    return _bebidasDisponiveis[_random.nextInt(_bebidasDisponiveis.length)];
  }
}

class FornecedorDeSanduiches implements Fornecedor {
  final _random = Random();
  final _sanduichesDisponiveis = <Produto>[
    Produto('Sanduiche de frango', 400),
    Produto('Sanduiche de carne', 500),
    Produto('Sanduiche de queijo', 350),
  ];

  @override
  Produto fornecer() {
    return _sanduichesDisponiveis[_random.nextInt(_sanduichesDisponiveis.length)];
  }
}

class FornecedorDeBolos implements Fornecedor {
  final _random = Random();
  final _bolosDisponiveis = <Produto>[
    Produto('Bolo de chocolate', 500),
    Produto('Bolo de cenoura', 400),
    Produto('Bolo de limao', 350),
  ];

  @override
  Produto fornecer() {
    return _bolosDisponiveis[_random.nextInt(_bolosDisponiveis.length)];
  }
}

class FornecedorDeSaladas implements Fornecedor {
  final _random = Random();
  final _saladasDisponiveis = <Produto>[
    Produto('Salada de alface', 50),
    Produto('Salada de tomate', 40),
    Produto('Salada de cenoura', 30),
  ];

  @override
  Produto fornecer() {
    return _saladasDisponiveis[_random.nextInt(_saladasDisponiveis.length)];
  }
}

class FornecedorDePetiscos implements Fornecedor {
  final _random = Random();
  final _petiscosDisponiveis = <Produto>[
    Produto('Batata frita', 300),
    Produto('Coxinha', 250),
    Produto('Bolinha de queijo', 200),
  ];

  @override
  Produto fornecer() {
    return _petiscosDisponiveis[_random.nextInt(_petiscosDisponiveis.length)];
  }
}

class FornecedorUltraCaloricos implements Fornecedor {
  final _random = Random();
  final _ultraCaloricosDisponiveis = <Produto>[
    Produto('Hamburguer com bacon', 800),
    Produto('Pizza de pepperoni', 900),
    Produto('Sorvete de chocolate', 600),
  ];

  @override
  Produto fornecer() {
    return _ultraCaloricosDisponiveis[_random.nextInt(_ultraCaloricosDisponiveis.length)];
  }
}

enum StatusCalorias {
  DeficitExtremo,
  Deficit,
  Satisfeito,
  Excesso,
}

class Pessoa {
  int _caloriasConsumidas = 0;
  StatusCalorias _statusCalorias = StatusCalorias.Satisfeito;

  void informacoes() {
    print('Calorias consumidas: $_caloriasConsumidas');
    print('Status de calorias: $_statusCalorias');
  }

  void refeicao(Fornecedor fornecedor) {
    final produto = fornecedor.fornecer();
    print('Consumindo ${produto.nome} (${produto.calorias} calorias)');

    _caloriasConsumidas += produto.calorias;
    _atualizarStatusCalorias();
  }

  void _atualizarStatusCalorias() {
    if (_caloriasConsumidas <= 500) {
      _statusCalorias = StatusCalorias.DeficitExtremo;
    } else if (_caloriasConsumidas <= 1800) {
      _statusCalorias = StatusCalorias.Deficit;
    } else if (_caloriasConsumidas <= 2500) {
      _statusCalorias = StatusCalorias.Satisfeito;
    } else {
      _statusCalorias = StatusCalorias.Excesso;
    }
  }
}