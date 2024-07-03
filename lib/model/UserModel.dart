// class UserModel {
//   late String message;
//   late String status;
//   late Data data;
//
//   UserModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'] ?? '';
//     message = json['message'] ?? '';
//     data = (json['data']('data') )?? '';
//   }
// }
// class init{
//    List<Data>dataa=[];
//    init.fromJson(Map<String, dynamic> json) {
//      json['data'].forEach((elment){
//        dataa.add(elment);
//      });
//    }
//
// }
//
//
// class Data {
//   late String id;
//   late List<String> name;
//   late Wallet wallet;
//
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['_id'];
//     name = (json['name'] as List<dynamic>).map((e) => e.toString()).toList();
//     wallet = Wallet.fromJson(json['wallet']);
//   }
// }
//
// class Wallet {
//   late double coins;
//   late double money;
//   Wallet.fromJson(Map<String, dynamic> json) {
//     coins = (json['Coins'] ?? 0.0).toDouble();
//     money = (json['Money'] ?? 0.0).toDouble();
//     // canCount = json['canCount'] ?? 0;
//     // bottleCount = json['bottleCount'] ?? 0;
//     // updatedAt = json['updatedAt'] ?? '';
//   }
// }


// class ApiResponse {
//   late String status;
//   late List<UserData> data;
//
//   ApiResponse.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = List<UserData>.from(json['data']['data']);
//     } else {
//       data = [];
//     }
//   }
// }
class ApiResponse {
  late String status;
  late List<UserData> data;

  ApiResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null && json['data']['data'] != null) {
      data = [UserData.fromJson(json['data']['data'][0])];
    } else {
      data = [];
    }
  }
}

class UserData {
  late Wallet wallet;
  late List<String> name;
  String? userPhoto;
  late String role;
  late String passwordChangedAt;
  late int machineVisits;
  late String id;
  late String email;
  late String phoneNumber;
  late int? verificationCode; // Nullable to handle potential null values

  UserData.fromJson(Map<String, dynamic> json) {
    wallet = Wallet.fromJson(json['wallet']);
    name = List<String>.from(json['name'].map((x) => x.toString()));
    userPhoto = json['userPhoto'];
    role = json['role'];
    passwordChangedAt = json['passwordChangedAt'];
    machineVisits = json['machineVisits'];
    id = json['_id'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    verificationCode = json['verificationCode'] ?? 0; // Provide a default value if null
  }
}

class Wallet {
  late double coins;
  late double money;
  late int canCount;
  late int bottleCount;
  late String updatedAt;

  Wallet.fromJson(Map<String, dynamic> json) {
    coins = (json['Coins'] is int) ? (json['Coins'] as int).toDouble() : (json['Coins'] ?? 0.0);
    money = (json['Money'] is int) ? (json['Money'] as int).toDouble() : (json['Money'] ?? 0.0);
    money=double.parse(money.toStringAsFixed(2));
    canCount = json['canCount'] ?? 0; // Provide a default value if null
    bottleCount = json['bottleCount'] ?? 0; // Provide a default value if null
    updatedAt = json['updatedAt'];
  }
}


