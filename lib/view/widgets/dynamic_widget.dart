import 'package:get/get.dart';
import 'package:flutter/material.dart';

class dynamicWidget extends StatelessWidget {
  TextEditingController Url = new TextEditingController();

  final String name;
  final int index;
  final Function(dynamicWidget) removeServiceCard;

  dynamicWidget (this.removeServiceCard, {Key key, @required this.index, @required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListBody(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(name),
              Container(
                width: 200,
                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                child: new TextFormField(
                  controller: Url,
                  decoration: const InputDecoration(
                    labelText: 'Url',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  print('Remove');
                  removeServiceCard(this);
                },
                child: Text("Remove"),
              )
            ],
          )
        ],
      ),
    );
  }
}