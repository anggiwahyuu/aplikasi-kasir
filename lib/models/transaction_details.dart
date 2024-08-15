class TransactionDetails {
  late int? detailsID;
  late String? itemName;
  late int? qty;
  late int? totalItemPrice;
  late int? historyID;

  TransactionDetails(
      {this.detailsID,
      required this.itemName,
      required this.qty,
      required this.totalItemPrice,
      required this.historyID});

  Map<String, dynamic> toMap() {
    return {
      'detailsID': detailsID,
      'itemName': itemName,
      'qty': qty,
      'totalItemPrice': totalItemPrice,
      'historyID': historyID
    };
  }

  TransactionDetails.fromMap(Map<String, dynamic> map) {
    detailsID = map['detailsID'];
    itemName = map['itemName'];
    qty = map['qty'];
    totalItemPrice = map['totalItemPrice'];
    historyID = map['historyID'];
  }
}
