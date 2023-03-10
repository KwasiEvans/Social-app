import 'package:circles/features/post/screens/add_post.dart';
import 'package:circles/features/post/screens/post_screens.dart';
import 'package:flutter/material.dart';

class Constants {
  static const logoPath = 'assets/images/logo.png';
  static const loginEmotePath = 'assets/images/loginEmote.png';
  static const googlePath = 'assets/images/google.png';

  static const bannerDefault =
      'https://networks.resonancehealth.org/assets/img/networks-home-default-banner.101f8026.jpeg';
  static const avatarDefault =
      'https://img.freepik.com/premium-vector/people-group-avatar-character-vector-illustration-design_24877-19936.jpg';

  static const tabWidgets = [
    FeedScreen(),
    AddPostScreen(),
  ];

  static const IconData up =
      IconData(0xe800, fontFamily: 'MyFlutterApp', fontPackage: null);
  static const IconData down =
      IconData(0xe801, fontFamily: 'MyFlutterApp', fontPackage: null);

  static const awardsPath = 'assets/images/awards';

  static const awards = {
    'awesomeAns': '${Constants.awardsPath}/awesomeanswer.png',
    'gold': '${Constants.awardsPath}/gold.png',
    'platinum': '${Constants.awardsPath}/platinum.png',
    'helpful': '${Constants.awardsPath}/helpful.png',
    'plusone': '${Constants.awardsPath}/plusone.png',
    'rocket': '${Constants.awardsPath}/rocket.png',
    'thankyou': '${Constants.awardsPath}/thankyou.png',
    'til': '${Constants.awardsPath}/til.png',
  };
}

const defaultSpacer = 16.0;
const defaultRadius = 12.0;
const appBackgroundColor = Colors.white;
const verticalSpacing = EdgeInsets.symmetric(vertical: defaultSpacer);
const horizontalSpacing = EdgeInsets.symmetric(horizontal: defaultSpacer);

Widget spaceWidget({required bool isFullSpace, required bool isVerticalSpace}) {
  if (!isVerticalSpace) {
    return SizedBox(
      width: isFullSpace ? defaultSpacer : defaultSpacer / 2,
    );
  }
  return SizedBox(
    height: isFullSpace ? defaultSpacer : defaultSpacer / 2,
  );
}
