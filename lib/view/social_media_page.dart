import 'package:flutter/material.dart';
import 'package:get_x_test_app/view/dashboard_page.dart';
import 'package:get_x_test_app/view/widgets/dynamic_widget.dart';

class SocialMediaPage extends StatefulWidget {
  @override
  _SocialMediaPageState createState() => _SocialMediaPageState();
}

class _SocialMediaPageState extends State<SocialMediaPage> {
  var dynamicList = List<dynamicWidget>();

  List<CardData> _listItems = [
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
  ];

  var _listItemsAdded = List();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void removeServiceCard(dynamicWidget) {
    setState(() {
      dynamicList.remove(dynamicWidget);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(_listItemsAdded.length);
    for (int i = 0; i < _listItemsAdded.length; i++)
      print("${_listItemsAdded[i]} In List Item added");
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.yellow,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: GridView.count(
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    crossAxisCount: 5,
                    children: List.generate(_listItems.length, (index) {
                      // return Container(
                      //   _listItems[index], (){
                      //   setState(() {
                      //     print("person ${_listItems[index]} is deleted");
                      //     partyInviteList.remove(_listItems[index]);
                      //   });
                      // }

                      return InkWell(
                        onTap: () {
                          String code;
                          switch (index) {
                            case 0:
                              code = "sma_facebook";
                              break;
                            case 1:
                              code = "sma_youtube";
                              break;
                            case 2:
                              code = "sma_instagram";
                              break;
                            case 3:
                              code = "sma_snapchat";
                              break;
                            case 4:
                              code = "sma_linedin";
                              break;
                            case 5:
                              code = "sma_reddit";
                              break;
                            case 6:
                              code = "sma_gmail";
                              break;
                            case 7:
                              code = "sma_yahoo";
                              break;
                            case 8:
                              code = "sma_outlook";
                              break;
                            case 9:
                              code = "sma_telegram";
                              break;
                            default:
                          }
                          setState(() {
                            dynamicList.add(dynamicWidget(
                              removeServiceCard,
                              index: dynamicList.length,
                              name: code,
                            ));
                            _listItems.removeAt(index);
                          });

                          // setState(() {
                          //   _listItems.removeAt(index);
                          // });
                        },
                        child: Container(
                          color: Colors.white,
                          child: Center(
                            child: Text(_listItems[index]._name),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  // setState(() {
                  //   // someColumn.children.add(Text("Hello"));
                  //   dynamicList.add(dynamicWidget(
                  //     removeServiceCard,
                  //     index: dynamicList.length,
                  //   ));
                  // });
                },
                child: Text("Add Widget"),
              ),
              // for (var item in dynamicList) item,
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: ListView.builder(
                    itemCount: dynamicList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: dynamicList[index],
                        onTap: () {},
                      );
                    }),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    var Url = [];
                    dynamicList.forEach((widget) => Url.add(widget.Url.text));
                    setState(() {});
                    print(Url.length);
                    for (var item in Url) {
                      print(item);
                    }
                  });
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
