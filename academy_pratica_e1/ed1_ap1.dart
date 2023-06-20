void main() {
  
  String firstname = ("João");
  String lastname = (" Lucas");
  int idade = 17;
  bool ativo = true;
  double peso = 69.0;
  String nacionalidade = ("Brasileiro");

  
  print("Nome Completo: " + firstname +lastname);
  
  if (idade >= 18) {
    print('Idade: $idade (Maior de idade)');
  } else {
    print('Idade: $idade (Menor de idade)');
  }
  
  print('Situacao: ${ativo ? 'Ativo' : 'Inativo'}');
  
  print('Peso:  $peso');
  
  if (nacionalidade != null) {
    print('Nacionalidade: $nacionalidade');
  } else {
    print('Nacionalidade: Nao informada');
  }
    
}