class Seemoregift {
  late String status;
  late GiftData result;

  Seemoregift.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? '';
    result = GiftData.fromJson(json['result'] ?? {});
  }
}

class GiftData {
  late int noOfCans;
  late int noOfBottles;
  late double giftCoins;
  late double giftMoney;
  late DateTime createdAt;
  late String id;
  late String version;

  GiftData.fromJson(Map<String, dynamic> json) {
    noOfCans = json['noOfCans'] ?? 0;
    noOfBottles = json['noOfBottles'] ?? 0;
    giftCoins = json['giftCoins']?.toDouble() ?? 0.0;
    giftMoney = json['giftMoney']?.toDouble() ?? 0.0;
    giftMoney=double.parse(giftMoney.toStringAsFixed(2));
    createdAt = DateTime.parse(json['createdAt'] ?? '');
    id = json['_id'] ?? '';
    version = json['__v'].toString() ?? '0';
  }

  Map<String, dynamic> toJson() {
    return {
      'noOfCans': noOfCans,
      'noOfBottles': noOfBottles,
      'giftCoins': giftCoins,
      'giftMoney': giftMoney,
      'createdAt': createdAt.toIso8601String(),
      '_id': id,
      '__v': version,
    };
  }
}
