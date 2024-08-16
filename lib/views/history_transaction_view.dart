import 'package:flutter/material.dart';

class HistoryTransactionView extends StatelessWidget {
  HistoryTransactionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Transaksi',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(),
    );
  }
}
