import 'package:fanchat/constants/app_colors.dart';
import 'package:fanchat/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:hexcolor/hexcolor.dart';

import 'login_screen.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   SplashScreenView(
      navigateRoute: LoginScreen(),
      duration: 200,
      imageSize: 170,
      imageSrc: "assets/images/worldcup.jpg",
      text: 'Fan-chat',
      textType: TextType.ColorizeAnimationText,
      textStyle: const TextStyle(
        fontSize: 35.0,
        fontFamily: 'komax',
      ),
      colors: [
        AppColors.primaryColor,
        AppColors.primaryColor,
      ],
      backgroundColor:AppColors.myWhite,
    );
  }
}
