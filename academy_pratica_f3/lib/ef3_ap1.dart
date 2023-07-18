import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Formulário',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  bool _isInactive = false;
  final List<String> _savedData = [];

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _savedData.add(_nameController.text);
        _savedData.add(_ageController.text);
        _nameController.clear();
        _ageController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulário'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        labelText: 'Nome',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, insira um nome.';
                        }
                        if (value.length < 3) {
                          return 'O nome deve conter pelo menos 3 letras.';
                        }
                        if (!value
                            .substring(0, 1)
                            .toUpperCase()
                            .contains(RegExp(r'[A-Z]'))) {
                          return 'O nome deve começar com uma letra maiúscula.';
                        }
                        return null;
                      }),
                  TextFormField(
                      controller: _ageController,
                      decoration: InputDecoration(
                        labelText: 'Idade',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Por favor, insira uma idade.';
                        }
                        int age = int.tryParse(value) ?? 0;
                        // ignore: unnecessary_null_comparison
                        if (age == null) {
                          return 'A idade deve ser um número válido.';
                        }
                        if (age < 18) {
                          return 'A idade deve ser maior ou igual a 18.';
                        }
                        return null;
                      }),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: _isInactive,
                        onChanged: (value) {
                          setState(() {
                            _isInactive = value!;
                          });
                        },
                      ),
                      Text('Inativo'),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: _saveForm,
                    child: Text('Salvar'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Dados salvos:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Container(
              padding: EdgeInsets.all(8.0),
              color: _isInactive ? Colors.grey : Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _savedData
                    .map((data) => Text(
                          data,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
