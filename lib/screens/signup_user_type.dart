import 'package:Baar/utils/all_enum.dart';
import 'package:Baar/utils/common_widget.dart';
import 'package:Baar/utils/custom_color.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../utils/common_utils.dart';
import '../utils/strings.dart';

class SignupUserTypePage extends StatefulWidget {
  const SignupUserTypePage({Key? key}) : super(key: key);

  @override
  State<SignupUserTypePage> createState() => _SignupUserTypePageState();
}

class _SignupUserTypePageState extends State<SignupUserTypePage> {
  UserType user = UserType.contractor;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _gatepassController = TextEditingController();

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
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 60, bottom: 15),
                      child: Text(Strings.selectUserType, style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Radio(
                          value: UserType.contractor,
                          groupValue: user,
                          onChanged: (UserType? value) {
                            setState(() {
                              user = value!;
                            });
                          },
                        ),
                        const Text(
                          Strings.contractor,
                          style: TextStyle(fontSize: 17.0),
                        ),
                        Radio(
                          value: UserType.tatasteel,
                          groupValue: user,
                          onChanged: (UserType? value) {
                            setState(() {
                              user = value!;
                            });
                          },
                        ),
                        const Text(
                          Strings.tataSteel,
                          style: TextStyle(fontSize: 17.0),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: width / 2,
                            padding: const EdgeInsets.only(left: 30, top: 30),
                            child: Text(
                              (user == UserType.contractor ? Strings.gatePassNumber : Strings.personalNumber) + Strings.colon,
                              style: const TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
                            )),
                        Container(
                            padding: const EdgeInsets.only(left: 10, right: 30, top: 30),
                            width: width / 2,
                            height: 55,
                            child: CommonUtils().customTextFormField(
                                _gatepassController, const TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: width / 2.0,
                            padding: const EdgeInsets.only(left: 30, top: 30),
                            child: const Text(
                              Strings.userName + Strings.colon,
                              style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
                            )),
                        Container(
                            padding: const EdgeInsets.only(left: 10, right: 30, top: 30),
                            width: width / 2,
                            height: 55,
                            child: CommonUtils().customTextFormField(
                                _userNameController, const TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: width / 2.0,
                            padding: const EdgeInsets.only(left: 30, top: 30),
                            child: const Text(
                              Strings.password + Strings.colon,
                              style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
                            )),
                        Container(
                            padding: const EdgeInsets.only(left: 10, right: 30, top: 30),
                            width: width / 2,
                            height: 55,
                            child: CommonUtils().customTextFormField(
                                _passwordController, const TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black))),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: width / 2.0,
                            padding: const EdgeInsets.only(left: 30, top: 30),
                            child: const Text(
                              Strings.confirmPassword + Strings.colon,
                              style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
                            )),
                        Container(
                            padding: const EdgeInsets.only(left: 10, right: 30, top: 30),
                            width: width / 2,
                            height: 55,
                            child: CommonUtils().customTextFormField(
                                _confirmPasswordController, const TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black))),
                      ],
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 200),
                        child: CommonUtils().customButton(const Size(250, 44), Strings.signup, () {
                          if (_gatepassController.text.toString().trim().isEmpty || _gatepassController.text.toString().trim() == "") {
                           showSnackBar( user == UserType.contractor? Strings.pleaseEnterGatePassNumber:Strings.pleaseEnterPersonalNumber, context);
                          } else if (_userNameController.text.toString().trim().isEmpty || _userNameController.text.toString().trim() == "") {
                            showSnackBar(Strings.pleaseEnterUsername, context);
                          }else if (_passwordController.text.trim().isEmpty || _passwordController.text.trim() == "") {
                            showSnackBar(Strings.pleaseEnterPassword, context);
                          } else if (_passwordController.text.trim().length <= 6) {
                            showSnackBar(Strings.passwordValid, context);
                          }else if (_confirmPasswordController.text.trim().isEmpty || _confirmPasswordController.text.trim() == "") {
                            showSnackBar(Strings.pleaseEnterConfirmPassword, context);
                          }else if (_confirmPasswordController.text.trim().length <= 6) {
                            showSnackBar(Strings.confirmPasswordValid, context);
                          }else if (_confirmPasswordController.text.trim() != _passwordController.text.trim()) {
                            showSnackBar(Strings.confirmPasswordNotMatch, context);
                          }else {
                            showSnackBar("Successfully", context);
                            Navigator.pushReplacementNamed(context, '/login');
                          }
                        }, 18)),
                    Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text.rich(TextSpan(
                            text: Strings.alreadyAccount,
                            style: const TextStyle(color: CustomColor.themeColor, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w500),
                            children: <InlineSpan>[
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => {
                                        Navigator.pushReplacementNamed(context, '/login'),
                                      },
                                text: Strings.login,
                                style: const TextStyle(color: CustomColor.navyBlue, fontSize: 14, fontFamily: 'Inter', fontWeight: FontWeight.w500),
                              )
                            ]))),
                  ],
                ))));
  }
}
