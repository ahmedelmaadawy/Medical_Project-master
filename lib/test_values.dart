// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, override_on_non_overriding_member, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'after_result.dart';
import 'drawer.dart';

class ResultModel {
  String name;
  String? strValue;
  int? value;
  String translation;
  TextEditingController controller = TextEditingController();
  ResultModel({
    required this.name,
    required this.translation,
  });
}

class TestValues extends StatefulWidget {
  @override
  State<TestValues> createState() => _TestValuesState();
}

class _TestValuesState extends State<TestValues> {
  var formKey = GlobalKey<FormState>();

  List<ResultModel> results = [
    ResultModel(name: 'WBC', translation: 'كرات الدم البيضاء'),
    ResultModel(name: 'HGB', translation: 'الهيموغلوبين'),
    ResultModel(name: 'MCV', translation: 'الحجم الكريوي المتوسط'),
    ResultModel(name: 'MCH', translation: 'متوسط كرات الهيموجلوبين'),
    ResultModel(name: 'MCHC', translation: 'تركيز ھيموغلوبين الكرية'),
    ResultModel(name: 'LYMPH', translation: 'عدد اللمفاويات'),
    ResultModel(name: 'MONO', translation: 'الخلايا الوحيدة'),
    ResultModel(name: 'Gender', translation: 'الجنس'),
    ResultModel(name: 'Age', translation: 'العمر'),
  ];

  //   List<ResultModel> results = [
  //   ResultModel(name: 'WBC', translation: 'كرات الدم البيضاء'),
  //   ResultModel(name: 'RGB', translation: 'كرات الدم الحمراء'),
  //   ResultModel(name: 'HGB', translation: 'الهيموغلوبين'),
  //   ResultModel(name: 'HCT', translation: 'ھيماتوكريت'),
  //   ResultModel(name: 'MCV', translation: 'الحجم الكريوي المتوسط'),
  //   ResultModel(name: 'MCH', translation: 'متوسط كرات الهيموجلوبين'),
  //   ResultModel(name: 'MCHC', translation: 'تركيز ھيموغلوبين الكرية'),
  //   ResultModel(name: 'PLT', translation: ' صفيحات الدم'),
  //   ResultModel(name: 'RDW-CV', translation: 'توزيع كريات الدم الحمراء '),
  //   ResultModel(name: 'RWD-SD', translation: 'عرض توزع كريات الدم الحمراء'),
  //   ResultModel(name: 'PDW', translation: 'توزيع الصفائح الدموية'),
  //   ResultModel(name: 'MPV', translation: 'حجم الصفائح الدموية'),
  //   ResultModel(name: 'P-LCR', translation: 'نسبة الصفائح الدموية الكبيرة'),
  //   ResultModel(name: 'PCT', translation: 'البروكالسيتونين '),
  //   ResultModel(name: 'NEUT', translation: 'العدِلات'),
  //   ResultModel(name: 'LYMPH', translation: 'عدد اللمفاويات'),
  //   ResultModel(name: 'MONO', translation: 'الخلايا الوحيدة'),
  //   ResultModel(name: 'EO', translation: 'فرط الحمضات '),
  //   ResultModel(name: 'BASO', translation: 'خلايا الدم البيضاء القاعدية'),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: DefaultDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: Text(
            'Please Enter The Result',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) =>
                      ResultItemBuilder(results[index]),
                  itemCount: results.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(
                    height: 1.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AfterResult(
                                    results: results,
                                  )),
                        );
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      20.0,
                    ),
                    color: Colors.blue[800],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget ResultItemBuilder(ResultModel result) => Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Expanded(
            child: TextFormField(
              controller: result.controller,
              // keyboardType: TextInputType.number,
              onChanged: (String? value) {
                setState(() {
                  result.strValue = value;
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ('Wrong Input');
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: result.name,
                labelStyle: TextStyle(fontSize: 25.0, color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
            ),
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
        ),
      );
}
