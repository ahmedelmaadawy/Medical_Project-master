// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:medical_project/Models/drawer.dart';
import 'package:medical_project/Models/person.dart';
import 'package:medical_project/home_screen.dart';
import 'package:medical_project/styles/prjcolors.dart';

class LoadingScreen extends StatelessWidget {
  LoadingScreen({
    Key? key,
  }) : super(key: key);
  final Person person = Person();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ProjectColors.primary_color_blue,
          title: Text(
            'The Results',
          ),
        ),
        endDrawer: DefaultDrawer(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      'Your Final Results Are ',
                      style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              person.isLeukemiaTest
                  ? Container(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          person.hasLukemia
                              ? 'Leukemia Found\n\n Go To The Doctor'
                              : 'No Leukemia Found\n\n You Are Fine',
                          style: TextStyle(
                            color: ProjectColors.button_text_color,
                            fontSize: 23.0,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: ProjectColors.secondary_color,
                      ),
                    )
                  : Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              person.hasAnimea
                                  ? 'Animea Found\n\n Go To The Doctor'
                                  : 'No Animea Found\n\n You Are Fine',
                              style: TextStyle(
                                color: ProjectColors.button_text_color,
                                fontSize: 23.0,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: ProjectColors.secondary_color,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              person.hasCovid
                                  ? 'Covid Found\n\n Go To The Doctor'
                                  : 'No Covid Found\n\n You Are Fine',
                              style: TextStyle(
                                color: ProjectColors.button_text_color,
                                fontSize: 23.0,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: ProjectColors.secondary_color,
                          ),
                        ),
                      ],
                    ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: 50.0,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text(
                    'Home',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: ProjectColors.button_text_color),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ),
                  color: ProjectColors.primary_color_blue,
                ),
              ),
            ],
          ),
        ));
  }
}
