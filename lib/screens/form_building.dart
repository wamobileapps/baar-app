import 'package:flutter/material.dart';
import 'package:speech_recognition/speech_recognition.dart';
import '../utils/common_utils.dart';
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
  var status = "0";
  var technology = "0";

  String transcription = '';
  var isSelected = 1;
  var selectedColor = Colors.black;
  var selectedTextColor = Colors.white;
  final ScrollController _scrollController = ScrollController();
  double updateWidth=0.0;
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

    final args = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    status = args["status"] ?? "0";
    technology = args["technology"] ?? "0";


    technology=="3" ? updateWidth=width/1.89: technology!="2" ? updateWidth=width/1.435 :updateWidth = width;

    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            resizeToAvoidBottomInset: false,
            /*drawer: CommonUtils().commonDrawerWidget(context),*/
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: CommonUtils().customAppBar(
                  width,
                  context,
                  true,
                  null,
                )),
            body: SingleChildScrollView(
                controller: _scrollController,
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 30),
                            child: Text(
                              status == "1" ? Strings.buildingStructure : technology=="1"?Strings.conveyStructure:technology=="2"?Strings.junctionHouseStructure:
                              technology=="3"?Strings.monorailStructure:technology=="4"?Strings.pipelineStructure:Strings.platformStructure,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
                            )),
                        Container(
                            width: updateWidth,
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
                                border: Border.all(color: Colors.black, width: 2)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CommonUtils().commonRowWidget(
                                    isSelected,
                                    1,
                                    status == "1"
                                        ? Strings.column
                                        : technology == "1" || technology == "2"
                                            ? Strings.conveyOr
                                            : technology == "3"
                                                ? Strings.monorail
                                                : technology == "4"
                                                    ? Strings.columnsSaddle
                                                    : Strings.column, () {
                                  setState(() {
                                    isSelected = 1;
                                  });
                                }, height, width),
                                const VerticalDivider(
                                  width: 2,
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                CommonUtils().commonRowWidget(
                                    isSelected,
                                    2,
                                    status == "1"
                                        ? Strings.craneGiderStairCase
                                        : technology == "1" || technology == "2" || technology == "4"
                                            ? Strings.staircase
                                            : technology == "3" || technology == "5"
                                                ? Strings.thicknessVibration
                                                : Strings.craneGiderStairCase, () {
                                  setState(() {
                                    isSelected = 2;
                                  });
                                }, height, width),
                                const VerticalDivider(
                                  width: 1,
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                CommonUtils().commonRowWidget(
                                    isSelected,
                                    3,
                                    technology == "2"
                                        ? Strings.monorail
                                        : technology == "3"
                                            ? Strings.annexure
                                            : technology == "5"
                                                ? Strings.staircase
                                                : Strings.thicknessVibration, () {
                                  setState(() {
                                    isSelected = 3;
                                  });
                                }, height, width),
                                const VerticalDivider(
                                  width: 1,
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                Visibility(
                                    visible: technology != "3",
                                    child: CommonUtils().commonRowWidget(isSelected, 4, technology == "2" ? Strings.thicknessVibration : Strings.annexure, () {
                                      setState(() {
                                        isSelected = 4;
                                      });
                                    }, height, width)),
                                const VerticalDivider(
                                  width: 1,
                                  color: Colors.black,
                                  thickness: 2,
                                ),
                                Visibility(
                                    visible: technology == "2" ,
                                    child: CommonUtils().commonRowWidget(isSelected, 5, Strings.annexure, () {
                                      setState(() {
                                        isSelected = 5;
                                      });
                                    }, height, width)),
                              ],
                            )),
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
                                  Navigator.pushReplacementNamed(context, '/home');
                                }, 10),
                                CommonUtils().customButton(Size(width / 4.8, 45), Strings.saveAsDraft, () {
                                  Navigator.pushNamed(context, '/draft');
                                }, 10),
                                CommonUtils().customButton(Size(width / 4.8, 45), Strings.cancel, () {
                                  Navigator.pushReplacementNamed(context, '/home');
                                }, 10),
                                CommonUtils().customButton(Size(width / 4.8, 45), Strings.addNewEntry, () {
                                  showSnackBar("In process....", context);
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
