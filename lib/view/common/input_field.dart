import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  var _label;
  var _type;
  var _isPassword;

  InputField(this._label, this._type, this._isPassword);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: _label,
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pinkAccent),
              borderRadius: BorderRadius.circular(30)),
        ),
        keyboardType: _type,
        obscureText: _isPassword ? true : false,
        validator: (value) {
          if (value.isEmpty) {
            return "Should not be empty";
          } else {
            if (_isPassword && value.length < 6) {
              return "Password Must be at least 6 character";
            }
          }
          return null;
        },
      ),
    );
  }
}
