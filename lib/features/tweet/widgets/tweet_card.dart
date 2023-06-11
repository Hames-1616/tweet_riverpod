import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/common/Error_page.dart';
import 'package:riverpod_learning/common/loading_page.dart';
import 'package:riverpod_learning/features/auth/controller/auth_controller.dart';
import 'package:timeago/timeago.dart' as tim;

import '../../../models/tweet_model.dart';
class tweetCard extends ConsumerWidget {
  Tweet tweet;
  tweetCard({super.key,required this.tweet});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(userDataProvider(tweet.uid)).when(
      data: (user){
        return Column(children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                child: CircleAvatar(
                backgroundImage: NetworkImage(user.profilePic),
                radius: 25,
                          ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        
                        alignment: Alignment.topLeft,
                        child: Text(user.name),
                      ),
                
              Container(
                
                alignment: Alignment.topLeft,
                child:  Text("@${user.name}\t . \t${tim.format(tweet.tweetedAt)}",
                style: const TextStyle(color: Colors.white60),),
              ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(tweet.text),
                  )
                  ],
              ),
              ],
          )
        ],);
      },
       error: (e,st){
        return Error_text(error: e.toString());
       },
        loading: ()=> const loader());
  }
}