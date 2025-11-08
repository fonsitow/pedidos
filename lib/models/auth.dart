import 'dart:convert';

class Authentication {
  final String id;
  final String accessToken;
  final String tokenType;
  final String userEmail;

  Authentication({
    required this.id,
    required this.accessToken,
    required this.tokenType,
    required this.userEmail,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'accessToken': accessToken,
      'tokenType': tokenType,
      'userEmail': userEmail,
    };
  }

  factory Authentication.fromMap(Map<String, dynamic> map) {
    return Authentication(
      id: map['id'] as String,
      accessToken: map['accessToken'] as String,
      tokenType: map['tokenType'] as String,
      userEmail: map['userEmail'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Authentication.fromJson(String source) =>
      Authentication.fromMap(json.decode(source) as Map<String, dynamic>);
}
