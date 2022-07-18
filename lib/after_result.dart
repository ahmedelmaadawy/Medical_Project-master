// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, avoid_print, implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:medical_project/drawer.dart';
import 'package:medical_project/generated/locale_keys.g.dart';
import 'package:medical_project/result.dart';
import 'package:medical_project/test_values.dart';
import 'result.dart';

class AfterResult extends StatefulWidget {
  final List<ResultModel> results;

  const AfterResult(this.results);
  @override
  State<AfterResult> createState() => _AfterResultState();
}

class _AfterResultState extends State<AfterResult> {
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
                itemBuilder: (BuildContext context, int index) {
                  return buildResulItem(widget.results[index]);
                  ;
                },
                itemCount: widget.results.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Colors.white,
                  );
                },
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
                      // DioHelper.getData(
                      //   path: "/mainmodels/covidclassify/?",
                      //   queryPara: {
                      //     "wbc": widget.results[0].strValue,
                      //     "mot": widget.results[6].strValue,
                      //     "lyt": widget.results[5].strValue,
                      //     "age": widget.results[8].strValue,
                      //   },
                      // ).then((value) {
                      //   print("\n\nSTATUS::::: ${value.statusCode}\n\n");
                      //   covidresult = value.data['results']['Has Covid?'];
                      //   print("result:::: $covidresult");
                      // }).catchError((error) {
                      //   print("Errororor" + error.toString());
                      // });
                      setState(() {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => CovidResult(
                        //         // result: covidresult,
                        //       ),
                        //     ),
                        //   );
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
