import 'package:flutter/material.dart';
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

  void removeServiceCard(index) {
    setState(() {
      dynamicList.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    children: _listItems
                        .map(
                          (item) => Card(
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            elevation: 10,
                            child: InkWell(
                              onTap: () {
                                switch (item._id) {
                                  case 1:
                                    break;
                                  case 2:
                                    break;
                                  case 3:
                                    break;
                                  case 4:
                                    break;
                                  case 5:
                                    break;
                                  case 6:
                                    break;
                                  case 7:
                                    break;
                                  case 8:
                                    break;
                                  case 9:
                                    break;
                                  case 10:
                                    break;
                                  default:
                                }
                                if (item._id == 1) {}
                              },
                              splashColor: Colors.blue,
                              child: Container(
                                child: Center(
                                  child: Text(
                                    item._name,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    // someColumn.children.add(Text("Hello"));
                    dynamicList.add(dynamicWidget(
                      removeServiceCard,
                      index: dynamicList.length,
                    ));
                  });
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
