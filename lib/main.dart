import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet/config/theme/themes.dart';
import 'package:wallet/presentation/pages/main/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: Themes.lightTheme,
      home: MainPage(),
    );
  }
}
