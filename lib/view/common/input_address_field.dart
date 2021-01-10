import 'package:flutter/material.dart';

class InputAddressField extends StatelessWidget {
  var _label;
  var _type;
  var _functionCall;

  InputAddressField(this._label, this._type,this._functionCall);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: TextFormField(
        maxLines: 4,
        onChanged: (val){
          _functionCall(val);
        },
        decoration: InputDecoration(
          labelText: _label,
          alignLabelWithHint: true,
          labelStyle: TextStyle(color: Colors.black),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pinkAccent),
              borderRadius: BorderRadius.circular(30)),
        ),
        keyboardType: _type,
        validator: (value) {
          if (value.isEmpty) {
            return "${_label} Should not be empty";
          }
          return null;
        },
      ),
    );
  }
}
