import 'dart:math' as math;

import 'package:Baar/utils/custom_color.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';

import '../utils/common_utils.dart';
import '../utils/common_widget.dart';
import '../utils/strings.dart';

class FormHydraulicPage extends StatefulWidget {
  const FormHydraulicPage({Key? key}) : super(key: key);

  @override
  State<FormHydraulicPage> createState() => _FormHydraulicPageState();
}

class _FormHydraulicPageState extends State<FormHydraulicPage> {
  final TextEditingController _checkPointController = TextEditingController();
  final TextEditingController _measureController = TextEditingController();
  final TextEditingController _standardValueController = TextEditingController();
  final TextEditingController _observationController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();
  final TextEditingController _justificationController = TextEditingController();
  late SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  final List<int> indexList = <int>[1];

  String transcription = '';
  var isSelected = 1;
  var selectedColor = Colors.black;
  var selectedTextColor = Colors.white;
  final ScrollController _scrollController = ScrollController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
    activateSpeechRecognizer();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void activateSpeechRecognizer() {
    _speech = SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setCurrentLocaleHandler(onCurrentLocale);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech.activate().then((res) => setState(() => _speechRecognitionAvailable = res));
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
            body: SingleChildScrollView(
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(bottom: 30),
                            child: Text(
                              Strings.hydraulics,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
                            )),
                        Container(
                            width: width,
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                                border: Border.all(color: Colors.black, width: 2)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CommonUtils().commonRowWidget(isSelected, 1, Strings.oilTank, () {
                                  setState(() {
                                    isSelected = 1;
                                  });
                                }, height, width),
                                const VerticalDivider(
                                  width: 2,
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                CommonUtils().commonRowWidget(isSelected, 2, Strings.mainPumpUnit, () {
                                  setState(() {
                                    isSelected = 2;
                                  });
                                }, height, width),
                                const VerticalDivider(
                                  width: 1,
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                CommonUtils().commonRowWidget(isSelected, 3, Strings.recirculationPump, () {
                                  setState(() {
                                    isSelected = 3;
                                  });
                                }, height, width),
                                const VerticalDivider(
                                  width: 1,
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                CommonUtils().commonRowWidget(isSelected, 4, Strings.heatexchaner, () {
                                  setState(() {
                                    isSelected = 4;
                                  });
                                }, height, width),
                                const VerticalDivider(
                                  width: 1,
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                CommonUtils().commonRowWidget(isSelected, 5, Strings.generalComments, () {
                                  setState(() {
                                    isSelected = 5;
                                  });
                                }, height, width),
                              ],
                            )),
                        Container(
                            width: width,
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(5)),
                                border: Border.all(color: Colors.black, width: 2)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CommonUtils().commonRowWidget(isSelected, 6, Strings.valveStand, () {
                                  setState(() {
                                    isSelected = 6;
                                  });
                                }, height, width),
                                const VerticalDivider(
                                  width: 2,
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                CommonUtils().commonRowWidget(isSelected, 7, Strings.accumulator, () {
                                  setState(() {
                                    isSelected = 7;
                                  });
                                }, height, width),
                                const VerticalDivider(
                                  width: 1,
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                CommonUtils().commonRowWidget(isSelected, 8, Strings.boosterPumpUnit, () {
                                  setState(() {
                                    isSelected = 8;
                                  });
                                }, height, width),
                                const VerticalDivider(
                                  width: 1,
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                CommonUtils().commonRowWidget(isSelected, 9, Strings.pilotPumpUnit, () {
                                  setState(() {
                                    isSelected = 9;
                                  });
                                }, height, width),
                                const VerticalDivider(
                                  width: 1,
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                CommonUtils().commonRowWidget(isSelected, 10, Strings.offlineFilter, () {
                                  setState(() {
                                    isSelected = 10;
                                  });
                                }, height, width),
                              ],
                            )),
                        Container(
                            width: width,
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(5)),
                                border: Border.all(color: Colors.black, width: 2)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CommonUtils().commonRowWidget(isSelected, 11, Strings.actuator, () {
                                  setState(() {
                                    isSelected = 11;
                                  });
                                }, height, width),
                                const VerticalDivider(
                                  width: 2,
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                CommonUtils().commonRowWidget(isSelected, 12, Strings.basicCondition, () {
                                  setState(() {
                                    isSelected = 12;
                                  });
                                }, height, width),
                                const VerticalDivider(
                                  width: 1,
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                CommonUtils().commonRowWidget(isSelected, 13, Strings.otherComment, () {
                                  setState(() {
                                    isSelected = 13;
                                  });
                                }, height, width),
                                const VerticalDivider(
                                  width: 1,
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                CommonUtils().commonRowWidget(isSelected, 14, Strings.improvementCase, () {
                                  setState(() {
                                    isSelected = 14;
                                  });
                                }, height, width),
                                CommonUtils().commonRowWidget(isSelected, 15, Strings.improvementCase, () {
                                  setState(() {
                                    isSelected = 15;
                                  });
                                }, height, width),
                              ],
                            )),
                        Container(
                            margin: const EdgeInsets.only(top: 20),
                            width: width,
                            height: height / 2.2,
                            alignment: Alignment.bottomCenter,
                            child: ExpandableTheme(
                              data: const ExpandableThemeData(
                                iconColor: CustomColor.themeColor,
                                useInkWell: true,
                              ),
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: indexList.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return ExpandableNotifier(
                                      child: ScrollOnExpand(
                                        child: Card(
                                          clipBehavior: Clip.antiAlias,
                                          child: Column(
                                            children: <Widget>[
                                              ExpandablePanel(
                                                theme: const ExpandableThemeData(
                                                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                  tapBodyToExpand: true,
                                                  tapBodyToCollapse: true,
                                                  hasIcon: false,
                                                ),
                                                header: indexList.length > 1
                                                    ? Container(
                                                        color: CustomColor.themeColor,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(10.0),
                                                          child: Row(
                                                            children: [
                                                              ExpandableIcon(
                                                                theme: const ExpandableThemeData(
                                                                  expandIcon: Icons.arrow_right,
                                                                  collapseIcon: Icons.arrow_drop_down,
                                                                  iconColor: Colors.white,
                                                                  iconSize: 28.0,
                                                                  iconRotationAngle: math.pi / 2,
                                                                  iconPadding: EdgeInsets.only(right: 5),
                                                                  hasIcon: false,
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Text(
                                                                  "Form " + (index + 1).toString(),
                                                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.white),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    : Container(
                                                        padding: const EdgeInsets.only(left: 10),
                                                        child: isSelected ==15 ? CommonUtils().commonColumnPictureWidget(width,_checkPointController,_measureController,
                                                            ):isSelected !=14 ? CommonUtils().commonColumnWidget(width,_checkPointController,_measureController,
                                                            _standardValueController,
                                                            _observationController, _remarkController,_justificationController):CommonUtils().commonImprovementColumnWidget(width,_checkPointController,_measureController,
                                                            _standardValueController,
                                                            _observationController,
                                                            _remarkController,_justificationController)),
                                                collapsed: Container(),
                                                expanded: indexList.length > 1
                                                    ? isSelected ==15 ? CommonUtils().commonColumnPictureWidget(width,_checkPointController,_measureController,):isSelected !=14 ? CommonUtils().commonColumnWidget(width,_checkPointController,_measureController,_standardValueController,
                                                    _observationController,
                                                    _remarkController,_justificationController):CommonUtils().commonImprovementColumnWidget(width,_checkPointController,_measureController,
                                                    _standardValueController,
                                                    _observationController,
                                                    _remarkController,_justificationController)
                                                    : Container(),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            )),
                        Container(
                            alignment: Alignment.bottomCenter,
                            padding: const EdgeInsets.only(top: 30, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonUtils().customButton(Size(width / 4.8, 45), Strings.submit, () {
                                  Navigator.pushReplacementNamed(context, '/home');
                                }, 10),
                                CommonUtils().customButton(Size(width / 4.8, 45), Strings.saveAsDraft, () {
                                  Navigator.pushNamed(context, '/draft');
                                }, 10),
                                CommonUtils().customButton(Size(width / 4.8, 45), Strings.cancel, () {
                                  Navigator.pushReplacementNamed(context, '/home');
                                }, 10),
                                CommonUtils().customButton(Size(width / 4.8, 45), Strings.addNewEntry, () {
                                  //  showSnackBar("In process....", context);
                                  setState(() {
                                    indexList.insert(indexList.length, indexList.length + 1);
                                  });
                                }, 10),
                              ],
                            ))
                      ],
                    )))));
  }

//How many  images added for one field  and after  upload a image where to show the uploaded image
  void start() => _speech.listen(locale: 'en_US').then((result) => {print('_MyAppState.start => result ${result}'), _checkPointController.text = result.toString()});

  void cancel() => _speech.cancel().then((result) => setState(() => _isListening = result));

  void stop() => _speech.stop().then((result) => setState(() => _isListening = result));

  void onSpeechAvailability(bool result) => setState(() => _speechRecognitionAvailable = result);

  void onCurrentLocale(String locale) {
    print('_MyAppState.onCurrentLocale... $locale');
  }

  void onRecognitionStarted() => setState(() => _isListening = true);

  void onRecognitionResult(String text) => setState(() => transcription = text);

  void onRecognitionComplete() => setState(() => _isListening = false);
}
