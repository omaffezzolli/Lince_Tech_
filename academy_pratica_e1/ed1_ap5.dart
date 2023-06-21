void main() {
  const pessoa = Pessoa("João", "Lucas", 17, true, 69.0, null);
  print(pessoa.toString());
}

class Pessoa {
  const Pessoa(
    this.nome,
    this.sobrenome,
    this.idade,
    this.ativo,
    this.peso,
    this.nacionalidade,
  );

  final String nome;
  final String sobrenome;
  final int idade;
  final bool ativo;
  final double peso;
  final String? nacionalidade;

  
  String toString() {
    var imprimirFormatado = "";

    imprimirFormatado += "Nome completo: $nome $sobrenome";

    if (idade >= 18) {
      imprimirFormatado += "Idade: $idade (maior de idade)";
    } else {
      imprimirFormatado += "Idade: $idade (menor de idade)";
    }

    if (ativo) {
      imprimirFormatado += "Situacao: Ativo";
    } else {
      imprimirFormatado += "Situacao: Inativo";
    }

    imprimirFormatado += "Peso: ${peso.toString()}";

    if (nacionalidade != null) {
      imprimirFormatado += "Nacionalidade: $nacionalidade";
    } else {
      imprimirFormatado += "Nacionalidade: Nao informada";
    }

    return imprimirFormatado;
  }
}
