import 'package:http/http.dart' as http;
import 'dart:convert';

class UsersService {
  static final UsersService instance = UsersService._internal();
  UsersService._internal();

  final String baseUrl =
      'https://6818a0555a4b07b9d1d009f1.mockapi.io/api/crud/user';

  Future<List<dynamic>> getUsers() async {
    final response = await http.get(Uri.parse(baseUrl));
    print("RESPONSE BODY: ${response.body}");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<void> createUser(Map<String, dynamic> data) async {
    await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
  }

  Future<void> updateUser(String id, Map<String, dynamic> data) async {
    await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
  }

  Future<void> deleteUser(String id) async {
    await http.delete(Uri.parse('$baseUrl/$id'));
  }
}
