// // 921e8c149a1f770b1394a2f4742f1cf2b8986ab3f2ca4329b102c93eff1a416a33d4040e7ee20d1ecb91a838aa974d6532c03a25142f6f2035ae2af4c6ccce2ea335b56a1ad752f14d1f61ded760045b1cbb0df32f10129b2dd23760f919dee76302af11d3ba9f928ab1b32960e1f17a60574561af1ebf398649fd4a5413594a
// import 'package:appwrite/appwrite.dart';

// void userfind() async {
//   // Init SDK
//   Client client = Client();
//   Users users = Users(client);

//   client
//           .setEndpoint('http://192.168.29.240/v1/users') // Your API Endpoint
//           .setProject('642d8bba20613f61b04f') // Your project ID
//           .setKey(
//               '921e8c149a1f770b1394a2f4742f1cf2b8986ab3f2ca4329b102c93eff1a416a33d4040e7ee20d1ecb91a838aa974d6532c03a25142f6f2035ae2af4c6ccce2ea335b56a1ad752f14d1f61ded760045b1cbb0df32f10129b2dd23760f919dee76302af11d3ba9f928ab1b32960e1f17a60574561af1ebf398649fd4a5413594a') // Your secret API key
//       ;

//   Future result = users.list(search: Query.equal('email', 'email@example.com'));

//   result.then((response) {
//     print(response.users[0].toMap());
//   }).catchError((error) {
//     print(error.response);
//   });
// }
