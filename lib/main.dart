import 'package:aplikasi_kasir/views/calculator_view.dart';
import 'package:aplikasi_kasir/views/finance_report_view.dart';
import 'package:aplikasi_kasir/views/history_transaction_view.dart';
import 'package:aplikasi_kasir/views/item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_kasir/views/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final routes = [
    GetPage(name: '/', page: () => const MyHomePage()),
    GetPage(name: '/list_item', page: () => ItemListView()),
    GetPage(name: '/finance_report', page: () => FinanceReportView()),
    GetPage(name: '/calculator', page: () => CalculatorView()),
    GetPage(name: '/history_transaction', page: () => HistoryTransactionView())
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aplikasi Kasir',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const MyHomePage()),
        GetPage(name: '/list_item', page: () => ItemListView()),
        GetPage(name: '/finance_report', page: () => FinanceReportView()),
        GetPage(name: '/calculator', page: () => CalculatorView()),
        GetPage(
            name: '/history_transaction', page: () => HistoryTransactionView())
      ],
    );
  }
}
