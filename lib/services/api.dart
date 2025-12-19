import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class Api {
  final String baseUrl;
  final String token;

  Api({required this.baseUrl, required this.token});

  Map<String, String> get _headers => {"Authorization": "Bearer $token"};

  Future<List<dynamic>> getList(
    String path, {
    Map<String, String>? query,
  }) async {
    final uri = Uri.parse("$baseUrl$path").replace(queryParameters: query);
    final res = await http.get(uri, headers: _headers);
    if (res.statusCode >= 400) throw Exception(res.body);
    return jsonDecode(res.body) as List<dynamic>;
  }

  Future<Map<String, dynamic>> postMultipart(
    String path, {
    required Map<String, String> fields,
    Uint8List? bytes,
    String? filename,
  }) async {
    final uri = Uri.parse("$baseUrl$path");
    final req = http.MultipartRequest("POST", uri);
    req.headers.addAll(_headers);
    req.fields.addAll(fields);

    if (bytes != null && filename != null) {
      req.files.add(
        http.MultipartFile.fromBytes("file", bytes, filename: filename),
      );
    }

    final streamed = await req.send();
    final body = await streamed.stream.bytesToString();

    if (streamed.statusCode >= 400) throw Exception(body);
    return jsonDecode(body) as Map<String, dynamic>;
  }

  Future<void> delete(String path) async {
    final uri = Uri.parse("$baseUrl$path");
    final res = await http.delete(uri, headers: _headers);
    if (res.statusCode >= 400) throw Exception(res.body);
  }
}
