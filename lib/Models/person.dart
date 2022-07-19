import 'package:medical_project/Models/result.dart';

class Person {
  String? gender;
  int? age;
  bool isLeukemiaTest = false;
  String hasAnimea = "UnKnown";
  String hasCovid = "UnKnown";
  String hasLukemia = "UnKnown";
  List<ResultModel> results = [];
  Person({this.gender = "unknown", this.age = 1});
}

class Dictionary {
  String name;
  String translation;
  Dictionary({required this.name, required this.translation});

  List<Dictionary> dictionaryList (){
     List< Dictionary > dictionary = [] ;
      dictionary.add(Dictionary(name: "WBC", translation: "كرات الدم البيضاء"));
      dictionary.add(Dictionary(name: "HGB", translation: "الهيموغلوبين"));
      dictionary.add(Dictionary(name: "MCV", translation: "الحجم الكريوي المتوسط"));
      dictionary.add(Dictionary(name: "MCH", translation: "متوسط كرات الهيموجلوبين"));
      dictionary.add(Dictionary(name: "MCHC", translation: "تركيز ھيموغلوبين الكرية"));
      dictionary.add(Dictionary(name: "LYMPH", translation: "عدد اللمفاويات"));
      dictionary.add(Dictionary(name: "MONO", translation: "الخلايا الوحيدة"));
      return dictionary;

  }
}
