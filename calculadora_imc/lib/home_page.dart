import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controllerPeso = TextEditingController();
  final TextEditingController _controllerAtura = TextEditingController();
  double peso;
  double altura;
  double imc;
  String _infoText = 'Informe os Dados!';

  @override
  void initState() {
    peso = double.tryParse(_controllerPeso.text);
    altura = double.tryParse(_controllerAtura.text);
    super.initState();
  }

  calcularImc() {
    setState(() {
      peso = double.tryParse(_controllerPeso.text);
      altura = double.tryParse(_controllerAtura.text);

      imc = peso / (altura * altura);

      if (imc < 18.6) {
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 40) {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  void dispose() {
    _controllerAtura.dispose();
    _controllerPeso.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Icon(
                  Icons.account_circle,
                  size: 60,
                  color: Colors.green,
                ),
                TextField(
                  controller: _controllerPeso,
                  decoration: InputDecoration(
                    hintText: 'Peso (KG)',
                  ),
                ),
                TextField(
                  controller: _controllerAtura,
                  decoration: InputDecoration(
                    hintText: 'Altura (CM)',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '      Calcular      ',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.green,
                  onPressed: calcularImc,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(_infoText),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
