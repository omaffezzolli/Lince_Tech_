abstract class Arquivo {
  void abrir();
}

class ArquivoTexto implements Arquivo {
  String nome;

  ArquivoTexto(this.nome);

  @override
  void abrir() {
    try {
      if (nome == 'arquivo.txt') {
        print('Arquivo $nome aberto com sucesso.');
      } else {
        throw Exception('Erro ao abrir o arquivo $nome');
      }
    } catch (e) {
      rethrow;
    }
  }
}

void main() {
  try {
    final nomeArquivo = 'arquivo.txt'; 

    if (nomeArquivo.isEmpty) {
      throw Exception('Entrada inválida. Digite um nome válido.');
    }

    final arquivo = ArquivoTexto(nomeArquivo);
    arquivo.abrir();
  } catch (e) {
    print(e);
  } finally {
    print('Fim do programa.');
  }
}
