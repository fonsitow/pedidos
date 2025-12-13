import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Profile {
  final String fullname;
  final String username;
  final String avatarUrl;
  
  Profile({
    required this.fullname,
    required this.username,
    required this.avatarUrl,
  });
  


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullname': fullname,
      'username': username,
      'avatarUrl': avatarUrl,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      fullname: map['fullname'] as String,
      username: map['username'] as String,
      avatarUrl: map['avatarUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Profile.fromJson(String source) => Profile.fromMap(json.decode(source) as Map<String, dynamic>);
}
