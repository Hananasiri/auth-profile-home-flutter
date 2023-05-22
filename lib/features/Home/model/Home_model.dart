class HomeModel {
  final String? id;
  final String title;
  final String description;
  final String date;

  HomeModel({
    this.id,
    required this.title,
    required this.description,
    required this.date,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      id: json["id"],
      title: json["title"],
      description: json["description"],
      date: json["date"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id" :id,
    "title": title,
    "description": description,
    "date": date,
  };
}