import 'package:calculadora_dois_dio/models/pessoa_imc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controllerPeso = TextEditingController();
  TextEditingController controllerAltura = TextEditingController();
  List<PessoaImc> imcs = <PessoaImc>[];
  String info = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Calcular IMC'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: controllerPeso,
                decoration: const InputDecoration(labelText: "Peso (kg)"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                  controller: controllerAltura,
                  decoration: const InputDecoration(labelText: 'Altura (m)')),
            ),
            ElevatedButton(
              onPressed: () {
                double peso = double.parse(controllerPeso.text);
                double altura = double.parse(controllerAltura.text);
                PessoaImc imc = PessoaImc(peso, altura, null);
                double calculoImc = imc.calcularImc();
                String infoResult = imc.resultIMC(calculoImc);

                setState(() {
                  info = infoResult;
                  imcs.add(imc);
                });
              },
              child: const Text('Calcular IMC'),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              info,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: imcs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("Peso: ${imcs[index].peso.toString()}"),
                    subtitle: Text(
                      'Altura: ${imcs[index].altura.toString()}',
                    ),
                    trailing: Text(
                        "Imc: ${imcs[index].imc!.toStringAsFixed(2).toString()}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
