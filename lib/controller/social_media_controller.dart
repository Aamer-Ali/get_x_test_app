import 'package:get/get.dart';
import 'package:get_x_test_app/view/social_media_page.dart';
import 'package:get_x_test_app/view/widgets/dynamic_widget.dart';

class SocialMediaController extends GetxController {
  // List<dynamicWidget> dynamicList = List<dynamicWidget>();

  var dynamicList = [];

  List<CardData> listItems = [
    CardData(1, "Facebook"),
    CardData(2, "Youtube"),
    CardData(3, "Instagram"),
    CardData(4, "Snapchat"),
    CardData(5, "LinkedIn"),
    CardData(6, "Reddit"),
    CardData(7, "Gmail"),
    CardData(8, "Yahoo"),
    CardData(9, "Outlook"),
    CardData(10, "Telegram"),
  ].obs;

  addListItem(dynamicWidget widget) {
    dynamicList.add(widget);
    update();
  }

  removeListItem(int index) {
    dynamicList.removeAt(index);
    update();
  }

  toggleAccountActivation(int index) {
    dynamicList[index].isActive = !dynamicList[index].isActive;
    update();
  }

// removeListItem(int index) {
//   listItems.removeAt(index);
//   // update();
// }
}
