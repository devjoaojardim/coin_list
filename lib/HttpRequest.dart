import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpRequestA {
  String baseUrl;

  HttpRequestA(this.baseUrl);


  Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erro ao realizar requisição GET: ${response.statusCode}');
    }
  }

  static Future<dynamic> postJson(String url, dynamic data) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Erro ao realizar requisição POST: ${response.statusCode}');
    }
  }
}