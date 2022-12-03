class SignupModel {
  String email;
  String pass;

  SignupModel({required this.email, required this.pass});
  Map<String, dynamic> toJson() => {
        "user_mail": email,
        "user_password": pass,
      };
}

class SignupResponce {
  bool status;
  String? id;

  SignupResponce({this.id, required this.status});

  factory SignupResponce.fromJson(Map<String, dynamic> json) =>
      SignupResponce(id: json["id"], status: json["status"]);
}
