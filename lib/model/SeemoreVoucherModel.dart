class Seemorevoucher {
  late String status;
  late VoucherData result;

  Seemorevoucher.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? '';
    result = VoucherData.fromJson(json['result'] ?? {});
  }
}

class VoucherData {
  late String voucherName;
  late int voucherMoney;
  late int voucherPoints;
  late String voucherCode;
  late String voucherPhoto;
  late String merchant;
  late String merchantPhoto;
  late DateTime redeemTime;

  VoucherData.fromJson(Map<String, dynamic> json) {
    voucherName = json['voucherName'] ?? '';
    voucherMoney = json['voucherMoney'] ?? 0;
    voucherPoints = json['voucherPoints'] ?? 0;
    voucherCode = json['voucherCode'] ?? '';
    voucherPhoto = json['voucherPhoto'] ?? '';
    merchant = json['merchant'] ?? '';
    merchantPhoto = json['merchantPhoto'] ?? '';
    redeemTime = DateTime.parse(json['redeemTime'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'voucherName': voucherName,
      'voucherMoney': voucherMoney,
      'voucherPoints': voucherPoints,
      'voucherCode': voucherCode,
      'voucherPhoto': voucherPhoto,
      'merchant': merchant,
      'merchantPhoto': merchantPhoto,
      'redeemTime': redeemTime.toIso8601String(),
    };
  }
}
