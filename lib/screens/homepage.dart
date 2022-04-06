import 'package:Baar/utils/custom_color.dart';
import 'package:flutter/material.dart';
import '../utils/common_widget.dart';
import '../utils/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _userNameController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
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
            resizeToAvoidBottomInset: false,
            drawer: CommonUtils().commonDrawerWidget(context),
            appBar: PreferredSize(preferredSize: const Size.fromHeight(80), child: CommonUtils().customAppBar(width, context, true,_scaffoldKey)),
            body: Container(
                height: height,
                width: width,
                padding: const EdgeInsets.all(30),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonUtils().customButton(Size(width / 3.5, 40), Strings.newReport, () {
                          Navigator.pushNamed(context, '/selection');
                        }, 14),
                        Container(
                            width: width / 2.5,
                            height: 42,
                            child: TextFormField(
                                controller: _userNameController,
                                decoration: InputDecoration(
                                  hintText: Strings.search,
                                  hintStyle: TextStyle(fontSize: 18, color: CustomColor.grey),
                                  contentPadding: EdgeInsets.only(top: 20), // add padding to adjust text
                                  isDense: true,
                                  prefixIcon: const Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ), // icon is 48px widget.
                                  ),
                                  fillColor: Colors.white,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                      color: CustomColor.darkBlue,
                                      width: 4.0,
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
                                style: const TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black))),
                      ],
                    ),
                    const Padding(
                        padding: EdgeInsets.only(top: 80, bottom: 10),
                        child: Text(
                          Strings.historicalReport,
                          style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
                        )),
                    Container(
                        height: height / 3,
                        padding: const EdgeInsets.only(top: 120, bottom: 10),
                        child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int index) {
                              return getRow(index, width);
                            })),
                    const Padding(
                        padding: EdgeInsets.only(top: 285, bottom: 10),
                        child: Text(
                          Strings.draft,
                          style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
                        )),
                    Container(
                        height: height / 1.8,
                        padding: const EdgeInsets.only(top: 330, bottom: 10),
                        child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int index) {
                              return getRow(index, width);
                            })),
                    const Padding(
                        padding: EdgeInsets.only(top: 480, bottom: 10),
                        child: Text(
                          Strings.submittedReport,
                          style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
                        )),
                    Container(
                        height: height / 1.2,
                        padding: const EdgeInsets.only(top: 520, bottom: 10),
                        child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (BuildContext context, int index) {
                              return getRow(index, width);
                            })),
                  ],
                ))));

  }

  Widget getRow(int i, double width) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: SizedBox(
            width: width / 1.3,
            child: const Text(Strings.selectStructuralSelection + Strings.selectStructuralSelection,
                style: TextStyle(decoration: TextDecoration.underline, fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.black))),
      ),
      onTap: () {
        setState(() {
          print('row $i');
        });
      },
    );
  }
}
