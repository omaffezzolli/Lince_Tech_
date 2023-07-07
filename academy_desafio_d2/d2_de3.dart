class Musica {
  String titulo;
  String artista;
  String album;
  int duracao; 

  Musica(this.titulo, this.artista, this.album, this.duracao);
}

class BibliotecaDeMusicas {
  List<Musica> musicas = [];

  void adicionarMusica(Musica musica) {
    musicas.add(musica);
  }

  void imprimirMusicas() {
    for (var musica in musicas) {
      print('Título: ${musica.titulo}');
      print('Artista: ${musica.artista}');
      print('Álbum: ${musica.album}');
      print('Duração: ${musica.duracao} segundos');
      print('-------------------');
    }
  }

  void buscarPorTitulo(String titulo) {
    var resultado = musicas.where((musica) => musica.titulo == titulo);
    if (resultado.isEmpty) {
      print('Nenhuma música encontrada com o título $titulo');
    } else {
      print('Música(s) encontrada(s) com o título $titulo:');
      for (var musica in resultado) {
        print('Título: ${musica.titulo}');
        print('Artista: ${musica.artista}');
        print('Álbum: ${musica.album}');
        print('Duração: ${musica.duracao} segundos');
        print('-------------------');
      }
    }
  }

  void buscarPorArtista(String artista) {
    var resultado = musicas.where((musica) => musica.artista == artista);
    if (resultado.isEmpty) {
      print('Nenhuma música encontrada com o artista $artista');
    } else {
      print('Música(s) encontrada(s) com o artista $artista:');
      for (var musica in resultado) {
        print('Título: ${musica.titulo}');
        print('Artista: ${musica.artista}');
        print('Álbum: ${musica.album}');
        print('Duração: ${musica.duracao} segundos');
        print('-------------------');
      }
    }
  }

  void buscarPorAlbum(String album) {
    var resultado = musicas.where((musica) => musica.album == album);
    if (resultado.isEmpty) {
      print('Nenhuma música encontrada com o álbum $album');
    } else {
      print('Música(s) encontrada(s) com o álbum $album:');
      for (var musica in resultado) {
        print('Título: ${musica.titulo}');
        print('Artista: ${musica.artista}');
        print('Álbum: ${musica.album}');
        print('Duração: ${musica.duracao} segundos');
        print('-------------------');
      }
    }
  }

  void imprimirInformacoesBiblioteca() {
    print('Número de músicas na biblioteca: ${musicas.length}');

    int duracaoTotal = musicas.fold(0, (total, musica) => total + musica.duracao);
    double duracaoTotalHoras = duracaoTotal / 3600.0;
    print('Duração total em horas: ${duracaoTotalHoras.toStringAsFixed(2)}');
  }
}

void main() {
  var biblioteca = BibliotecaDeMusicas();

  biblioteca.adicionarMusica(Musica('Música 1', 'Artista 1', 'Álbum 1', 180));
  biblioteca.adicionarMusica(Musica('Música 2', 'Artista 2', 'Álbum 1', 240));
  biblioteca.adicionarMusica(Musica('Música 3', 'Artista 1', 'Álbum 2', 300));
  biblioteca.adicionarMusica(Musica('Música 4', 'Artista 3', 'Álbum 2', 200));

  biblioteca.imprimirMusicas();

  biblioteca.buscarPorTitulo('Música 2');
  biblioteca.buscarPorArtista('Artista 1');
  biblioteca.buscarPorAlbum('Álbum 2');

  biblioteca.imprimirInformacoesBiblioteca();
}
