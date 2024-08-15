class HistoryTransaction {
  late int? transactionID;
  late String? transactionName;
  late int? totalPrice;
  late DateTime? dateTime;

  HistoryTransaction(
      {this.transactionID,
      required this.transactionName,
      required this.totalPrice,
      required this.dateTime});

  Map<String, dynamic> toMap() {
    return {
      'transactionID': transactionID,
      'transactionName': transactionName,
      'totalPrice': totalPrice,
      'dateTime': dateTime
    };
  }

  HistoryTransaction.fromMap(Map<String, dynamic> map) {
    transactionID = map['transactionID'];
    transactionName = map['transactionName'];
    totalPrice = map['totalPrice'];
    dateTime = map['dateTime'];
  }
}
