import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_test_app/controller/social_media_controller.dart';
import 'package:get_x_test_app/view/dashboard_page.dart';
import 'package:get_x_test_app/view/widgets/dynamic_widget.dart';

class SocialMediaPage extends StatelessWidget {


  var controller = Get.put(SocialMediaController());



  void removeServiceCard(dynamicWidget) {
    controller.dynamicList.remove(dynamicWidget);
  }

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => Container(
                    color: Colors.yellow,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 3.5,
                    child: GridView.count(
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      crossAxisCount: 5,
                      children: List.generate(
                          controller.listItems == null
                              ? 0
                              : controller.listItems.length, (index) {
                        return InkWell(
                          onTap: () {
                            String code;
                            switch (controller.listItems[index]._name) {
                              case "Facebook":
                                code = "sma_facebook";
                                break;
                              case "Youtube":
                                code = "sma_youtube";
                                break;
                              case "Instagram":
                                code = "sma_instagram";
                                break;
                              case "Snapchat":
                                code = "sma_snapchat";
                                break;
                              case "LinkedIn":
                                code = "sma_linedin";
                                break;
                              case "Reddit":
                                code = "sma_reddit";
                                break;
                              case "Gmail":
                                code = "sma_gmail";
                                break;
                              case "Yahoo":
                                code = "sma_yahoo";
                                break;
                              case "Outlook":
                                code = "sma_outlook";
                                break;
                              case "Telegram":
                                code = "sma_telegram";
                                break;
                              default:
                            }
                            controller.addListItem(
                              dynamicWidget(
                                removeServiceCard,
                                index: controller.dynamicList.length,
                                name: code,
                                /* mKey: null,*/
                              ),
                            );
                            controller.listItems.removeAt(index);
                          },
                          child: Container(
                            color: Colors.white,
                            child: Center(
                              child: Text(controller.listItems[index]._name),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),

              // for (var item in dynamicList) item,
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: GetBuilder<SocialMediaController>(builder: (controller) {
                  return ListView.builder(
                      itemCount: controller.dynamicList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          child: controller.dynamicList[index],
                          onTap: () {},
                        );
                      });
                }),
              ),
              RaisedButton(
                onPressed: () {
                  List<SubmitData> submitData = List();
                  controller.dynamicList.forEach((widget) => submitData.add(
                      SubmitData(
                          widget.name, widget.Url.text, widget.isActive)));

                  for (int i = 0; i < submitData.length; i++)
                    print(
                        "${submitData[i].code} -  ${submitData[i].Url} - ${submitData[i].isOn}");

                  // var Url = [];
                  // dynamicList.forEach((widget) => Url.add(widget.Url.text));
                  // setState(() {});
                  // print(Url.length);
                  // for (var item in Url) {
                  //   print(item);
                  // }
                },
                child: Text("Submit Form"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class CardData {
  int _id;
  String _name;

  //todo Add variable for image path.
  CardData(this._id, this._name);
}

class SubmitData {
  String code, Url;
  bool isOn;

  SubmitData(this.code, this.Url, this.isOn);
}

//region All data without GetX (setState())

//
// import 'package:flutter/material.dart';
// import 'package:get_x_test_app/view/dashboard_page.dart';
// import 'package:get_x_test_app/view/widgets/dynamic_widget.dart';
//
// class SocialMediaPage extends StatefulWidget {
//   @override
//   SocialMediaPageState createState() => SocialMediaPageState();
// }
//
// class SocialMediaPageState extends State<SocialMediaPage> {
//   var dynamicList = List<dynamicWidget>();
//   final stateKey = new GlobalKey<SocialMediaPageState>();
//   bool isSwitched = false;
//
//   // List<CardData> _listItems = List() ;
//
//   List<CardData> _listItems = [
//     CardData(1, "Facebook"),
//     CardData(2, "Youtube"),
//     CardData(3, "Instagram"),
//     CardData(4, "Snapchat"),
//     CardData(5, "LinkedIn"),
//     CardData(6, "Reddit"),
//     CardData(7, "Gmail"),
//     CardData(8, "Yahoo"),
//     CardData(9, "Outlook"),
//     CardData(10, "Telegram"),
//   ];
//
//   // void addListData(){
//   //
//   //   _listItems.add(CardData(1, "Facebook"));
//   //   _listItems.add(CardData(2, "Youtube"));
//   //   _listItems.add(CardData(3, "Instagram"));
//   //   _listItems.add(CardData(4, "Snapchat"));
//   //   _listItems.add(CardData(5, "LinkedIn"));
//   //   _listItems.add(CardData(6, "Reddit"));
//   //   _listItems.add(CardData(7, "Gmail"));
//   //   _listItems.add(CardData(8, "Yahoo"));
//   //   _listItems.add(CardData(9, "Outlook"));
//   //   _listItems.add(CardData(10, "Telegram"));
//   // }
//
//   var _listItemsAdded = List();
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   void removeServiceCard(dynamicWidget) {
//     setState(() {
//       dynamicList.remove(dynamicWidget);
//     });
//   }
//
//   void addServiceCard(String mCode) {
//     setState(() {
//       switch (mCode) {
//         case "sma_facebook":
//           _listItems.add(CardData(1, "Facebook"));
//           break;
//         case "sma_youtube":
//           _listItems.add(CardData(2, "Youtube"));
//           break;
//         case "sma_instagram":
//           _listItems.add(CardData(3, "Instagram"));
//           break;
//         case "sma_snapchat":
//           _listItems.add(CardData(4, "Snapchat"));
//           break;
//         case "sma_linedin":
//           _listItems.add(CardData(5, "LinkedIn"));
//           break;
//         case "sma_reddit":
//           _listItems.add(CardData(6, "Reddit"));
//           break;
//         case "sma_gmail":
//           _listItems.add(CardData(7, "Gmail"));
//           break;
//         case "sma_yahoo":
//           _listItems.add(CardData(8, "Yahoo"));
//           break;
//         case "sma_outlook":
//           _listItems.add(CardData(9, "Outlook"));
//           break;
//         case "sma_telegram":
//           _listItems.add(CardData(10, "Telegram"));
//           break;
//         default:
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Scaffold(
//       key: _scaffoldKey,
//       body: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   color: Colors.yellow,
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height / 3.5,
//                   child: GridView.count(
//                     mainAxisSpacing: 20,
//                     crossAxisSpacing: 20,
//                     crossAxisCount: 5,
//                     children: List.generate(
//                         _listItems == null ? 0 : _listItems.length, (index) {
//                       // return Container(
//                       //   _listItems[index], (){
//                       //   setState(() {
//                       //     print("person ${_listItems[index]} is deleted");
//                       //     partyInviteList.remove(_listItems[index]);
//                       //   });
//                       // }
//
//                       return InkWell(
//                         onTap: () {
//                           String code;
//                           switch (_listItems[index]._name) {
//                             case "Facebook":
//                               code = "sma_facebook";
//                               break;
//                             case "Youtube":
//                               code = "sma_youtube";
//                               break;
//                             case "Instagram":
//                               code = "sma_instagram";
//                               break;
//                             case "Snapchat":
//                               code = "sma_snapchat";
//                               break;
//                             case "LinkedIn":
//                               code = "sma_linedin";
//                               break;
//                             case "Reddit":
//                               code = "sma_reddit";
//                               break;
//                             case "Gmail":
//                               code = "sma_gmail";
//                               break;
//                             case "Yahoo":
//                               code = "sma_yahoo";
//                               break;
//                             case "Outlook":
//                               code = "sma_outlook";
//                               break;
//                             case "Telegram":
//                               code = "sma_telegram";
//                               break;
//                             default:
//                           }
//                           setState(() {
//                             dynamicList.add(dynamicWidget(
//                               removeServiceCard,
//                               index: dynamicList.length,
//                               name: code,
//                               mKey: stateKey,
//                             ));
//                             _listItems.removeAt(index);
//                           });
//
//                           // setState(() {
//                           //   _listItems.removeAt(index);
//                           // });
//                         },
//                         child: Container(
//                           color: Colors.white,
//                           child: Center(
//                             child: Text(_listItems[index]._name),
//                           ),
//                         ),
//                       );
//                     }),
//                   ),
//                 ),
//               ),
//               RaisedButton(
//                 onPressed: () {
//                   // setState(() {
//                   //   // someColumn.children.add(Text("Hello"));
//                   //   dynamicList.add(dynamicWidget(
//                   //     removeServiceCard,
//                   //     index: dynamicList.length,
//                   //   ));
//                   // });
//                 },
//                 child: Text("Add Widget"),
//               ),
//               // for (var item in dynamicList) item,
//               Container(
//                 height: MediaQuery.of(context).size.height / 2.5,
//                 child: ListView.builder(
//                     itemCount: dynamicList.length,
//                     itemBuilder: (context, index) {
//                       return InkWell(
//                         child: dynamicList[index],
//                         onTap: () {},
//                       );
//                     }),
//               ),
//               RaisedButton(
//                 onPressed: () {
//                   setState(() {
//
//                     List<SubmitData> submitData = List();
//                     dynamicList.forEach((widget) => submitData.add(SubmitData(widget.name,widget.Url.text,widget.isSwitched)));
//
//                     for (int i = 0; i < submitData.length; i++)
//                       print("${submitData[i].code} -  ${submitData[i].Url} - ${submitData[i].isOn}");
//
//                     // var Url = [];
//                     // dynamicList.forEach((widget) => Url.add(widget.Url.text));
//                     // setState(() {});
//                     // print(Url.length);
//                     // for (var item in Url) {
//                     //   print(item);
//                     // }
//                   });
//                 },
//                 child: Text("Submit Form"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CardData {
//   int _id;
//   String _name;
//   //todo Add variable for image path.
//   CardData(this._id, this._name);
// }
//
// class SubmitData{
//   String code,Url;
//   bool isOn;
//
//   SubmitData(this.code, this.Url, this.isOn);
// }

//endregion

//region list with Map method
// _listItems
//
//     .map(
// (item) => Card(
// shape: RoundedRectangleBorder(
// borderRadius:
// BorderRadius.all(Radius.circular(20)),
// ),
// elevation: 10,
// child: InkWell(
// onTap: () {
// switch (item._id) {
// case 1:
//
// if(_listItemsAdded.contains(item._id-1))
// {
// final snackBar = SnackBar(content: Text('Account is already in the list'));
// _scaffoldKey.currentState.showSnackBar(snackBar);
// return;
// }
// setState(() {
// _listItemsAdded.add(item._id-1);
// dynamicList.add(dynamicWidget(
// removeServiceCard,
// index: dynamicList.length,
// name: "sma_facebook",
// ));
// });
// break;
// case 2:
// setState(() {
// dynamicList.add(dynamicWidget(
// removeServiceCard,
// index: dynamicList.length,
// name: "sma_youtube",
// ));
// });
// break;
// case 3:
// setState(() {
// dynamicList.add(dynamicWidget(
// removeServiceCard,
// index: dynamicList.length,
// name: "sma_instagram",
// ));
// });
// break;
// case 4:
// setState(() {
// dynamicList.add(dynamicWidget(
// removeServiceCard,
// index: dynamicList.length,
// name: "sma_snapchat",
// ));
// });
// break;
// case 5:
// setState(() {
// dynamicList.add(dynamicWidget(
// removeServiceCard,
// index: dynamicList.length,
// name: "sma_linedin",
// ));
// });
// break;
// case 6:
// setState(() {
// dynamicList.add(dynamicWidget(
// removeServiceCard,
// index: dynamicList.length,
// name: "sma_reddit",
// ));
// });
// break;
// case 7:
// setState(() {
// dynamicList.add(dynamicWidget(
// removeServiceCard,
// index: dynamicList.length,
// name: "sma_gmail",
// ));
// });
// break;
// case 8:
// setState(() {
// dynamicList.add(dynamicWidget(
// removeServiceCard,
// index: dynamicList.length,
// name: "sma_yahoo",
// ));
// });
// break;
// case 9:
// setState(() {
// dynamicList.add(dynamicWidget(
// removeServiceCard,
// index: dynamicList.length,
// name: "sma_outlook",
// ));
// });
// break;
// case 10:
// setState(() {
// dynamicList.add(dynamicWidget(
// removeServiceCard,
// index: dynamicList.length,
// name: "sma_telegram",
// ));
// });
// break;
// default:
// }
// if (item._id == 1) {}
// },
// splashColor: Colors.blue,
// child: Container(
// child: Center(
// child: Text(
// item._name,
// style: TextStyle(
// fontSize: 12,
// fontStyle: FontStyle.italic),
// ),
// ),
// ),
// ),
// ),
// )
// .toList(),
//endregion
