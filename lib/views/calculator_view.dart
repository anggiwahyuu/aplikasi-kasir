import 'package:flutter/material.dart';

class CalculatorView extends StatelessWidget {
  CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Kalkulator',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(),
    );
  }
}
