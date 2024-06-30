class LoginModel {
  late String status;
  late String message;
  late UserData? data;
  late String token;

  LoginModel.fromJson(Map<String, dynamic> json) //named constructor
  {
    status = json['status'] != null ?json['status']:''; //اللي جاي من ال response
   message = json['message'] != null ?json['message']:'';
    token = json['token'] != null ?json['token']:'' ;

    //عشان بعدد كده اقدر استخرج منه بقي
    data = json['data']['user'] != null ? UserData.fromJson(json['data']['user']) : null;
  }
}

class UserData {
  late String id;
  late List<dynamic> name;
  late String email;
  late String phone;
  late String image;
  late int points;
  late int credit ;


  UserData.fromJson(Map<String, dynamic> json) //named constructor
  {
    id = json['id']; //اللي جاي من ال response
    name = json['name'];
    email = json['email']; //عشان بعدد كده اقدر استخرج منه بقي
    phone = json['phoneNumber'];
    // image = json['image'];
    // points = json['points']!=null? json['points']:0;
    // credit = json['credit']!=null? json['credit']:0;





  }
}
