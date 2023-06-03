import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_learning/core/core.dart';
import 'package:riverpod_learning/core/providers.dart';

//for sign up ,want to get user account ->Account
//want to access user related data -> model account

final authAPIProvider = Provider((ref) {
  return Authapi(acc: ref.watch(appwriteAccountProvider));
});

abstract class IauthAPI {
  FutureEither<User> signUp({required String email, required String password});

  FutureEither<Session> login(
      {required String email, required String password});

  Future<User?> currentUserAccount();
  //while using future provider we cant use future either
}

class Authapi implements IauthAPI {
  final Account _account;
  Authapi({required Account acc}) : _account = acc;

  @override
  Future<User?> currentUserAccount() async{
    try{
       return await _account.get();
    }
    on AppwriteException catch(e,stackTrace)
    {
      return null;
    }
    catch(e,stackTrace){
      return null;
    }
  }



  @override
  FutureEither<User> signUp(
      {required String email, required String password}) async {
    try {
      final account = await _account.create(
          userId: ID.unique(), email: email, password: password);

      return right(account);
    } on AppwriteException catch (e, stackTrace) {
      return left(Failure(e.message ?? "error occured", stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }

//for logging u in
  @override
  FutureEither<Session> login(
      {required String email, required String password}) async {
    try {
      final session =
          await _account.createEmailSession(email: email, password: password);
      return right(session);
    } on AppwriteException catch (e, stackTrace) {
      return left(Failure(
          e.message ?? "error occured in session creation", stackTrace));
    } catch (e, stackTrace) {
      return left(Failure(e.toString(), stackTrace));
    }
  }
  
  
}
