import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taller1_2/views.dart';

class CalculatorIMC extends StatefulWidget {
  const CalculatorIMC({super.key});

  @override
  State<CalculatorIMC> createState() => _CalculatorIMCState();
}

class _CalculatorIMCState extends State<CalculatorIMC> {
  double weight = 0;
  double height = 0;
  double imc = 0;
  String? nivel;

  double calculateIMC(double weight, double height) {
    return weight / (height * height);
  }

  String getOverweightNivel(double imc) {
    if (imc < 18.5) {
      return 'Bajo peso';
    } else if (imc < 25) {
      return 'Normal';
    } else if (imc < 30) {
      return 'Sobrepeso';
    } else if (imc < 35) {
      return 'Obesidad grado 1';
    } else if (imc < 40) {
      return 'Obesidad grado 2';
    } else {
      return 'Obesidad grado 3';
    }
  }

  Row buttonsNav() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Pagina1()));
          },
          child: const Text('¿Qué es IMC?'),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          onPressed: () {
            SystemNavigator.pop();
          },
          child: const Text('Cerrar App'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buttonsNav(),
            Container(
              margin: const EdgeInsets.only(
                bottom: 20,
                left: 15,
                right: 15,
              ),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Peso',
                ),
                onChanged: (text) {
                  setState(() {
                    weight = double.parse(text);
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 20,
                left: 15,
                right: 15,
              ),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Altura',
                ),
                onChanged: (text) {
                  setState(() {
                    height = double.parse(text);
                  });
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    imc = calculateIMC(weight, height);
                    nivel = getOverweightNivel(imc);
                  });
                },
                child: const Text(
                  'Calcular',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Text(
              !imc.isNaN && imc != 0 ? 'IMC : $imc \nNivel : $nivel' : '',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
