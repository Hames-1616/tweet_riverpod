import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_learning/constants/appwrite_constants.dart';
import 'package:riverpod_learning/core/core.dart';
import 'package:riverpod_learning/core/providers.dart';
import 'package:riverpod_learning/models/user_model.dart';


final userapiprovider  = Provider((ref) {
  return UserApi(db: ref.watch(databaseProvider));
});


abstract class IUserAPI{
  FutureEitherVoid saveUserData(UserModel usermodel);
  Future<Document> getUserData(String uid);//getting the data present inside the db
}

class UserApi implements IUserAPI{
final Databases _db;
UserApi({
  required Databases db
}) : _db = db;

  @override
  FutureEitherVoid saveUserData(UserModel usermodel) async{
    try{
     await _db.createDocument(databaseId: AppwriteConstants.databaseId, collectionId: AppwriteConstants.collectionId, documentId: usermodel.uid, data: usermodel.toMap());
    return right(null);
    }
    on AppwriteException catch(e,stk)
    {
      return left(Failure(e.message
      ??"error occurede", stk));
    }
    catch(e,stk)
    {
      return left(Failure(e.toString(), stk));
    }
    
  }
  
  @override
  Future<Document> getUserData(String uid) {
    return _db.getDocument(databaseId: AppwriteConstants.databaseId, collectionId: AppwriteConstants.collectionId, documentId: uid);
  }

}