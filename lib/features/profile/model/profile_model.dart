
class ProfileModel {
  final String email;
  final String name;
  final int phoneNum;
  final String id;

  ProfileModel({
    required this.email,
    required this.name,
    required this.phoneNum,
    required this.id,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      email: json["email"],
      name: json["name"],
      phoneNum: json["phone_num"],
      id: json["id"],
    );
  }

  Map<String, dynamic> toJson() => {
    "email": email,
    "name": name,
    "phone_num": phoneNum,
    "id": id,
  };
}