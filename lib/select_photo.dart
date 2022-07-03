// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, non_constant_identifier_names, override_on_non_overriding_member, annotate_overrides, await_only_futures, unused_local_variable, unused_catch_clause, avoid_print, unnecessary_this, implementation_imports

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:medical_project/drawer.dart';
import 'package:medical_project/generated/locale_keys.g.dart';

class ChoosePhoto extends StatefulWidget {
  @override
  State<ChoosePhoto> createState() => _ChoosePhotoState();
}

class _ChoosePhotoState extends State<ChoosePhoto> {
  File? image;

  Future pickImage(imagesource) async {
    try {
      final image = await ImagePicker().pickImage(source: imagesource);

      if (image == null) return;

      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print('Failed to pick an image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DefaultDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text(
          LocaleKeys.Select_photo.tr(),
          style: TextStyle(
            // fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                height: 50.0,
                child: MaterialButton(
                  onPressed: () {
                    var fromcamera = false;
                    pickImage(ImageSource.gallery);
                  },
                  child: Text(
                    LocaleKeys.gallery.tr(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.blue[800],
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Container(
                height: 50.0,
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    pickImage(ImageSource.camera);
                  },
                  child: Text(
                    LocaleKeys.open_camera.tr(),
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.blue[800],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: image != null
                        ? Image.file(image!)
                        : Container(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,

                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Icon(
                                  Icons.image_outlined,
                                  size: 100.0,
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Text(
                                  LocaleKeys.no_image.tr(),
                                  style: TextStyle(
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.black26),
                          ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50.0,
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          LocaleKeys.previous.tr(),
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
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 50.0,
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () {
                          if (image == null) {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text(LocaleKeys.warning.tr()),
                                content: Text(LocaleKeys.have_choose.tr()),
                                actions: <Widget>[
                                  Center(
                                    child: TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(LocaleKeys.ok.tr()),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>)),
                            // );
                          }
                        },
                        child: Text(
                          LocaleKeys.next_button.tr(),
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
            ],
          ),
        ),
      ),
    );
  }
}
