import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/core/utils.dart';

class TweetController extends StateNotifier<bool> {
  TweetController() : super(false);

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
      required BuildContext context}) {}



  void shareTextTweet({required String text, required BuildContext context}) {}



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
