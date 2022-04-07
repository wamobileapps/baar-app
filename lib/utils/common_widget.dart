import 'package:Baar/main.dart';
import 'package:Baar/utils/constants.dart';
import 'package:Baar/utils/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
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

  Widget customAppBar(double width, BuildContext context, bool status, [GlobalKey<ScaffoldState>? scaffoldKey]) {
    return AppBar(
      leading: GestureDetector(
          onTap: () {
            if (scaffoldKey != null) scaffoldKey.currentState?.openDrawer();
            else if(scaffoldKey==null && status) Navigator.pop(context);
          },
          child: Icon( (scaffoldKey==null && status) ? Icons.arrow_back : Icons.menu,
            color: (status)  ? Colors.white : CustomColor.themeColor,
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

  Widget commonRowField(double width, TextEditingController fieldController, String number, VoidCallback onTap, VoidCallback onCameraTap, bool isActive) {
    return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Text(
              Strings.field + number.toString(),
              style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
            ),
            Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                width: width / 2,
                height: 35,
                child:
                    CommonUtils().customTextFormField(fieldController, TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black))),
            GestureDetector(onTap: onCameraTap, child: Icon(Icons.camera_alt, color: Colors.black, size: width / 10)),
            const SizedBox(width: 10),
            GestureDetector(
                onTap: onTap,
                child: Image.asset(
                  Images.voice,
                  color: isActive ? Colors.red : Colors.black,
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

  showBottomSheetImagePicker(
    BuildContext context,
    double width,
    VoidCallback onCameraTap,
    VoidCallback onGalleryTap,
  ) {
    showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(18), topRight: Radius.circular(18)),
      ),
      backgroundColor: CustomColor.themeColor,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                    onTap: onCameraTap,
                    child: Padding(
                        padding: EdgeInsets.only(left: 50, top: 30),
                        child: Column(
                          children: [
                            Image.asset(
                              Images.camera,
                              width: 130,
                              height: 130,
                            ),
                            Text(
                              Strings.camera,
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ))),
                GestureDetector(
                    onTap: onGalleryTap,
                    child: Padding(
                        padding: EdgeInsets.only(right: 50, top: 30),
                        child: Column(
                          children: [
                            Image.asset(
                              Images.picture,
                              width: 130,
                              height: 130,
                            ),
                            Text(Strings.gallery, style: TextStyle(color: Colors.white))
                          ],
                        ))),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget commonDrawerWidget(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[

          DrawerHeader(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 56,
                  backgroundColor: Colors.blueGrey,
                  child: ClipOval(child: Image.asset("assets/images/portrait.png",fit: BoxFit.fill)),),
                  SizedBox(width: 10,),
                Text('John Doe',style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.white)),
              ],
            ),
            decoration: BoxDecoration(
              color: CustomColor.themeColor,
            ),
          ),
          ListTile(
            leading: Image.asset(Images.home,width:35,height: 35,),
            title: const Text(Strings.home,style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black)),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/home");
            },
          ),
          ListTile(
            leading: Image.asset(Images.hisReport,width:35,height: 35,),
            title: const Text(Strings.historicalReport,style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black),),
            onTap: () {
              Navigator.pushNamed(context, "/historical");
            },
          ),
          ListTile(
            leading: Image.asset(Images.drawing,width:35,height: 35,),
            title: const Text(Strings.drawing,style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black)),
            onTap: () {
            },
          ),
          ListTile(
            leading: Image.asset(Images.logout,width:35,height: 35,),
            title: const Text(Strings.logout,style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 16.0, fontWeight: FontWeight.w500, color: Colors.black)),
            onTap: () {
              prefs?.setBool(Constants.LOGIN, false);
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }

 Widget customBottomnaviagtion(int _selectedIndex,  Function(dynamic index) onClick,) {
    return BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        backgroundColor: CustomColor.themeColor,
        items:  <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Image.asset(Images.home,color: _selectedIndex==0?Colors.white:Colors.grey,width: 25,height: 25,), label: Strings.home,),
          BottomNavigationBarItem(icon: Image.asset(Images.document,color: _selectedIndex==1?Colors.white:Colors.grey,width: 25,height: 25,), label: Strings.document, ),
          BottomNavigationBarItem(icon: Image.asset(Images.setting,color: _selectedIndex==2?Colors.white:Colors.grey,width: 25,height: 25,), label: Strings.setting,),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        iconSize: 40,
        onTap: (index) {
         onClick(index);
        },
        elevation: 5);
 }
}
