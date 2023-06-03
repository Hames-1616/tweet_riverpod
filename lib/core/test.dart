import 'package:appwrite/appwrite.dart';

void appwritetest() { // Init SDK
Client client = Client();
Account account = Account(client);
client
    .setEndpoint('http://192.168.29.240/v1')
    .setProject('6465120014df556e779f')
    .setSelfSigned(status: true);
  Future result = account.create(
    userId: '[USER_ID]',
    email: 'email@example.com',
    password: '',
  );

  result
    .then((response) {
      print(response);
    }).catchError((error) {
      print(error.response);
  });
}
