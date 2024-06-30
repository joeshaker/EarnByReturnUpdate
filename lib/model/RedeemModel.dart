import 'dart:convert';

class ApiResponse {
  late String status;
  late int results;
  late List<UserData> data;

  ApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? '';
    results = json['results'] ?? 0;
    if (json['data'] != null && json['data']['docs'] != null) {
      data = List<UserData>.from(json['data']['docs'].map((x) => UserData.fromJson(x)));
    } else {
      data = [];
    }
  }
}

class UserData {
  late String name;
  late String id;
  late String address;
  late String photos;
  late String branches;

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    id = json['_id'] ?? '';
    address = json['address'] ?? '';
    branches = json['branches'] ?? '';
    photos = json['merchantPhoto'] ?? '';
  }
}
