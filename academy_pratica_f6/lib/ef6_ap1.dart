import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

enum TipoSanguineo {
  aPositivo,
  aNegativo,
  bPositivo,
  bNegativo,
  oPositivo,
  oNegativo,
  abPositivo,
  abNegativo,
}

class Pessoa {
  const Pessoa({
    required this.nome,
    required this.email,
    required this.telefone,
    required this.github,
    required this.tipoSanguineo,
  });

  final String nome;
  final String email;
  final String telefone;
  final String github;
  final TipoSanguineo tipoSanguineo;

  // todo: implementar equals e hashcode
}

class EstadoListaDePessoas with ChangeNotifier {
  final _listaDePessoas = <Pessoa>[];

  List<Pessoa> get pessoas => List.unmodifiable(_listaDePessoas);

  void incluir(Pessoa pessoa) {
    _listaDePessoas.add(pessoa);
    notifyListeners();
  }

  void excluir(Pessoa pessoa) {
    _listaDePessoas.remove(pessoa);
    notifyListeners();
  }

  void atualizarPessoa(int index, Pessoa pessoa) {
    _listaDePessoas[index] = pessoa;
    notifyListeners();
  }

  // todo: implementar metodos restantes
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => EstadoListaDePessoas()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TelaInicial(),
      ),
    );
  }
}

class TelaInicial extends StatefulWidget {
  @override
  State<TelaInicial> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TelaInicial> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Inicio"),
        ),
        body: Center(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: Text("Ver lista de pessoas"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaLista()),
                    );
                  },
                ),
                ElevatedButton(
                  child: Text("Incluir ou adicionar"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TelaModifica()),
                    );
                  },
                ),
              ]),
        ),
      ),
    );
  }
}

class TelaLista extends StatelessWidget {
  const TelaLista({super.key});

  @override
  Widget build(BuildContext context) {
    final estado = Provider.of<EstadoListaDePessoas>(context);
    final pessoas = estado.pessoas;
    return Scaffold(
      appBar: AppBar(title: Text("Listagem")),
      body: ListView.builder(
          itemCount: pessoas.length,
          itemBuilder: (context, index) {
            final p = pessoas[index];

            return Card(
              color: _getTipoSanguineo(p.tipoSanguineo),
              child: ListTile(
                title: Text(p.nome),
                subtitle: Text(p.email),
                trailing: IconButton(
                    icon: Icon(Icons.remove_circle),
                    onPressed: () {
                      estado.excluir(p);
                    }),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TelaModifica(p: p, index: index)),
                  );
                },
              ),
            );
          }),
    );
  }

//----------------------------------------------------------------

  Color _getTipoSanguineo(TipoSanguineo tipoSanguineo) {
    switch (tipoSanguineo) {
      case TipoSanguineo.aPositivo:
        return Colors.blue;
      case TipoSanguineo.aNegativo:
        return Colors.red;
      case TipoSanguineo.bNegativo:
        return Colors.purple;
      case TipoSanguineo.bPositivo:
        return Colors.orange;
      case TipoSanguineo.oPositivo:
        return Colors.green;
      case TipoSanguineo.oNegativo:
        return Colors.yellow;
      case TipoSanguineo.abPositivo:
        return Colors.cyan;
      case TipoSanguineo.abNegativo:
        return Colors.white;
    }
  }
}
//-----------------------------------------------------------------

class TelaModifica extends StatefulWidget {
  final Pessoa? p;
  final int? index;

  TelaModifica({this.p, this.index});

  @override
  _TelaModificaState createState() => _TelaModificaState();
}

class _TelaModificaState extends State<TelaModifica> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _githubController = TextEditingController();
  TipoSanguineo _tipoSanguineo = TipoSanguineo.aPositivo;

  @override
  void initState() {
    super.initState();
    if (widget.p != null) {
      _nomeController.text = widget.p!.nome;
      _emailController.text = widget.p!.email;
      _telefoneController.text = widget.p!.telefone;
      _githubController.text = widget.p!.github;
      _tipoSanguineo = widget.p!.tipoSanguineo;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget.p == null ? 'Incluir Pessoa' : 'Editar Pessoa')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome Completo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'E-mail'),
                  validator: (value) {
                    if (value != null && value.contains('@')) {
                      return null;
                    } else {
                      return 'E-mail inválido';
                    }
                  }),
              TextFormField(
                controller: _telefoneController,
                decoration: InputDecoration(labelText: 'Telefone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Campo obrigatório';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _githubController,
                decoration: InputDecoration(labelText: 'Link do GitHub'),
                validator: (value) {
                  return null;
                },
              ),
              DropdownButtonFormField<TipoSanguineo>(
                value: _tipoSanguineo,
                onChanged: (value) {
                  setState(() {
                    _tipoSanguineo = value!;
                  });
                },
                items: [
                  DropdownMenuItem(
                    value: TipoSanguineo.aPositivo,
                    child: Text('A+'),
                  ),
                  DropdownMenuItem(
                    value: TipoSanguineo.aNegativo,
                    child: Text('A-'),
                  ),
                  DropdownMenuItem(
                    value: TipoSanguineo.bPositivo,
                    child: Text('B+'),
                  ),
                  DropdownMenuItem(
                    value: TipoSanguineo.bNegativo,
                    child: Text('B-'),
                  ),
                  DropdownMenuItem(
                    value: TipoSanguineo.oPositivo,
                    child: Text('O+'),
                  ),
                  DropdownMenuItem(
                    value: TipoSanguineo.oNegativo,
                    child: Text('O-'),
                  ),
                  DropdownMenuItem(
                    value: TipoSanguineo.abPositivo,
                    child: Text('AB+'),
                  ),
                  DropdownMenuItem(
                    value: TipoSanguineo.abNegativo,
                    child: Text('AB-'),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final pessoa = Pessoa(
                      nome: _nomeController.text,
                      email: _emailController.text,
                      telefone: _telefoneController.text,
                      github: _githubController.text,
                      tipoSanguineo: _tipoSanguineo,
                    );

                    if (widget.p == null) {
                      Provider.of<EstadoListaDePessoas>(context, listen: false)
                          .incluir(pessoa);
                    } else {
                      Provider.of<EstadoListaDePessoas>(context, listen: false)
                          .atualizarPessoa(widget.index!, pessoa);
                    }

                    Navigator.pop(context);
                  }
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
