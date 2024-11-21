import 'package:flutter/material.dart';

void main() {
  runApp(TipoDeTrianguloApp());
}

class TipoDeTrianguloApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tipo de Triángulo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.teal[50],
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 18, fontFamily: 'Roboto'),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
        ),
      ),
      home: TipoDeTrianguloScreen(),
    );
  }
}

class TipoDeTrianguloScreen extends StatefulWidget {
  @override
  _TipoDeTrianguloScreenState createState() => _TipoDeTrianguloScreenState();
}

class _TipoDeTrianguloScreenState extends State<TipoDeTrianguloScreen> {
  final TextEditingController lado1Controller = TextEditingController();
  final TextEditingController lado2Controller = TextEditingController();
  final TextEditingController lado3Controller = TextEditingController();

  String resultado = "";
  String imagen = "";

  void calcularTipoDeTriangulo() {
    try {
      double lado1 = double.parse(lado1Controller.text);
      double lado2 = double.parse(lado2Controller.text);
      double lado3 = double.parse(lado3Controller.text);

      if (lado1 <= 0 || lado2 <= 0 || lado3 <= 0) {
        setState(() {
          resultado = "Los lados deben ser mayores que 0.";
          imagen = "assets/148766.png";
        });
        return;
      }

      if (lado1 + lado2 <= lado3 || lado1 + lado3 <= lado2 || lado2 + lado3 <= lado1) {
        setState(() {
          resultado = "No es un triángulo válido.";
          imagen = "assets/148766.png";
        });
      } else if (lado1 == lado2 && lado2 == lado3) {
        setState(() {
          resultado = "Es un triángulo equilátero.";
          imagen = "assets/triangulo-equi.png";
        });
      } else if (lado1 == lado2 || lado1 == lado3 || lado2 == lado3) {
        setState(() {
          resultado = "Es un triángulo isósceles.";
          imagen = "assets/triangulo-iso.webp";
        });
      } else {
        setState(() {
          resultado = "Es un triángulo escaleno.";
          imagen = "assets/triangulo-esca.png";
        });
      }
    } catch (e) {
      setState(() {
        resultado = "Por favor, ingresa números válidos.";
        imagen = "assets/148766.png";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tipo de Triángulo'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Determina el tipo de triángulo:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 16),
            TextField(
              controller: lado1Controller,
              decoration: InputDecoration(
                labelText: 'Lado 1',
                hintText: 'Ingresa el primer lado del triángulo',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2),
                ),
                labelStyle: TextStyle(color: Colors.teal),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),
            TextField(
              controller: lado2Controller,
              decoration: InputDecoration(
                labelText: 'Lado 2',
                hintText: 'Ingresa el segundo lado del triángulo',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2),
                ),
                labelStyle: TextStyle(color: Colors.teal),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 8),
            TextField(
              controller: lado3Controller,
              decoration: InputDecoration(
                labelText: 'Lado 3',
                hintText: 'Ingresa el tercer lado del triángulo',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal, width: 2),
                ),
                labelStyle: TextStyle(color: Colors.teal),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: calcularTipoDeTriangulo,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: Text('Calcular'),
            ),
            SizedBox(height: 16),
            Text(
              resultado,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            if (imagen.isNotEmpty) ...[
              SizedBox(height: 16),
              Image.asset(
                imagen,
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
