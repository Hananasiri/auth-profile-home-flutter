import 'dart:convert';
import 'package:http/http.dart' as http;

class ProfileService {

 final _client = http.Client();

 // GET request
 getData({required String url, required Map<String, String> headers}) async {
  try {
   final response = await _client.get(
    Uri.parse(url),
    headers: headers,
   );
   return jsonDecode(response.body);
  } catch (e) {
   throw Exception(e);
  }
 }
// Update
 updateData({
  required String url,
  required String id,
  required Map<String, dynamic> body,
  required Map<String, String> headers,
 }) async {
  try {
   final response = await _client.put(
    Uri.parse("$url/$id"),
    headers: headers,
    body: jsonEncode(body),
   );
   return jsonDecode(response.body);
  } catch (e) {
   throw Exception(e);
  }
 }
 }
