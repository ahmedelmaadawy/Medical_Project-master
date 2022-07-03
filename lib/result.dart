// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:medical_project/test_values.dart';

Widget buildResulItem(ResultModel results) => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: double.infinity,
        height: 65.0,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 100.0,
                child: Center(
                  child: Text(
                    results.name,
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
            Container(
              width: 100.0,
              child: Center(
                child: Text(
                  results.strValue!,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: 300.0,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Center(
                      child: Text(
                        results.translation,
                        style: TextStyle(fontSize: 15.0),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
      ),
    );
