import 'package:Baar/main.dart';
import 'package:Baar/utils/common_utils.dart';
import 'package:Baar/utils/constants.dart';
import 'package:flutter/material.dart';
import '../utils/common_widget.dart';
import '../utils/custom_color.dart';
import '../utils/image.dart';
import '../utils/strings.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initialPref();

    Future.delayed(const Duration(seconds: 5),(){
      if((prefs?.getBool(Constants.LOGIN)??false)==true) Navigator.pushNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(preferredSize: const Size.fromHeight(80), child: CommonUtils().customAppBar(width, context, false)),
            body: SizedBox(
              width: width,
              height: height,
              child: Center(
                child: Column(
                  children: [
                    Padding(padding: const EdgeInsets.only(top: 90), child: Image.asset(Images.tataLogo)),
                    Padding(padding: const EdgeInsets.only(top: 20), child: Image.asset(Images.tataSteel)),
                    const SizedBox(height: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(left: 30, top: 00),
                            child: Text(
                              Strings.userName + ":",
                              style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
                            )),
                        Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            width: width / 2.0,
                            height:40,
                            child: CommonUtils().customTextFormField(
                                _userNameController, const TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black))),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              Strings.password + ":",
                              style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
                            )),
                        Container(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            width: width / 2.0,
                            height: 40,
                            child: CommonUtils().customTextFormField(_passwordController, const TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black))),
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.only(right: 70, top: 10),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              Strings.forgotPassword,
                              style: TextStyle(
                                  decoration: TextDecoration.underline, fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 12.0, fontWeight: FontWeight.w400, color: CustomColor.navyBlue),
                            ))),
                    Padding(
                        padding: const EdgeInsets.only(top: 130),
                        child: CommonUtils().customButton(const Size(250, 44), Strings.login, () {
                          if(_userNameController.text.toString().trim().isEmpty || _userNameController.text.toString().trim() == "" ) {
                            showSnackBar(Strings.please_enter_email,context);
                          } else if(!isValidEmail(_userNameController.text.toString().trim())) {
                            showSnackBar(Strings.please_enter_valid_email,context);
                          } else if(_passwordController.text.trim().isEmpty || _passwordController.text.trim() == "") {
                            showSnackBar(Strings.please_enter_password,context);
                          } else if(_passwordController.text.trim().length <=6) {
                            showSnackBar(Strings.password_valid,context);
                          } else {
                            prefs?.setBool(Constants.LOGIN, true);
                            Navigator.pushNamed(context, '/home');
                          }
                        }, 18)),
                    Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CommonUtils().customButton(const Size(250, 44), Strings.signup, () {
                          Navigator.pushNamed(context, '/second');
                        }, 18)),
                  ],
                ),
              ),
            )));
  }
}
