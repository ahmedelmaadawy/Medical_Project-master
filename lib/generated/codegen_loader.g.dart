// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> ar = {
    "Medical_analysis": "افحص تحليلاتك",
    "welcome_txt": "مرحبا بك \n ماذا تريد أن تفعل ؟",
    "medical_test": "اختبر تحليلاتك",
    "health": "تأكد من صحتك",
    "next_button": "التالي",
    "Select_photo": "اختر صورة",
    "open_camera": "افتح الكاميرا",
    "gallery": "اختر من المكتبة",
    "previous": "السابق",
    "no_image": "لم تختار صورة ",
    "warning": "تحذير",
    "have_choose": "عليك اختيار صورة أولا ",
    "ok": "موافق",
    "test_result": "نتائج التحليل",
    "home": "الصفحة الرئيسية",
    "settings": "الاعدادات",
    "Help": "مساعدة",
    "about": "عن التطبيق",
    "general": "عام",
    "language": "اللغة",
    "select_language": "من فضلك اختر اللغة"
  };
  static const Map<String, dynamic> en = {
    "Medical_analysis": "Medical Analysis",
    "welcome_txt": "welcome \n\nWhat would you like to do ?",
    "medical_test": "Check on your medical test",
    "health": "Check on your health",
    "next_button": "Next",
    "Select_photo": "Select photo",
    "open_camera": "Open camera",
    "gallery": "Select from gallery",
    "previous": "previous",
    "no_image": "No Image Selected",
    "warning": "Warning",
    "have_choose": "You Have To Choose A Photo First !!",
    "ok": "OK",
    "test_result": "Test Result",
    "home": "Home",
    "settings": "Settings",
    "Help": "Help",
    "about": "About",
    "general": "General",
    "language": "Language",
    "select_language": "Please select a Language"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ar": ar,
    "en": en
  };
}
