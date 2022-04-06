
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

bool isValidEmail(String text) {
  return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(text);
}

showSnackBar(String message, BuildContext context){
  return  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Empty email")));
}


