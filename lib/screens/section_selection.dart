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
  List<DropdownMenuItem<String>> get _dropdownSelection {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Row(
        children: [
          Radio(
            value: Section.hydraulics,
            groupValue: section,
            onChanged: (Section? value) {
              setState(() {
                //    section = value!;
                //  _selectedTest = Strings.hydraulics;
              });
            },
          ),
          const Text(Strings.hydraulics, style: TextStyle(fontSize: 17.0)),
        ],
      )),
      DropdownMenuItem(
          child: Row(
        children: [
          Radio(
            value: Section.structural,
            groupValue: section,
            onChanged: (Section? value) {
              setState(() {
                // section = value!;
                //_selectedTest = Strings.structural;
              });
            },
          ),
          const Text(Strings.structural, style: TextStyle(fontSize: 17.0)),
        ],
      )),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get _dropdownStructural {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(
          child: Row(
        children: [
          Radio(
            value: StructuralType.building,
            groupValue: structuralType,
            onChanged: (StructuralType? value) {
              setState(() {

                //    section = value!;
                //  _selectedTest = Strings.hydraulics;
              });
            },
          ),
          const Text(Strings.buildingStructure, style: TextStyle(fontSize: 17.0)),
        ],
      )),
      DropdownMenuItem(
          child: Row(
        children: [
          Radio(
            value: StructuralType.technology,
            groupValue: structuralType,
            onChanged: (StructuralType? value) {
              setState(() {
                // section = value!;
                //_selectedTest = Strings.structural;
              });
            },
          ),
          const Text(Strings.technologyAlliedStructure, style: TextStyle(fontSize: 17.0)),
        ],
      )),
    ];
    return menuItems;
  }

  var _selectedTest;
  Section section = Section.hydraulics;
  StructuralType structuralType = StructuralType.building;

  @override
  void initState() {
    super.initState();
  }

  onChangeDropdownTests(selectedTest) {
    print(selectedTest);

    setState(() {
      _selectedTest = selectedTest;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
            appBar: PreferredSize(preferredSize: const Size.fromHeight(80), child: CommonUtils().customAppBar(width, context, false)),
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
                    DropdownBelow(
                      itemWidth: width / 1.17,
                      itemTextstyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                      boxTextstyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: CustomColor.darkBlue),
                      boxPadding: const EdgeInsets.only(left: 5, right: 5),
                      boxDecoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), border: Border.all(color: CustomColor.darkBlue, width: 2)),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      boxHeight: 45,
                      boxWidth: width,
                      hint: const Text(Strings.select, style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w400, color: CustomColor.grey)),
                      value: _selectedTest,
                      items: _dropdownSelection,
                      onChanged: (dynamic? newValue) {
                        Navigator.pushNamed(context, '/form',arguments: <String, String>{"status" : "0"});
                      },
                      /*onChanged: onChangeDropdownTests(value),*/
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
                          DropdownBelow(
                            itemWidth: width / 1.17,
                            itemTextstyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black),
                            boxTextstyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: CustomColor.darkBlue),
                            boxPadding: const EdgeInsets.only(left: 5, right: 5),
                            boxDecoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), border: Border.all(color: CustomColor.darkBlue, width: 2)),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            boxHeight: 45,
                            boxWidth: width,
                            hint: const Text(Strings.select, style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 18.0, fontWeight: FontWeight.w400, color: CustomColor.grey)),
                            value: _selectedTest,
                            items: _dropdownStructural,
                            onChanged: (dynamic? newValue) {
                              Navigator.pushNamed(context, '/form',arguments: <String, String>{"status" : "1"});
                            },
                          ),
                        ],
                      ),
                      visible: true,
                    )
                  ],
                ))));
  }
}
