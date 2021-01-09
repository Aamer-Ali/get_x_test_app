import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuItem extends StatelessWidget {
  String _name, _path;

  MenuItem(String _name, String _path) {
    this._name = _name;
    this._path = _path;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Get.to();
      },
      child: Text(
        _name,
        style: TextStyle(fontSize: 20, color: Colors.green),
      ),
    );
  }
}
