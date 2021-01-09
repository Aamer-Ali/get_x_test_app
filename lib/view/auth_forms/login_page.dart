import 'package:flutter/material.dart';
import 'package:get_x_test_app/view/common/input_field.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputField("Username", TextInputType.text, false),
              SizedBox(height: 10),
              InputField("Password", TextInputType.text, true),
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
                    if (_formKey.currentState.validate()) {
                      print('Form Filled');
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
