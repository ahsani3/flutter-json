import 'package:http/http.dart' as http;
import 'album.dart';
import 'dart:convert';

class NetworkManager {
  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load Album");
    }
  }

  Future<Album> createAlbum(String title) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'Application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'title': title,
        'userId': 1,
        'id': 101,
      }),
    );

    if (response.statusCode == 201) {
      return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create album');
    }
  }
}
