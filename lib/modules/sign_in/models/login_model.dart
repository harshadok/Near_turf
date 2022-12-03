class SigninModel {
  String userMail;
  String userPassword;
  SigninModel({required this.userMail, required this.userPassword});

  Map<String, dynamic> toJson() => {
        "user_mail": userMail,
        "user_password": userPassword,
      };
}

// class SignInResponse {
//   SignInResponse({
//     required this.status,
//     required this.massage,
//     required this.token,
//   });

//   bool status;
//   String massage;
//   String token;

//   factory SignInResponse.ftomJson(Map<String, dynamic> json) => SignInResponse(
//       status: json["status"],
//       massage: json["message"],
//       token: json["token"] ?? "No token");
// }
// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

// import 'dart:convert';

// Person personFromJson(String str) => Person.fromJson(json.decode(str));

// String personToJson(Person data) => json.encode(data.toJson());

class SignInResponse {
  SignInResponse({
    this.status,
    this.message,
    this.token,
    this.refreshToken,
    this.id,
  });

  bool? status;
  String? message;
  String? token;
  String? refreshToken;
  String? id;

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        refreshToken: json["refreshToken"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "refreshToken": refreshToken,
        "_id": id,
      };
}
