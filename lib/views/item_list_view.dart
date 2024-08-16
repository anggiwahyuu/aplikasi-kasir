import 'package:flutter/material.dart';

class ItemListView extends StatefulWidget {
  const ItemListView({super.key});

  @override
  State<ItemListView> createState() => _ItemListView();
}

class _ItemListView extends State<ItemListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "List Barang",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(),
    );
  }
}
