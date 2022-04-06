import 'package:Baar/utils/all_enum.dart';
import 'package:Baar/utils/common_widget.dart';
import 'package:flutter/material.dart';

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
                        child: CommonUtils().customButton(Size(250, 44), Strings.signup, () {
                          print("testing");
                        }, 18)),
                  ],
                ))));
  }
}
