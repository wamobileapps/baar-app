import 'package:flutter/material.dart';
import '../utils/common_widget.dart';
import '../utils/strings.dart';

class DraftPage extends StatefulWidget {
  const DraftPage({Key? key}) : super(key: key);

  @override
  State<DraftPage> createState() => _DraftPageState();
}

class _DraftPageState extends State<DraftPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            /*drawer: CommonUtils().commonDrawerWidget(context),*/
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(preferredSize: const Size.fromHeight(80), child: CommonUtils().customAppBar(width, context, true, null)),
            body: Container(
                height: height,
                width: width,
                padding: const EdgeInsets.all(30),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          Strings.draft,
                          style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
                        )),
                    Container(
                        height: height / 1.5,
                        padding: const EdgeInsets.only(top: 80, bottom: 10),
                        child: ListView.builder(
                            itemCount: 15,
                            itemBuilder: (BuildContext context, int index) {
                              return getRow(index, width);
                            })),
                    Container(
                        height: height,
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.only(top: 160, bottom: 10),
                        child: CommonUtils().customButton(Size(width / 4.5, 40), Strings.cancel, () {
                          print("testing");
                        }, 18))
                  ],
                )),
            ));
  }

  Widget getRow(int i, double width) {
    return GestureDetector(
      child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: [
              SizedBox(
                  width: width / 1.3,
                  child: const Text(Strings.selectStructuralSelection + Strings.selectStructuralSelection,
                      style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black))),
              Icon(Icons.delete, color: Colors.black, size: width / 15),
            ],
          )),
      onTap: () {
        setState(() {
          print('row $i');
        });
      },
    );
  }
}
