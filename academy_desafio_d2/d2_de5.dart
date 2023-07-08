import 'dart:math';

void main() {
  final listaCompras = ListaCompras();

  // Adicionar itens desejados
  listaCompras.adicionarItem('Arroz', 2);
  listaCompras.adicionarItem('Feijão', 3);
  listaCompras.adicionarItem('Macarrão', 4);

  // Marcar itens como comprados
  listaCompras.marcarItemComprado('Arroz');
  listaCompras.marcarItemComprado('Macarrão');

  // Marcar item sem estoque
  listaCompras.marcarItemSemEstoque('Feijão');

  // Exibir itens desejados
  listaCompras.exibirItensDesejados();

  // Escolher um item pendente aleatoriamente
  final itemPendente = listaCompras.escolherItemPendente();
  print('Item pendente: $itemPendente');

  // Mostrar indicador de progresso
  listaCompras.mostrarProgresso();
}

class ListaCompras {
  final List<ItemCompra> itens = [];

  void adicionarItem(String nome, int quantidade) {
    final item = ItemCompra(nome, quantidade);
    itens.add(item);
  }

  void marcarItemComprado(String nome) {
    final item = _buscarItem(nome);
    if (item != null) {
      item.comprado = true;
    }
  }

  void marcarItemSemEstoque(String nome) {
    final item = _buscarItem(nome);
    if (item != null) {
      item.semEstoque = true;
    }
  }

  void exibirItensDesejados() {
    for (final item in itens) {
      if (!item.comprado) {
        print('${item.nome} - ${item.quantidade}');
      }
    }
  }

  String escolherItemPendente() {
    final itensPendentes = itens.where((item) => !item.comprado).toList();
    if (itensPendentes.isNotEmpty) {
      final randomIndex = Random().nextInt(itensPendentes.length);
      return itensPendentes[randomIndex].nome;
    }
    return 'Nenhum item pendente encontrado';
  }

  void mostrarProgresso() {
    final totalItens = itens.length;
    final totalComprados = itens.where((item) => item.comprado).length;
    print('Progresso: $totalComprados/$totalItens');
  }

  ItemCompra? _buscarItem(String nome) {
    for (final item in itens) {
      if (item.nome == nome) {
        return item;
      }
    }
    return null;
  }
}

class ItemCompra {
  final String nome;
  final int quantidade;
  bool comprado;
  bool semEstoque;

  ItemCompra(this.nome, this.quantidade)
      : comprado = false,
        semEstoque = false;
}
