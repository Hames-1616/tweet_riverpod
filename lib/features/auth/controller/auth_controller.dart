import 'package:appwrite/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/apis/auth_api.dart';
import 'package:riverpod_learning/apis/user_api.dart';
import 'package:riverpod_learning/core/utils.dart';
import 'package:riverpod_learning/features/auth/view/login_view.dart';
import 'package:riverpod_learning/features/home/view/home_view.dart';
import 'package:riverpod_learning/models/user_model.dart';

//all the model conversion should take place in the controller

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(authapi: ref.watch(authAPIProvider),userApi: ref.watch(userapiprovider));
});


final currentUserDataProvider = FutureProvider((ref) {
  final currentID = ref.watch(currentuseraccountProvider).value!.$id;
  final userDetails = ref.watch(userDataProvider(currentID));
  return userDetails.value;
});


final userDataProvider = FutureProvider.family((ref,String uid) {
  final authcontroller = ref.watch(authControllerProvider.notifier).getuserdata(uid);
  return authcontroller;
});





final currentuseraccountProvider = FutureProvider((ref) {
  final authcontroller = ref.watch(authControllerProvider.notifier).currentuser();
  return authcontroller;
});



class AuthController extends StateNotifier<bool> {

  final UserApi _userApi;
  final Authapi _authapi;

  AuthController({required Authapi authapi,required UserApi userApi})
      : _authapi = authapi,_userApi=userApi,
        super(false);
  //isloading = state

  Future<User?> currentuser() => _authapi.currentUserAccount();


  void signUp(
      {required String email,
      required String password,
      required BuildContext context //for showing error
      }) async {
    state = true; //isloading is true
    final res = await _authapi.signUp(email: email, password: password);
    Future.delayed(const Duration(milliseconds: 500), () {
      state = false;
    });
    res.fold((l) => showSnackBar(context, l.message),
     (r) async{
      UserModel usermodel = UserModel(
      email: email,
       name: getnameFromEmail(email),
        followers: const [], following: const [], profilePic: '', coverPhoto: '', uid: '', bio: '', isBlue: false) ;

      final result = await _userApi.saveUserData(usermodel);
      result.fold((l){
        showSnackBar(context, l.message);
      },(r){
        showSnackBar(context, "Accout Created Please Login");
      Navigator.push(context, LoginView.route());
      });
      
    });
  }

  void login(
      {required String email,
      required String password,
      required BuildContext context}) async {
    state = true; //loading
    final res = await _authapi.login(email: email, password: password);
    state = false;
    res.fold((l) => showSnackBar(context, l.message), (r) {
      // showSnackBar(context, "Login Successfully");
      Navigator.push(context, HomeView.route());
    });
  }

  Future<UserModel> getuserdata(String uid) async{
    final document = await _userApi.getUserData(uid);
    final updatedUser = UserModel.fromMap(document.data);
    return updatedUser;

  }
}
