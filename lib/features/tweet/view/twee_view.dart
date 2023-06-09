import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpod_learning/common/loading_page.dart';
import 'package:riverpod_learning/common/rounded_smol_buttton.dart';
import 'package:riverpod_learning/constants/assets_constants.dart';
import 'package:riverpod_learning/core/utils.dart';
import 'package:riverpod_learning/features/auth/controller/auth_controller.dart';
import 'package:riverpod_learning/features/tweet/controller/tweet_controller.dart';
import 'package:riverpod_learning/theme/theme.dart';

class CreateTweet extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(builder: (context)=>const CreateTweet());
  const CreateTweet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateTweetState();
}

class _CreateTweetState extends ConsumerState<CreateTweet> {
  List<File> images=[];
  void onPickImages()
  async{
    images = await pickimages();
    setState(() {
      
    });//for rebuilding the widget
  }
  void shareTweet(){
    ref.read(tweetControllerProvider.notifier).shareTweet(images: images, text: tweettextController.text, context: context);
  }

  final tweettextController = TextEditingController();

  @override
  void dispose() {
    tweettextController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    final currentUser = ref.watch(currentUserDataProvider).value;
    final isloading = ref.watch(tweetControllerProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.close,color: Pallete.whiteColor,)),
        actions: [
          
          Roundedsmall(onTap: shareTweet, label: "Tweet", bgcolor: Pallete.blueColor, txtcolor: Pallete.whiteColor)
        ],
      ),
      body: 
      isloading||currentUser == null?const loader() 
      :SafeArea(child: SingleChildScrollView(
        child: 
        Column(children: [
         Row(
          children: [
            const SizedBox(width: 15,),
             CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(currentUser.profilePic),),
              const SizedBox(width: 15,),
              Expanded(
                child: TextField(
                  maxLines: null,
                  // maxLines: (MediaQuery.of(context).size.height).toInt() , doing this makes picture disappear
                  controller: tweettextController,
                  style: const TextStyle(
                    fontSize: 22
                  ),
                  decoration: const InputDecoration(
                    hintText: "What's happening",
                    hintStyle: TextStyle(color: Pallete.greyColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w600
                    ),
                    border: InputBorder.none
                  ),
                  
                ),
              )
          ],
         ),
         if(images.isNotEmpty)
          CarouselSlider(
            items:images.map(
              (file) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                width: MediaQuery.of(context).size.width,
                child: Image.file(file));
            }).toList(), 
           options: CarouselOptions(
             enableInfiniteScroll: true,
            height: 450
           ))
        ]),
      )),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 0.3,
              color: Pallete.greyColor
            ),
          )
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(
                left: 15,
                right: 15
              ),
              child: GestureDetector(
                onTap: onPickImages,
                child: SvgPicture.asset(AssetsConstants.galleryIcon)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(
                left: 15,
                right: 15
              ),
              child: SvgPicture.asset(AssetsConstants.gifIcon),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(
                left: 15,
                right: 15
              ),
              child: SvgPicture.asset(AssetsConstants.emojiIcon),
            )
      
          ],
        ),
      ),
    );
  }
}