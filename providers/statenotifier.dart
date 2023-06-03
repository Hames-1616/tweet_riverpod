// ignore_for_file: public_member_api_docs, sort_constructors_first
//for statenotifier and statenotifier provider
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class user {
  final String name;
  final int age;

  user({
    required this.name,
    required this.age,
  });

  user copyWith({
    String? name,
    int? age,
  }) {
    return user(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
    };
  }

  factory user.fromMap(Map<String, dynamic> map) {
    return user(
      name: map['name'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory user.fromJson(String source) =>
      user.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'user(name: $name, age: $age)';

  @override
  bool operator ==(covariant user other) {
    if (identical(this, other)) return true;

    return other.name == name && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}
//generated with the help of data class

class usernotifer extends StateNotifier<user> {
  usernotifer(super.state);
   
   
  void updatename(String x) {
    //first approach
    // state = user(
    //     name: x,
    //     age: state
    //         .age); //lengthy approach have to enter every field eg for name we have to enter age also

    //second approach after making data class
    state = state.copyWith(
        name:
            x); //this syntax is very minimal but it requires making of data class => class generator extension
  }

  void updateage(String x) {
    state = state.copyWith(age: int.parse(x));
  }
}
