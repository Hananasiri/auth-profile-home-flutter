
class AuthModel {
  final String email;
  final String name;
  final int phoneNum;
  final int birthDate;
  final String id;

  AuthModel({
    required this.email,
    required this.name,
    required this.phoneNum,
    required this.birthDate,
    required this.id,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json["email"],
      name: json["name"],
      phoneNum: json["phone_num"],
      birthDate: json["birth_date"],
      id: json["id"],
       );
  }

  Map<String, dynamic> toJson() => {
    "email": email,
    "name": name,
    "phone_num": phoneNum,
    "birth_date": birthDate,
    "id": id,
  };
}