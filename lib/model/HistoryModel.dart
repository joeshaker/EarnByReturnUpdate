class History {
  late String status;
  late int results;
  late List<Transaction> transaction;

  History.fromJson(Map<String, dynamic> json) {
    status = json['status']??'';
    results = json['results']??0;
    if (json['data'] != null && json['data']['transactions'] != null) {
      // Parse list of UserData objects
      transaction = List<Transaction>.from(json['data']['transactions'].map((x) => Transaction.fromJson(x)));
    } else {
      transaction = [];
    }
  }
}

class Transaction {
  late String gift;
  late String id;
  late String time;
  late Voucher? voucher;// Change to nullable Voucher
  late double transactionPoints;

  Transaction.fromJson(Map<String, dynamic> json) {
    gift = json['gift'] ?? '';
    id = json['_id'] ?? '';
    time = json['time'] ?? '';
    transactionPoints = (json['transactionPoints'] ?? 0).toDouble();
    voucher = json['voucher'] != null ? Voucher.fromJson(json['voucher']) : null; // Handle nullable voucher
  }
}


class Voucher {
  late String vouchername;
  late String voucherid;
  Voucher.fromJson(Map<String, dynamic> json) {
    vouchername = json['voucherName'] ?? ''; // Provide an empty string if 'name' is null
    voucherid = json['voucherId'] ?? '';
    // Provide an empty string if '_id' is null

  }
}

