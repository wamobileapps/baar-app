import 'package:Baar/main.dart';
import 'package:Baar/utils/common_utils.dart';
import 'package:Baar/utils/constants.dart';
import 'package:flutter/material.dart';
import '../utils/common_widget.dart';
import '../utils/custom_color.dart';
import '../utils/image.dart';
import '../utils/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    initialPref();

    Future.delayed(const Duration(seconds: 1),(){
      if((prefs?.getBool(Constants.LOGIN)??false)==true) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
            resizeToAvoidBottomInset: false,
           body: Container(
             color: CustomColor.themeColor,
              width: width,
              height: height,
              child: Center(
                child: Image.asset(Images.baarLogo),
              ),
            ));
  }
}
