class User {
  int id;
  String email;
  String first_name;
  String last_name;
  String avt;
  User({required this.id, required this.email, required this.first_name, required this.last_name, required this.avt});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      avt: json['avatar'],
    );
  }
}
