import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpod_learning/constants/constants.dart';
import 'package:riverpod_learning/features/tweet/view/twee_view.dart';

import '../../../theme/pallete.dart';


class HomeView extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (conetext)=>const HomeView());
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _page =0;
  final appbar = UIconstants.appBar();

  void change(int index)
  {
    setState(() {
      _page = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:appbar,
      body: IndexedStack(
        index: _page,
        children: UIconstants.bottomPages,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, CreateTweet.route());
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: const Icon(Icons.add,color: Pallete.whiteColor,
      ),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: _page,
        backgroundColor: Pallete.backgroundColor,
        items: [
        BottomNavigationBarItem(icon: SvgPicture.asset(
          _page==0?AssetsConstants.homeFilledIcon:AssetsConstants.homeOutlinedIcon
          , colorFilter: _page==0?const ColorFilter.mode(Pallete.whiteColor, BlendMode.srcIn,):const ColorFilter.mode(Pallete.blueColor, BlendMode.srcIn,))),
         BottomNavigationBarItem(icon: SvgPicture.asset(_page==1?AssetsConstants.searchIcon:AssetsConstants.searchIcon
          , colorFilter: _page==1?const ColorFilter.mode(Pallete.whiteColor, BlendMode.srcIn,):const ColorFilter.mode(Pallete.blueColor, BlendMode.srcIn,))),
         BottomNavigationBarItem(icon: SvgPicture.asset(_page==2?AssetsConstants.notifFilledIcon:AssetsConstants.notifOutlinedIcon
          , colorFilter: _page==2?const ColorFilter.mode(Pallete.whiteColor, BlendMode.srcIn,):const ColorFilter.mode(Pallete.blueColor, BlendMode.srcIn,)))
      ],
      onTap: change),
    );
  }
}
