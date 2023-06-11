import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/apis/storage_api.dart';
import 'package:riverpod_learning/apis/tweet_api.dart';
import 'package:riverpod_learning/core/enums/tweet_type_enum.dart';
import 'package:riverpod_learning/core/utils.dart';
import 'package:riverpod_learning/features/auth/controller/auth_controller.dart';
import 'package:riverpod_learning/features/tweet/widgets/tweet_list.dart';
import 'package:riverpod_learning/models/tweet_model.dart';



final getTweetsProvider = FutureProvider((ref) {
  return ref.watch(tweetControllerProvider.notifier).gettweets();
});

final tweetControllerProvider = StateNotifierProvider<TweetController,bool>((ref) {
  return TweetController(tweetapi: ref.watch(tweetapiProvider), ref: ref,storageApi: ref.watch(storageApiProvider));
});




class TweetController extends StateNotifier<bool> {
  final StorageApi _storageApi;
  final TweetApi _tweetapi;
  final Ref _ref;
  TweetController(
    {
      required TweetApi tweetapi,
      required Ref ref,
      required StorageApi storageApi
    }
  ) : _tweetapi=tweetapi,_ref =ref,_storageApi = storageApi ,super(false);


  Future<List<Tweet>> gettweets() async{
    final tweetsList = await _tweetapi.getTweets(); 
     return tweetsList.map((tweet) => Tweet.fromMap(tweet.data)).toList();
  }

  void shareTweet(
      {required List<File> images,
      required String text,
      required BuildContext context}) {
    if (text.isEmpty) {
      showSnackBar(context, "Please enter the text");
    }
    if (images.isNotEmpty) {
      shareImageTweet(images: images, text: text, context: context);
    } else {
      shareTextTweet(text: text, context: context);
    }
  }

  void shareImageTweet(
      {required List<File> images,
      required String text,
      required BuildContext context}) async{
         final user = _ref.watch(currentUserDataProvider).value!;
    state = true;
    final hastags = getHastags(text);
    String link = getLinkFromText(text);
    final imageLinks = await _storageApi.uploadImage(images);
    Tweet tweet = Tweet(text: text, hastags: hastags, link: link, imageLinks: imageLinks, uid: user.uid, tweetType: TweetType.image, tweetedAt: DateTime.now(), likes: [], commentIds: [], id: '', reshareCount: 0);
    final res = await _tweetapi.sharetweet(tweet);
    state = false;
    res.fold((l) => showSnackBar(context,l.message), (r) => null);
      }



  void shareTextTweet({required String text, required BuildContext context}) async{
    final user = _ref.watch(currentUserDataProvider).value!;
    state = true;
    final hastags = getHastags(text);
    String link = getLinkFromText(text);
    Tweet tweet = Tweet(text: text, hastags: hastags, link: link, imageLinks: [], uid: user.uid, tweetType: TweetType.text, tweetedAt: DateTime.now(), likes: [], commentIds: [], id: '', reshareCount: 0);
    final res = await _tweetapi.sharetweet(tweet);
    state = false;
    res.fold((l) => showSnackBar(context,l.message), (r) => null);
 
  }



  String getLinkFromText(String text) {
    List<String> wordsInSentence = text.split(' ');
    String link = "";
    for (String word in wordsInSentence) {
      if (word.startsWith('https://') || word.startsWith('www.')) {
        link = word;
      }
    }
    return link;
  }



  List<String> getHastags(String text) {
    List<String> wordsInSentence = text.split(' ');
    List<String> hastag = [];
    for (String word in wordsInSentence) {
      if (word.startsWith("#")) {
        hastag.add(word);
      }
    }
    return hastag;
  }
}
