import 'dart:convert';

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}

void main(List<String> args) {
  const String jsonString = """
{
  "name" : "Muhammad Ahsani Nur Taqwimi",
  "email": "ahsani@gmail.com"
}
""";

  Map<String, dynamic> userMap = jsonDecode(jsonString);
  var user = User.fromJson(userMap);

  print("Hello, ${user.name}");
  print("email, ${user.email}");

  String json = jsonEncode(user);
  print("String json : $json");
}
