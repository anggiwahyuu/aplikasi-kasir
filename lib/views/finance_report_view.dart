import 'package:flutter/material.dart';

class FinanceReportView extends StatelessWidget {
  FinanceReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Laporan Keuangan',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(),
    );
  }
}
