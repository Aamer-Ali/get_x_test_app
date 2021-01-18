import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_x_test_app/controller/social_media_controller.dart';
import 'package:get_x_test_app/view/social_media_page.dart';

class dynamicWidget extends StatelessWidget {
  TextEditingController Url = new TextEditingController();

  SocialMediaController controller = Get.put(SocialMediaController());

  final String name;
  final int index;
  final Function(dynamicWidget) removeServiceCard;
  final GlobalKey<SocialMediaPageState> mKey;
  bool isSwitched = false;

  dynamicWidget(this.removeServiceCard,
      {Key key, @required this.index, @required this.name, @required this.mKey})
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
              Flexible(child: Obx(() {
                return Switch(
                    value: controller.isOn.value,
                    onChanged: (val) {
                      controller.isOn.value = val;
                    });
              })),
              Flexible(
                child: RaisedButton(
                  onPressed: () {
                    print('Remove');
                    removeServiceCard(this);
                    mKey.currentState.addServiceCard(name);
                  },
                  child: Text("Remove"),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
