import 'package:Baar/utils/custom_color.dart';
import 'package:flutter/material.dart';
import '../utils/common_widget.dart';
import '../utils/strings.dart';

class HistoricalReportPage extends StatefulWidget {
  const HistoricalReportPage({Key? key}) : super(key: key);

  @override
  State<HistoricalReportPage> createState() => _HistoricalReportPageState();
}

class _HistoricalReportPageState extends State<HistoricalReportPage> {
  final TextEditingController _userNameController = TextEditingController();

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
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(preferredSize: const Size.fromHeight(80), child: CommonUtils().customAppBar(width, context, true)),
            body: Container(
                height: height,
                width: width,
                padding: const EdgeInsets.all(30),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(left: 10, right: 30, top: 10),
                        width: width,
                        height: 50,
                        child: TextFormField(
                            controller: _userNameController,
                            decoration: InputDecoration(
                              hintText: Strings.search,
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
                    const Padding(
                        padding: EdgeInsets.only(top: 80, bottom: 10),
                        child: Text(
                          Strings.historicalReport,
                          style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
                        )),
                    Container(
                        height: height / 1.4,
                        padding: const EdgeInsets.only(top: 150, bottom: 10),
                        child: ListView.builder(
                            itemCount: 15,
                            itemBuilder: (BuildContext context, int index) {
                              return getRow(index, width);
                            })),
                    Container(
                        height: height,
                        alignment: Alignment.bottomRight,
                        padding: const EdgeInsets.only(bottom: 10),
                        child: CommonUtils().customButton(Size(width / 4.5, 40), Strings.cancel, () {
                          print("testing");
                        }, 14))
                  ],
                ))));
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
