import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riverpod_learning/theme/pallete.dart';

import 'assets_constants.dart';

class UIconstants{
  static AppBar appBar(){
    return AppBar(
      title: SvgPicture.asset(AssetsConstants.twitterLogo,
      colorFilter: const ColorFilter.mode(Pallete.blueColor, BlendMode.srcIn,),
      height: 30,),
      centerTitle: true,
    );
  }

  static List<Widget>bottomPages=[
    const Text("First page"),
    const Text("Second Page"),
    const Text("3rd Page")
  ];
}