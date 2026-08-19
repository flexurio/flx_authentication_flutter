class UserDepartment {
  const UserDepartment({
    required this.id,
    required this.name,
  });

  factory UserDepartment.fromJson(Map<String, dynamic> json) {
    return UserDepartment(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );
  }

  factory UserDepartment.empty() => const UserDepartment(id: '', name: '');

  final String id;
  final String name;

  UserDepartment copyWith({String? id, String? name}) {
    return UserDepartment(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() => {'id': id, 'name': name};

  @override
  String toString() => name;
}
