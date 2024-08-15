import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Widget createCardGrid(String image, String menu) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        child: SizedBox(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/$image",
                  width: 100,
                  height: 100,
                ),
                Text(menu)
              ],
            ),
          ),
        ),
        onTap: () {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.3,
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    createCardGrid("shopping-cart.png", "Daftar Barang"),
                    createCardGrid("3d-cash-money.png", "Laporan Keuangan"),
                    createCardGrid("just-2020934_1280.png", "Kalkulator"),
                    createCardGrid("book-1296045_1280.png", "Riwayat Penjualan")
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
