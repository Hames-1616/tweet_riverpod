import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/common/Error_page.dart';
import 'package:riverpod_learning/common/loading_page.dart';
import 'package:riverpod_learning/core/utils.dart';
import 'package:riverpod_learning/features/tweet/controller/tweet_controller.dart';

class TweetList extends ConsumerWidget {
  const TweetList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(getTweetsProvider).when(
        data: (tweets) {
          return ListView.builder(
              itemCount: tweets.length,
              itemBuilder: (context, index) {
                final tweet = tweets[index];
                return Text(tweet.text);
              });
        },
        error: (e, st) {
          
          return Error_text(error: e.toString());
        },
        loading: () => const loader());
  }
}
