import 'package:flutter/material.dart';
import 'package:chandran_steels/main.dart';
import 'package:chandran_steels/screen/DashBoardScreen.dart';
import 'package:chandran_steels/screen/ProductDetail/ProductDetailScreen1.dart';
import 'package:chandran_steels/utils/colors.dart';
import 'package:chandran_steels/utils/common.dart';
import 'package:chandran_steels/utils/constants.dart';
import 'package:chandran_steels/utils/images.dart';
import 'package:nb_utils/nb_utils.dart';

import 'WalkThroughScreen.dart';

class SplashScreen extends StatefulWidget {
  static String tag = '/SplashScreen';

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(isHalloween ? mChristmasColor : primaryColor!,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark);
    await Future.delayed(Duration(seconds: 2));

    String productId = await getProductIdFromNative();
    print(productId);

    if (productId.isNotEmpty) {
      ProductDetailScreen1(mProId: productId.toInt()).launch(context);
    } else {
      checkFirstSeen();
    }
  }

  Future checkFirstSeen() async {
    bool _seen = (getBoolAsync('seen'));
    if (_seen) {
      DashBoardScreen().launch(context, isNewTask: true);
    } else {
      await setValue('seen', true);
      WalkThroughScreen().launch(context, isNewTask: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Spacer(),
          Image.asset(splash, height: 150, fit: BoxFit.cover),
          SizedBox(height: 25,),
          Text(
            AppName,
            style: boldTextStyle(
                color: Theme.of(context).textTheme.titleSmall!.color, size: 26),
          ),
          // Spacer(),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       "Powered by",
          //       style: boldTextStyle(
          //           color: Theme.of(context).textTheme.displaySmall!.color,
          //           size: 14),
          //     ),
          //     SizedBox(width: 15),
          //     Image.asset(
          //       "images/chandran_steels/logo.webp",
          //       width: width * 0.3,
          //     )
          //   ],
          // ),
        ],
      ).center(),
    );
  }
}
