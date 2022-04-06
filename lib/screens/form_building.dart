import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';
import '../utils/common_widget.dart';
import '../utils/strings.dart';

class FormBuildingPage extends StatefulWidget {
  const FormBuildingPage({Key? key}) : super(key: key);

  @override
  State<FormBuildingPage> createState() => _FormBuildingPageState();
}

class _FormBuildingPageState extends State<FormBuildingPage> {
  final TextEditingController _fieldOneController = TextEditingController();
  final TextEditingController _fieldTwoController = TextEditingController();
  final TextEditingController _fieldThreeController = TextEditingController();
  final TextEditingController _fieldFourController = TextEditingController();
  late SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String transcription = '';
  var isSelected = 1;
  var selectedColor = Colors.black;
  var selectedTextColor = Colors.white;
  final ScrollController _scrollController = ScrollController();
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
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(preferredSize: const Size.fromHeight(80), child: CommonUtils().customAppBar(width, context, true)),
            body: SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                            padding: EdgeInsets.only(top: 30, bottom: 30),
                            child: Text(
                              Strings.technologAlliedStructure,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
                            )),
                        Container(
                            width: width,
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
                                border: Border.all(color: Colors.black, width: 2)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CommonUtils().commonRowWidget(isSelected, 1, Strings.conveyMessage, () {
                                  setState(() {
                                    isSelected = 1;
                                  });
                                }, height, width),
                                const VerticalDivider(
                                  width: 2,
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                CommonUtils().commonRowWidget(isSelected, 2, Strings.staircase, () {
                                  setState(() {
                                    isSelected = 2;
                                  });
                                }, height, width),
                                const VerticalDivider(
                                  width: 1,
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                CommonUtils().commonRowWidget(isSelected, 3, Strings.thicknessVibration, () {
                                  setState(() {
                                    isSelected = 3;
                                  });
                                }, height, width),
                                const VerticalDivider(
                                  width: 1,
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                CommonUtils().commonRowWidget(isSelected, 4, Strings.annexure, () {
                                  setState(() {
                                    isSelected = 4;
                                  });
                                }, height, width),
                                const VerticalDivider(
                                  width: 1,
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                CommonUtils().commonRowWidget(isSelected, 5, Strings.sketchOftop, () {
                                  setState(() {
                                    isSelected = 5;
                                  });
                                }, height, width),
                              ],
                            )),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelected = 1;
                              });
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: width / 5.6,
                                height: 55,
                                decoration: BoxDecoration(
                                    color: isSelected == 1 ? selectedColor : selectedTextColor,
                                    border: Border.all(color: Colors.black, width: 2)),
                                child: Text(
                                  Strings.trestiesAndVertical,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 12.0, fontWeight: FontWeight.w500, color: isSelected == 1 ? selectedTextColor : selectedColor),
                                ))),
                        GestureDetector(
                            onTap: () {
                              setState(() {
                                isSelected = 6;
                              });
                            },
                            child: Container(
                                alignment: Alignment.center,
                                width: width / 5.6,
                                height: 55,
                                decoration: BoxDecoration(
                                    color: isSelected == 6 ? selectedColor : selectedTextColor,
                                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
                                    border: Border.all(color: Colors.black, width: 2)),
                                child: Text(
                                  Strings.galleryStructure,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 12.0, fontWeight: FontWeight.w500, color: isSelected == 6 ? selectedTextColor : selectedColor),
                                ))),
                        Padding(padding: const EdgeInsets.only(top: 20), child: CommonUtils().commonRowTextField(false, true, width, _fieldTwoController, Strings.itemNo, () {})),
                        Padding(padding: const EdgeInsets.only(top: 10), child: CommonUtils().commonRowTextField(false, true, width, _fieldTwoController, Strings.rccPedestal, () {})),
                        Padding(padding: const EdgeInsets.only(top: 10), child: CommonUtils().commonRowTextField(false, true, width, _fieldTwoController, Strings.basePlate, () {})),
                        Padding(padding: const EdgeInsets.only(top: 10), child: CommonUtils().commonRowTextField(false, true, width, _fieldTwoController, Strings.corrosionObservation, () {})),

                        Container(
                            height: height / 7,
                            alignment: Alignment.bottomCenter,
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonUtils().customButton(Size(width / 4.8, 45), Strings.submit, () {
                                  Navigator.pushNamed(context, '/home');
                                }, 10),
                                CommonUtils().customButton(Size(width / 4.8, 45), Strings.saveAsDraft, () {
                                  Navigator.pushNamed(context, '/draft');
                                }, 10),
                                CommonUtils().customButton(Size(width / 4.8, 45), Strings.cancel, () {
                                  Navigator.pushNamed(context, '/historical');
                                }, 10),
                                CommonUtils().customButton(Size(width / 4.8, 45), Strings.addNewEntry, () {
                                  Navigator.pushNamed(context, '/formHydraulic');
                                }, 10),
                              ],
                            ))
                      ],
                    )))));
  }

//How many  images added for one field  and after  upload a image where to show the uploaded image
  void start() => _speech.listen(locale: 'en_US').then((result) => {print('_MyAppState.start => result ${result}'), _fieldOneController.text = result.toString()});

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
