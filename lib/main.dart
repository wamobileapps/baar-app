import 'package:Baar/screens/draft.dart';
import 'package:Baar/screens/form.dart';
import 'package:Baar/screens/form_building.dart';
import 'package:Baar/screens/form_hydraulics.dart';
import 'package:Baar/screens/historical_report.dart';
import 'package:Baar/screens/homepage.dart';
import 'package:Baar/screens/section_selection.dart';
import 'package:Baar/screens/signup_user_type.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/login.dart';
import 'utils/strings.dart';

SharedPreferences? prefs;

void main() {
  runApp(const MyApp());
}

initialPref() async {
 prefs = await SharedPreferences.getInstance();
 print(prefs);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appName,
      builder: (context, widget) => ResponsiveWrapper.builder(
        BouncingScrollWrapper.builder(context, widget!),
        maxWidth: 1200,
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.resize(450, name: MOBILE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
          const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
        ],
      ),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const LoginPage(),
        '/second': (context) => const SignupUserTypePage(),
        '/selection': (context) => const SectionSelectionPage(),
        '/form': (context) => const FormPage(),
        '/draft': (context) => const DraftPage(),
        '/historical': (context) => const HistoricalReportPage(),
        '/home': (context) => const HomePage(),
        '/formHydraulic': (context) => const FormHydraulicPage(),
        '/formBuilding': (context) => const FormBuildingPage(),
      },
    );
  }
}
