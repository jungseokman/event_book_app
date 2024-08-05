import 'dart:convert';

class User {
  User({
    required this.email,
    required this.age,
  });

  final String email;
  final String age;

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'age': age,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      email: map['email'] ?? '',
      age: map['age'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  User copyWith({
    String? email,
    String? age,
  }) {
    return User(
      email: email ?? this.email,
      age: age ?? this.age,
    );
  }

  @override
  String toString() => 'User(email: $email, age: $age)';
}
