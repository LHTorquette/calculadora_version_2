class PessoaImc {
  double? peso;
  double? altura;
  double? imc = 0;

  PessoaImc(this.peso, this.altura, this.imc);

  double calcularImc() {
    double imc = peso! / (altura! * altura!);
    return imc;
  }

  String resultIMC(double imc) {
    String info = '';
    if (imc < 16) {
      info = "Magreza grave";
    } else if (imc >= 16 && imc < 17) {
      info = 'Magreza Moderada';
    } else if (imc >= 17 && imc < 18.5) {
      info = 'Magreza Leve';
    } else if (imc >= 18.5 && imc < 25) {
      info = 'Saudável';
    } else if (imc >= 25 && imc < 30) {
      info = 'Sobrepeso';
    } else if (imc >= 30 && imc < 35) {
      info = 'Obsidade Grau I';
    } else if (imc >= 35 && imc < 40) {
      info = 'Obsidade Grau II (severa)';
    } else {
      info = 'Obsidade Grau III (mórbida)';
    }
    this.imc = imc;
    return "O seu IMC é de ${calcularImc().toStringAsFixed(2)} e você está com \n $info";
  }
}
