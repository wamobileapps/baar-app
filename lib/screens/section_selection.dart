import 'package:Baar/utils/all_enum.dart';
import 'package:Baar/utils/custom_color.dart';
import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';

import '../utils/common_widget.dart';
import '../utils/strings.dart';

class SectionSelectionPage extends StatefulWidget {
  const SectionSelectionPage({Key? key}) : super(key: key);

  @override
  State<SectionSelectionPage> createState() => _SectionSelectionPageState();
}

class _SectionSelectionPageState extends State<SectionSelectionPage> {

   String dropDownValue= Strings.select;
   String dropDownStructuralValue= Strings.select;

  List<String> selectionList = [
    Strings.select,
    Strings.hydraulics,
    Strings.structural,
  ];
  List<String> selectStructuralList = [
    Strings.select,
    Strings.buildingStructure,
    Strings.technologyAlliedStructure,
  ];



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(preferredSize: const Size.fromHeight(80), child: CommonUtils().customAppBar(width, context, true,null)),
            body: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(bottom: 20, top: 30),
                        child: Text(
                          Strings.selectSelection,
                          style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
                        )),
                    DropdownButtonFormField(
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: Strings.select,
                      ),
                      value: dropDownValue,
                      onChanged: (value) {
                        setState(() {
                          if(value==Strings.hydraulics) Navigator.pushNamed(context, '/form', arguments: <String, String>{"status": "0"});
                          dropDownValue = value.toString();
                        });
                      },
                      items: selectionList
                          .map((selectionTitle) => DropdownMenuItem(
                          value: selectionTitle, child: Text("$selectionTitle")))
                          .toList(),
                    ),


                    Visibility(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                              padding: EdgeInsets.only(bottom: 20, top: 30),
                              child: Text(
                                Strings.selectStructuralSelection,
                                style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w600, color: Colors.black),
                              )),
                          DropdownButtonFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.grey),
                              hintText: Strings.select,
                            ),
                            value: dropDownStructuralValue,
                            onChanged: (value) {
                              setState(() {
                                Navigator.pushNamed(context, '/form', arguments: <String, String>{"status": "1"});
                                dropDownStructuralValue = value.toString();
                              });
                            },
                            items: selectStructuralList
                                .map((selectionTitle) => DropdownMenuItem(
                                value: selectionTitle, child: Text("$selectionTitle")))
                                .toList(),
                          ),

                        ],
                      ),
                      visible: dropDownValue==Strings.structural,
                    )
                  ],
                ))));
  }
}
