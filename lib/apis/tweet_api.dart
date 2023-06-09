
import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_learning/constants/appwrite_constants.dart';
import 'package:riverpod_learning/core/core.dart';
import 'package:riverpod_learning/core/providers.dart';
import 'package:riverpod_learning/models/tweet_model.dart';

final tweetapiProvider = Provider((ref) {
  return TweetApi(db: ref.watch(databaseProvider));
});

abstract class Itweetapi{
  FutureEither<Document> sharetweet(Tweet tweet);
}

class TweetApi implements Itweetapi{
  final Databases _db;
  TweetApi({
    required Databases db
  }) : _db = db;

  @override
  FutureEither<Document> sharetweet(Tweet tweet) async{
    try {
      final document = await _db.createDocument(
        databaseId: AppwriteConstants.databaseId,
         collectionId: AppwriteConstants.tweetCollectiton, documentId:ID.unique(), data: tweet.toMap());

         return right(document);
    } on AppwriteException catch(e,st){
    return left(Failure(e.message ?? "Error occured", st));
    }
    catch (e,st) {
      return left(Failure(e.toString(), st));
    } 
    }

}