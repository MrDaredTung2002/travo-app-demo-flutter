import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:travo_app_demo/core/helpers/image_helper.dart';
import 'package:travo_app_demo/core/helpers/asset_helper.dart';
import 'package:travo_app_demo/core/helpers/local_storage_helper.dart';
import 'package:travo_app_demo/representation/screens/home_screen.dart';
import 'package:travo_app_demo/representation/screens/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const routerName = "splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirectIntroScreen();
  }

  void redirectIntroScreen() async {
    // ignore: unused_local_variable
    final ignoreIntroScreen =
        LocalStorageHelper.getValue("ignoreIntroScreen") is bool;
    await Future.delayed(const Duration(seconds: 2));
    // ignore: use_build_context_synchronously
    if (ignoreIntroScreen) {
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, IntroScreen.routerName);
    } else {
      LocalStorageHelper.setValue("ignoreIntroScreen", true);
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, IntroScreen.routerName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageHepler.loadFromAsset(AssetHelper.imageBackgroundSplash),
        ),
        Positioned.fill(
            child: ImageHepler.loadFromAsset(
                AssetHelper.imageCricleBackgroundSplash))
      ],
    );
  }
}
