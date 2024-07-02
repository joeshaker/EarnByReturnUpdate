class VoucherModelDetail {
  late String status;
  late String message;
  late String code;

  VoucherModelDetail.fromJson(Map<String, dynamic> json) {
    status = json['status'] != null ? json['status'] : '';
    message = json['message'] != null ? json['message'] : '';
    code = json['code'] != null ? json['code'] : '';
  }
}