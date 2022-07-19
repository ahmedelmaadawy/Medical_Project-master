// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, sized_box_for_whitespace, avoid_print, implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:medical_project/Models/drawer.dart';
import 'package:medical_project/generated/locale_keys.g.dart';
import 'package:medical_project/Models/result.dart';
import 'Models/person.dart';
import 'Models/result.dart';

class AfterResult extends StatefulWidget {
  final Person person;

  const AfterResult(this.person);
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
                  return buildResulItem(widget.person.results[index]);
                },
                itemCount: widget.person.results.length,
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
                  onPressed: () {},
                  child: Text(
                    'Show Results',
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
        ],
      ),
    );
  }
}
