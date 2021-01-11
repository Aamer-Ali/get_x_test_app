import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_x_test_app/controller/user_details_controller.dart';
import 'package:get_x_test_app/view/card_preview_page.dart';
import 'package:get_x_test_app/view/common/input_address_field.dart';
import 'package:get_x_test_app/view/common/input_field.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class UserInformationPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  File _image;
  final picker = ImagePicker();
  final user_details_controller = Get.put(UserDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Container(
                child: Text(
                  "User Information",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Stack(children: [
                  // return CircleAvatar(maxRadius: 80,child: Image.file(File(controller.profileImagePath.toString())),);

                  Obx(
                    () => CircleAvatar(
                      maxRadius: 80,
                      backgroundImage:
                          user_details_controller.profileImagePath == ""
                              ? AssetImage("assets/avatar.png")
                              : FileImage(File(user_details_controller
                                  .profileImagePath
                                  .toString())),
                    ),
                  ),
                  // CircleAvatar(
                  //     maxRadius: 80,
                  //     backgroundImage:FileImage(File(controller.profileImagePath.toString())),
                  //   ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        getImage();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.add,
                            size: 40,
                            color: Colors.white,
                          )),
                    ),
                  ),
                ]),
              ),
              SizedBox(height: 20),
              InputField("First Name", TextInputType.text, false, getFirstName),
              SizedBox(height: 15),
              InputField("Last Name", TextInputType.text, false, getLastName),
              SizedBox(height: 15),
              InputField(
                  "Profession", TextInputType.text, false, getProfession),
              SizedBox(height: 15),
              InputField("Mobile ", TextInputType.number, false, getMobile),
              SizedBox(height: 15),
              InputField("Email Id", TextInputType.text, false, getEmail),
              SizedBox(height: 15),
              InputAddressField("Address", TextInputType.text, getAddress),
              RaisedButton(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.black)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Confirm",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      Get.to(CardPreviewPage());
                      //   print('Form Filled');
                      // removeFolder();
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }

  getFirstName(String val) {
    user_details_controller.first_name.value = val;
  }

  getLastName(String val) {
    user_details_controller.last_name.value = val;
  }

  getProfession(String val) {
    user_details_controller.profession.value = val;
  }

  getMobile(String val) {
    user_details_controller.mobile.value = val;
  }

  getEmail(String val) {
    user_details_controller.email.value = val;
  }

  getAddress(String val) {
    user_details_controller.address.value = val;
  }

  getImage() async {
    final pickedImage = await picker.getImage(source: ImageSource.camera);
    if (pickedImage != null) {
      user_details_controller.profileImagePath.value = pickedImage.path;
      final directory = await getExternalStorageDirectory().then((value) {
        File(pickedImage.path).copy('${value.path}/profile_pic/profile.jpeg');
      }).whenComplete(() {});
    } else {
      print('Image is not selected');
    }

    // await picker.getImage(source: ImageSource.camera).then((value){
    //   user_details_controller.profileImagePath.value = value.path;
    //    getExternalStorageDirectory().then((value) {
    //     File(user_details_controller.profileImagePath.value).copy('${value.path}/profile_pic/profile.jpeg');
    //   });
    // });
  }

  //remove unwanted folder created by image_picker package
  removeFolder() async {
    // await getExternalStorageDirectory().then((value) {
    //   final dir = Directory("${value.path}/Pictures");
    //   if (dir.existsSync()) {
    //     dir.deleteSync(recursive: true);
    //   }
    //   // dir.exists().then((value) => dir.deleteSync(recursive: true));
    // });
  }
}
