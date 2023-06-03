 import 'package:flutter_riverpod/flutter_riverpod.dart';
 import 'package:riverpod_learning/future.dart';
 import 'package:riverpod_learning/statenotifier.dart';
 import 'package:http/http.dart' as http;
 import 'package:dio/dio.dart';

import 'statenotifier.dart';

// //provider
// final nameProvider = Provider((ref) {
//   return "haamid";
// });

// //stateprovider
// final test = StateProvider<String?>((ref) => null);

// //statenotifier and state notifier provider+
 final usr = StateNotifierProvider<usernotifer, user>(
     (ref) => usernotifer(user(name: "", age: 0)));
// //defining is performed so that it return value as usernotifier and user not as usernotifier and object

// //future provider
// //moved to class model for better usage and understanding and here we will be calling the class
// final fetchusr = FutureProvider((ref) => jsonrepo().fetch());
// //or another way of doing it without having to create an object everytime
// final fetchu = FutureProvider((ref) {
//   final userrepos = ref.watch(jsorepopro);
//   return userrepos.fetch();
// });

// final streampr = StreamProvider((ref) async* {
//   yield [1, 2, 3, 4, 5, 6, 7, 8];
// });
