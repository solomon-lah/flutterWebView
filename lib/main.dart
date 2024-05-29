import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:web_view/web_browser/helper/string_helper.dart';
import 'package:web_view/web_browser/screens/custom_browser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        title: StringHelper.appName,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const CustomBroswer(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
