import 'dart:convert';

String getRoleFromJwt(String token) {
  final parts = token.split('.');
  if (parts.length != 3) return 'student';

  final payload = jsonDecode(
    utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))),
  );

  return payload['role'] ?? 'student';
}
