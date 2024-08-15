import 'dart:typed_data';

class Items {
  late int? itemID;
  late String? itemName;
  late int? itemPrice;
  late int? itemStock;
  late Uint8List? itemImg;

  Items(
      {this.itemID,
      required this.itemName,
      required this.itemPrice,
      required this.itemStock,
      this.itemImg});

  Map<String, dynamic> toMap() {
    return {
      'itemID': itemID,
      'itemName': itemName,
      'itemPrice': itemPrice,
      'itemStock': itemStock,
      'itemImg': itemImg
    };
  }

  Items.fromMap(Map<String, dynamic> map) {
    itemID = map['itemID'];
    itemName = map['itemName'];
    itemPrice = map['itemPrice'];
    itemStock = map['itemStock'];
    itemImg = map['itemImg'];
  }
}
