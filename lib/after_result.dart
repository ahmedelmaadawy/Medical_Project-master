// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, avoid_print, implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:medical_project/animia_result.dart';
import 'package:medical_project/drawer.dart';
import 'package:medical_project/generated/locale_keys.g.dart';
import 'package:medical_project/result.dart';
import 'package:medical_project/test_values.dart';
import 'Network/local/diohelper.dart';
import 'covid_result.dart';
import 'result.dart';

class AfterResult extends StatefulWidget {
  final List<ResultModel> results;

  const AfterResult({Key? key, required this.results}) : super(key: key);
  @override
  State<AfterResult> createState() => _AfterResultState();
}

class _AfterResultState extends State<AfterResult> {
  static String anemiaresult = "";
  static String covidresult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DefaultDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          LocaleKeys.medical_test.tr(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue[300],
              child: ListView.separated(
                itemBuilder: (context, index) =>
                    buildResulItem(widget.results[index]),
                separatorBuilder: (context, index) => Container(
                  height: 8.0,
                ),
                itemCount: widget.results.length,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.blue[300],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50.0,
                child: MaterialButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) =>
                    // );
                    DioHelper.getData(
                      path: "/mainmodels/anemiaclassify/?",
                      queryPara: {
                        "hemoglobin": widget.results[1].strValue,
                        "mch": widget.results[3].strValue,
                        "mchc": widget.results[4].strValue,
                        "mcv": widget.results[2].strValue,
                        "gender": widget.results[7].strValue,
                      }
                      // "gender": isMale ? '0' : '1'
                      ,
                    ).then((value) {
                      print("\n\nSTATUS::::: ${value.statusCode}\n\n");
                      anemiaresult = value.data['results']['Has Anemia?'];
                      print("result:::: $anemiaresult");
                    }).catchError((error) {
                      print("Errororor" + error.toString());
                    });

                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AnimiaResult(
                            result: anemiaresult,
                          ),
                        ),
                      );
                    });
                    // String? fR;
                    // setState(() {
                    //   fR = anemiaresult;
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => AnimiaResult(
                    //         result: fR!,
                    //       ),
                    //     ),
                    //   );
                    // });
                  },
                  child: Text(
                    'Test Anemia',
                    style: TextStyle(
                        fontSize: 20.0,
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
          ),
          Container(
            color: Colors.blue[300],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 50.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MaterialButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      // );
                      DioHelper.getData(
                        path: "/mainmodels/covidclassify/?",
                        queryPara: {
                          "wbc": widget.results[0].strValue,
                          "mot": widget.results[6].strValue,
                          "lyt": widget.results[5].strValue,
                          "age": widget.results[8].strValue,
                        },
                      ).then((value) {
                        print("\n\nSTATUS::::: ${value.statusCode}\n\n");
                        covidresult = value.data['results']['Has Covid?'];
                        print("result:::: $covidresult");
                      }).catchError((error) {
                        print("Errororor" + error.toString());
                      });
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CovidResult(
                              result: covidresult,
                            ),
                          ),
                        );
                      });
                    },
                    child: Text(
                      'Test Covid',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.blue[800]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
