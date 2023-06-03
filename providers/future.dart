// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:http/http.dart' as http;

// class jsons {
//   final String name;
//   final String email;

//   jsons({required this.name, required this.email});

//   jsons copyWith({
//     String? name,
//     String? email,
//   }) {
//     return jsons(
//       name: name ?? this.name,
//       email: email ?? this.email,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'name': name,
//       'email': email,
//     };
//   }

//   factory jsons.fromMap(Map<String, dynamic> map) {
//     return jsons(
//       name: map['name'] as String,
//       email: map['email'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory jsons.fromJson(String source) =>
//       jsons.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() => 'jsons(name: $name, email: $email)';

//   @override
//   bool operator ==(covariant jsons other) {
//     if (identical(this, other)) return true;

//     return other.name == name && other.email == email;
//   }

//   @override
//   int get hashCode => name.hashCode ^ email.hashCode;
// }

// final jsorepopro = Provider((ref) => jsonrepo());//simple and better way instead of making the objeect of the repo class everytime

// class jsonrepo {
//   Future<jsons> fetch() {
//     const url = "https://jsonplaceholder.typicode.com/users/1";

//     return http.get(Uri.parse(url)).then((value) => jsons.fromJson(value.body));
//   }
// }
