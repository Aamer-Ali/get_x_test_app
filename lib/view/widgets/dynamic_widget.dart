import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_x_test_app/controller/social_media_controller.dart';
import 'package:get_x_test_app/view/social_media_page.dart';

class dynamicWidget extends StatelessWidget {
  TextEditingController Url = new TextEditingController();
  final String name;
  final int index;
  final Function(dynamicWidget) removeServiceCard;

  bool isActive = false;

  dynamicWidget(
    this.removeServiceCard, {
    Key key,
    @required this.index,
    @required this.name,
  }) : super(key: key);

  String getPrefixes() {
    String prefix;
    switch (name) {
      case "sma_facebook":
        prefix = "www.facebook.com/";
        break;
      case "sma_youtube":
        prefix = "www.youtube.com/";
        break;
      case "sma_instagram":
        prefix = "www.instagram.com/";
        break;
      case "sma_snapchat":
        prefix = "www.snpchat.com/";
        break;
      case "sma_linedin":
        prefix = "www.linkedin.com/";
        break;
      case "sma_reddit":
        prefix = "www.reddit.com/";
        break;
      case "sma_gmail":
        prefix = "";
        break;
      case "sma_yahoo":
        prefix = "";
        break;
      case "sma_outlook":
        prefix = "";
        break;
      case "sma_telegram":
        prefix = "";
        break;
      default:
        prefix = "";
    }
    return prefix;
  }

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
                  decoration: InputDecoration(
                    labelText: "Url",
                    prefix: Text(getPrefixes()),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Flexible(
                child: GetBuilder<SocialMediaController>(builder: (controller) {
                  return Switch(
                    value: Get.find<SocialMediaController>()
                                .dynamicList[index]
                                .isActive ==
                            null
                        ? false
                        : Get.find<SocialMediaController>()
                            .dynamicList[index]
                            .isActive,
                    onChanged: (val) {
                      Get.find<SocialMediaController>()
                          .toggleAccountActivation(index);
                    },
                  );
                }),
              ),
              // Flexible(
              //   child: RaisedButton(
              //     onPressed: () {
              //       print('Remove');
              //       Get.find<SocialMediaController>().removeListItem(index);
              //       addServiceCard(name);
              //     },
              //     child: Text("Remove"),
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }

  void addServiceCard(String mCode) {
    switch (mCode) {
      case "sma_facebook":
        Get.find<SocialMediaController>()
            .listItems
            .add(CardData(1, "Facebook"));
        break;
      case "sma_youtube":
        Get.find<SocialMediaController>().listItems.add(CardData(2, "Youtube"));
        break;
      case "sma_instagram":
        Get.find<SocialMediaController>()
            .listItems
            .add(CardData(3, "Instagram"));
        break;
      case "sma_snapchat":
        Get.find<SocialMediaController>()
            .listItems
            .add(CardData(4, "Snapchat"));
        break;
      case "sma_linedin":
        Get.find<SocialMediaController>()
            .listItems
            .add(CardData(5, "LinkedIn"));
        break;
      case "sma_reddit":
        Get.find<SocialMediaController>().listItems.add(CardData(6, "Reddit"));
        break;
      case "sma_gmail":
        Get.find<SocialMediaController>().listItems.add(CardData(7, "Gmail"));
        break;
      case "sma_yahoo":
        Get.find<SocialMediaController>().listItems.add(CardData(8, "Yahoo"));
        break;
      case "sma_outlook":
        Get.find<SocialMediaController>().listItems.add(CardData(9, "Outlook"));
        break;
      case "sma_telegram":
        Get.find<SocialMediaController>()
            .listItems
            .add(CardData(10, "Telegram"));
        break;
      default:
    }
  }
}
