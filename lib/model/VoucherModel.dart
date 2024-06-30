import 'dart:convert';

class ApiResponse {
  late String status;
  late int results;
  late List<VoucherData> data;

  ApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? '';
    results = json['results'] ?? 0;
    if (json['data'] != null && json['data']['docs'] != null) {
      data = List<VoucherData>.from(json['data']['docs'].map((x) => VoucherData.fromJson(x)));
    } else {
      data = [];
    }
  }
}

class VoucherData {
  late String id;
  late bool active;
  late int voucherPoints;
  late int voucherMoney;
  late int validDays;
  late String voucherName;
  late String voucherPhoto;
  late String expiryDate;
  late String createdAt;
  late double remainingDays;
  late Merchant merchant;

  VoucherData.fromJson(Map<String, dynamic> json) {
    id = json['_id'] ?? '';
    active = json['active'] ?? false;
    voucherPoints = json['voucherPoints'] ?? 0;
    voucherMoney = json['voucherMoney'] ?? 0;
    validDays = json['validDays'] ?? 0;
    voucherName = json['voucherName'] ?? '';
    voucherPhoto = json['voucherPhoto'] ?? '';
    expiryDate = json['expiryDate'] ?? '';
    createdAt = json['createdAt'] ?? '';
    remainingDays = json['remainingDays']?.toDouble() ?? 0.0;
    merchant = json['merchant'] != null ? Merchant.fromJson(json['merchant']) : Merchant();
  }
}

class Merchant {
  late String merchantPhoto;
  late String id;
  late String name;

  Merchant({
    this.merchantPhoto = '',
    this.id = '',
    this.name = '',
  });

  Merchant.fromJson(Map<String, dynamic> json) {
    merchantPhoto = json['merchantPhoto'] ?? '';
    id = json['_id'] ?? '';
    name = json['name'] ?? '';
  }
}
