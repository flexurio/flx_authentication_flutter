abstract class User {
  User({required this.id, required this.name});

  final dynamic id;
  final String name;

  Map<String, dynamic> toJson();

  static User? fromJson(Map<String, dynamic> data) {
    return null;
  }
}
