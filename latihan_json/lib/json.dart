import 'dart:convert';

void main(List<String> args) {
  const String jsonString = """
{
  "name" : "Muhammad Ahsani Nur Taqwimi",
  "email": "ahsani@gmail.com"
}
""";

  Map<String, dynamic> user = jsonDecode(jsonString);
  print("Hello, ${user['name']}");
  print("email, ${user['email']}");

  String json = jsonEncode(user);
  print("String json : $json");
}
