import 'dart:io';
import 'package:chandran_steels/utils/constants.dart';

String? getBannerAdUnitId() {
  if (Platform.isIOS) {
    return bannerAdIdForIos;
  } else if (Platform.isAndroid) {
    return bannerAdIdForAndroid;
  }
  return null;
}

String? getInterstitialAdUnitId() {
  if (Platform.isIOS) {
    return interstitialAdIdForIos;
  } else if (Platform.isAndroid) {
    return InterstitialAdIdForAndroid;
  }
  return null;
}
