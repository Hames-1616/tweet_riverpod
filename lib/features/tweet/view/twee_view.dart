import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learning/common/loading_page.dart';
import 'package:riverpod_learning/common/rounded_smol_buttton.dart';
import 'package:riverpod_learning/features/auth/controller/auth_controller.dart';
import 'package:riverpod_learning/theme/theme.dart';

class CreateTweet extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(builder: (context)=>const CreateTweet());
  const CreateTweet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateTweetState();
}

class _CreateTweetState extends ConsumerState<CreateTweet> {
  @override
  Widget build(BuildContext context) {
    final currentUser = ref.watch(currentUserDataProvider).value;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.close,color: Pallete.whiteColor,)),
        actions: [
          
          Roundedsmall(onTap: (){}, label: "Tweet", bgcolor: Pallete.blueColor, txtcolor: Pallete.whiteColor)
        ],
      ),
      body: 
      currentUser == null?const loader() 
      :SafeArea(child: SingleChildScrollView(
        child: Column(children: [
         Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(currentUser.coverPhoto),)
          ],
         )
        ]),
      )),
    );
  }
}