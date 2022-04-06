import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_recognition/speech_recognition.dart';
import '../utils/common_widget.dart';
import '../utils/custom_color.dart';
import '../utils/strings.dart';

const languages = const [
  const Language('Francais', 'fr_FR'),
  const Language('English', 'en_US'),
  const Language('Pусский', 'ru_RU'),
  const Language('Italiano', 'it_IT'),
  const Language('Español', 'es_ES'),
];

class Language {
  final String name;
  final String code;

  const Language(this.name, this.code);
}

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _fieldOneController = TextEditingController();
  final TextEditingController _fieldTwoController = TextEditingController();
  final TextEditingController _fieldThreeController = TextEditingController();
  final TextEditingController _fieldFourController = TextEditingController();
  late SpeechRecognition _speech;

  bool _speechRecognitionAvailable = false;
  bool _isListening = false;

  String transcription = '';

   bool isActive=false;
   bool isActiveOne=false;
   bool isActiveTwo=false;
   bool isActiveThree=false;

  Language selectedLang = languages.first;
  var status="0";

  var hintText="";

  late File _image;
  final picker = ImagePicker();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  Future getCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    activateSpeechRecognizer();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  void activateSpeechRecognizer() {
    print('_MyAppState.activateSpeechRecognizer... ');
    _speech = new SpeechRecognition();
    _speech.setAvailabilityHandler(onSpeechAvailability);
    _speech.setCurrentLocaleHandler(onCurrentLocale);
    _speech.setRecognitionStartedHandler(onRecognitionStarted);
    _speech.setRecognitionResultHandler(onRecognitionResult);
    _speech.setRecognitionCompleteHandler(onRecognitionComplete);
    _speech.activate().then((res) => setState(() => _speechRecognitionAvailable = res));
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    status= args["status"] ?? "0";

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
            key: _scaffoldKey,
            drawer: CommonUtils().commonDrawerWidget(context),
            resizeToAvoidBottomInset: false,
            appBar: PreferredSize(preferredSize: const Size.fromHeight(80), child: CommonUtils().customAppBar(width, context, true,_scaffoldKey)),
            body: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                     Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 30),
                        child:  Text(status  =="0" ? Strings.hydraulics: Strings.buildingStructure,
                          style: const TextStyle(fontFamily: 'Inter', fontStyle: FontStyle.normal, fontSize: 24.0, fontWeight: FontWeight.w600, color: Colors.black),
                        )),
                    CommonUtils().commonRowField(width, _fieldOneController, " 1", () {
                      _speechRecognitionAvailable && !_isListening ? start() : null;
                      setState(() {
                        isActive=true;
                        isActiveOne= false;
                        isActiveTwo= false;
                        isActiveThree= false;
                      });
                    },(){
                     CommonUtils().showBottomSheetImagePicker(context,width,(){
                       Navigator.pop(context);
                       getCamera();
                     },(){
                       Navigator.pop(context);
                       getImage();
                     });

                    },isActive),

                    CommonUtils().commonRowField(width, _fieldTwoController, " 2", () {
                      setState(() {
                        isActive=false;
                        isActiveOne= true;
                        isActiveTwo= false;
                        isActiveThree= false;
                      });
                    },(){
                      getImage();
                    },isActiveOne),
                    CommonUtils().commonRowField(width, _fieldThreeController, " 3", () {
                      setState(() {
                        isActive=false;
                        isActiveOne= false;
                        isActiveTwo= true;
                        isActiveThree= false;
                      });
                    },(){
                      getImage();
                    },isActiveTwo),
                    CommonUtils().commonRowField(width, _fieldFourController, " 4", () {
                      setState(() {
                        isActive=false;
                        isActiveOne= false;
                        isActiveTwo= false;
                        isActiveThree= true;
                      });
                    },(){
                      getImage();
                    },isActiveThree),
                    Container(
                        height: height / 2.8,
                        alignment: Alignment.bottomCenter,
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonUtils().customButton(Size(width / 4.5, 40), Strings.submit, () {
                               Navigator.pushNamed(context, status=="0"?'/formHydraulic':'/formBuilding');
                            }, 14),
                            CommonUtils().customButton(Size(width / 4, 40), Strings.saveAsDraft, () {
                              Navigator.pushNamed(context, '/draft');
                            }, 14),
                            CommonUtils().customButton(Size(width / 4.5, 40), Strings.cancel, () {
                              Navigator.pushNamed(context, '/historical');
                            }, 14),
                          ],
                        ))
                  ],
                ))));
  }

  void start() => _speech.listen(locale: selectedLang.code).then((result) => {
    print('_MyAppState.start => result ${result}'),
  });

  void cancel() => _speech.cancel().then((result) => setState(() => _isListening = result));

  void stop() => _speech.stop().then((result) => setState(() => {_isListening = result,isActive=false}));

  void onSpeechAvailability(bool result) => setState(() =>
  {
    if(!result) isActive=false
  });

  void onCurrentLocale(String locale) {
    setState(() => selectedLang = languages.firstWhere((l) => l.code == locale));
  }

  void onRecognitionStarted() => setState(() =>{ _isListening = true,
    hintText="Typing...."
  });

  void onRecognitionResult(String text) => setState(() =>
  {
     transcription = text,
    _fieldOneController.text = text.toString()
  }
  );

  void onRecognitionComplete() => setState(() =>{ _isListening = false,
    hintText="",
    isActive=false
  });
}
