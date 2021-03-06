import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_test_app/view/common/input_field.dart';
import 'package:get_x_test_app/view/user_information_page.dart';
import 'package:path_provider/path_provider.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final pdf = pw.Document();

  @override
  Widget build(BuildContext context) {
    createPdf();
    createRequiredFolders();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputField("Username", TextInputType.text, false, getUserName),
              SizedBox(height: 10),
              InputField("Password", TextInputType.text, true, getPassword),
              RaisedButton(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    // savePdf();
                    if (_formKey.currentState.validate()) {
                      print('Form Filled');
                      Get.off(UserInformationPage());
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  createRequiredFolders() async {
    final extDir = await getExternalStorageDirectory().then((value) {
      new Directory('${value.path}/profile_pic').create();
      new Directory('${value.path}/card_background').create();
      new Directory('${value.path}/company_logo').create();
    });
  }

  getUserName(String val) {
    print(val);
  }

  getPassword(String val) {
    print(val);
  }

  createPdf() {
    // pdf.addPage(pw.Page(
    //     pageFormat: PdfPageFormat.a4,
    //     build: (pw.Context context) {
    //       return pw.Container(
    //           child: pw.Center(
    //         child: pw.UrlLink(child: Text("Callme"),destination:"https://callme.co.in" ),
    //       ));
    //     }));
  }

  savePdf() async {
    getExternalStorageDirectory().then((value) async {
      File("${value.path}/myFile.pdf").writeAsBytes(await pdf.save());
    });
  }
}
