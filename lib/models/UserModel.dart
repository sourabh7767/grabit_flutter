import 'dart:convert';

class User {
  User(
      {required this.email,
      required this.phoneNumber,
      required this.username,
      required this.id,
      required this.token,
      this.firstName,
      this.lastName,
      this.dob,
      this.gender});

  final String email;
  final String phoneNumber;
  final String username;
  final int id;
  final String token;
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? dob;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        email: json["email"],
        phoneNumber: json["phone_number"],
        username: json["username"],
        id: json["id"],
        token: json["token"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        dob: json["dob"],
        gender: json["gender"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "phone_number": phoneNumber,
        "username": username,
        "id": id,
        "token": token,
        "first_name": firstName,
        "last_name": lastName,
        "gender": dob,
        "dob": dob,
      };
}
