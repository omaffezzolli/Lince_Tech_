import 'dart:math';
  
  enum GeneroMusical{
  funk,
  pagode,
  trap,
  gospel,
  sertanejo
}

void main(){
  final random = Random();
   GeneroMusical generoEscolhido = GeneroMusical.values[random.nextInt(GeneroMusical.values.length)];

  print("Meu gênero musical preferido é o ${generoEscolhido.toString().split('.').last}");
}
  
  
