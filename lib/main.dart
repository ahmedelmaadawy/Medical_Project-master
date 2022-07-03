// ignore_for_file: use_key_in_widget_constructors, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:medical_project/after_result.dart';
import 'package:medical_project/animia_result.dart';
import 'package:medical_project/generated/codegen_loader.g.dart';
import 'package:medical_project/home_screen.dart';
import 'package:medical_project/select_photo.dart';
import 'package:medical_project/settings.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Network/local/diohelper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  DioHelper.init();
  runApp(
    EasyLocalization(
        path: 'assets/translation',
        // ignore: prefer_const_literals_to_create_immutables
        supportedLocales: [
          Locale('en'),
          Locale('ar'),
        ],
        assetLoader: CodegenLoader(),
        fallbackLocale: Locale('en'),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
