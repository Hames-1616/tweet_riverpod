// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_learning/get_user.dart';
// import 'package:riverpod_learning/user_test.dart';
// import 'package:riverpod_learning/provider.dart';

// import 'provider.dart';

// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//           // This is the theme of your application.
//           //
//           // Try running your application with "flutter run". You'll see the
//           // application has a blue toolbar. Then, without quitting the app, try
//           // changing the primarySwatch below to Colors.green and then invoke
//           // "hot reload" (press "r" in the console where you ran "flutter run",
//           // or simply save your changes to "hot reload" in a Flutter IDE).
//           // Notice that the counter didn't reset back to zero; the application
//           // is not restarted.
//           primarySwatch: Colors.blue,
//           scaffoldBackgroundColor: Colors.white),
//       home:  const MyWidget(),
//     );
//   }
// }

// class MyWidget extends ConsumerWidget {
//   const MyWidget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {


//     final usrselect = ref.watch(usr.select((value) => usr.name));//select option will update the widget only when name value is changed
//     final usri =
//         ref.watch(usr); //3 statenotifier and stn provider for reading value
//     //if in the provider i havent specified the retutn type then it will return as object and here an error will be generated
//     // and we have to use "as Classname" with it everytime

//     final titl = ref.watch(test) ?? ""; //2 stateprovider
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(usri.name),
//       ),
//       body: Column(
//         children: [
//           TextField(
//             onSubmitted: (value) {
//               ref.read(usr.notifier).updateage(value); //3 for writing value
//             },
//           ),
//           TextField(
//             style: const TextStyle(color: Colors.black),
//             onSubmitted: (value) {
//               ref
//                   .read(usr.notifier)
//                   .updatename(value); //3 statenotifer provider

//               //  ref.read(test.notifier).update((state) => value); //2 state provider
//             },
//           ),
//           Center(
//             child: Text(
//               usri.age.toString(),
//               style: const TextStyle(fontSize: 20),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
