import 'package:Baar/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'image.dart';
import 'strings.dart';

class CommonUtils {
  Widget customTextFormField(TextEditingController controller, TextStyle textStyle) {
    return TextFormField(
      
      controller: controller,
      maxLines: 1,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(5.0),
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: CustomColor.darkBlue,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(
            color: CustomColor.darkBlue,
            width: 2.0,
          ),
        ),
      ),
      style: textStyle,
    );
  }

  Widget customButton(Size size, String buttonText, VoidCallback onTap, double sizeFont) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      primary: Colors.white,
      fixedSize: size,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      backgroundColor: CustomColor.darkBlue,
    );
    return TextButton(
      style: flatButtonStyle,
      onPressed: onTap,
      child: Text(buttonText, textAlign: TextAlign.center, style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: sizeFont, fontWeight: FontWeight.w600, color: Colors.white)),
    );
  }

  Widget customAppBar(double width, BuildContext context, bool status) {
    return AppBar(
      leading: GestureDetector(
          onTap: () {
            if (status) Navigator.pop(context);
          },
          child: Icon(
            Icons.menu,
            color: status ? Colors.white : CustomColor.themeColor,
          )),
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      title: const Text(Strings.appName),
      centerTitle: true,
      backgroundColor: CustomColor.themeColor,
      actions: <Widget>[
        Padding(
            padding: const EdgeInsets.only(right: 16, bottom: 7),
            child: Image.asset(
              Images.baarLogo,
              width: width / 4,
              alignment: Alignment.bottomRight,
            ))
      ],
    );
  }

  Widget commonRowField(double width, TextEditingController fieldController, String number, VoidCallback onTap,VoidCallback onCameraTap, bool isActive) {
    return Padding(
        padding:  EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Text(
              Strings.field + number.toString(),
              style:  TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                width: width / 2,
                height: 35,
                child: CommonUtils().customTextFormField(fieldController,  TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black))),
            GestureDetector(onTap:onCameraTap,child:Icon(Icons.camera_alt, color: Colors.black, size: width / 10)),
            const SizedBox(width: 10),
              GestureDetector(
                  onTap: onTap,
                  child: Image.asset(
                    Images.voice,
                    color: isActive ? Colors.red: Colors.black,
                    width: width / 13,
                    height: width / 13,
                  ))
          ],
        ));
  }
  Widget commonRowTextField(bool isCameraShow, bool isAudioShow, double width, TextEditingController fieldController, String text, VoidCallback onTap) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Container(
                width: width / 3,
                child: Text(
                  text,
                  style: const TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
                )),
            Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                width: width / 2.5,
                height: 35,
                child: CommonUtils()
                    .customTextFormField(fieldController, const TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black))),
            Visibility(visible: isCameraShow, child: Icon(Icons.camera_alt, color: Colors.black, size: width / 10)),
            const SizedBox(width: 10),
            Visibility(
                visible: isAudioShow,
                child: GestureDetector(
                    onTap: onTap,
                    child: Image.asset(
                      Images.voice,
                      color: Colors.black,
                      width: width / 13,
                      height: width / 13,
                    )))
          ],
        ));
  }

  Widget commonRowWidget(int isSelected, int i, String text, Function() onClick, double height, double width) {
    var selectedColor = Colors.black;
    var selectedTextColor = Colors.white;

    return GestureDetector(
        onTap: onClick,
        child: Container(
            alignment: Alignment.center,
            color: isSelected == i ? selectedColor : selectedTextColor,
            height: height,
            width: width / 5.91,
            child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 12.0, fontWeight: FontWeight.w500, color: isSelected == i ? selectedTextColor : selectedColor))));
  }

  showBottomSheetImagePicker(BuildContext context, double width,){
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Stack(children: [
                  Container(
                    width: 80,
                      height:80,
                      decoration:BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                        border: Border.all(
                          width: 3,
                          color: Colors.green,
                          style: BorderStyle.solid,
                        ),
                      ),child:Container()),
                  Container(height:50,width:50,child:Image.asset(Images.camera,width: 50,))
                ],),

                Image.asset(Images.picture,width: width/9,)
              ],
            ),
          ),
        );
      },
    );
  }
}
