class AllTransaction {
  late String status;
  late int results;
  late List<Transaction> transaction;

  AllTransaction.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? '';
    results = json['results'] ?? 0; // Default to 0 if 'results' is null or missing
    if (json['data'] != null && json['data']['docs'] != null) {
      // Parse list of Transaction objects
      transaction = List<Transaction>.from(json['data']['docs'].map((x) => Transaction.fromJson(x)));
    } else {
      transaction = [];
    }
  }
}

class Transaction {
  late String gift;
  late String id;
  late String time;
  late Voucher? voucher; // Change to nullable Voucher
  late double transactionPoints;
  late User user; // Add User field

  Transaction.fromJson(Map<String, dynamic> json) {
    gift = json['gift'] ?? '';
    id = json['_id'] ?? '';
    time = json['time'] ?? '';
    transactionPoints = (json['transactionPoints'] ?? 0).toDouble();
    voucher = json['voucher'] != null ? Voucher.fromJson(json['voucher']) : null; // Handle nullable voucher
    user = json['user'] != null ? User.fromJson(json['user']) : null!; // Handle nullable user
  }
}

class Voucher {
  late String vouchername;
  late String voucherid;
  late String codeId;

  Voucher.fromJson(Map<String, dynamic> json) {
    vouchername = json['voucherName'] ?? ''; // Provide an empty string if 'voucherName' is null
    voucherid = json['voucherId'] ?? ''; // Provide an empty string if 'voucherId' is null
    codeId = json['codeId'] ?? ''; // Provide an empty string if 'codeId' is null
  }
}

class User {
  late String name;
  late String id;

  User.fromJson(Map<String, dynamic> json) {
    name = (json['name'] as List).join(' ') ?? ''; // Join list of names into a single string
    id = json['_id'] ?? '';
  }
}
