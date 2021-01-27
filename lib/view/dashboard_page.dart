import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_test_app/view/card_preview_page.dart';
import 'package:get_x_test_app/view/dashboard_grid.dart';
import 'package:get_x_test_app/view/social_media_page.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen_height = MediaQuery.of(context).size.height;
    final screen_width = MediaQuery.of(context).size.width;

    List<CardData> _listItems = [
      CardData(1, "View Card", Colors.orange),
      CardData(2, "Edit Information", Colors.green),
      CardData(3, "Social Media links", Colors.blue),
      CardData(4, "Education", Colors.yellow),
      CardData(5, "Subscription", Colors.purple),
    ];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: screen_width,
            height: screen_height / 6,
            decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
              ),
            ),
          ),
          Positioned(
            left: 70,
            top: 90,
            child: Text(
              "Dashboard",
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Container(
              margin: EdgeInsets.fromLTRB(0, screen_height / 6, 0, 0),
              child: GridView.count(
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                crossAxisCount: 2,
                children: _listItems
                    .map(
                      (item) => Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(20),
                              topLeft: Radius.circular(20)),
                        ),
                        elevation: 10,
                        child: InkWell(
                          onTap: () {
                            if (item._id == 1) {
                              Get.to(CardPreviewPage());
                            }
                            if (item._id == 3) {
                              Get.to(SocialMediaPage());
                            }
                          },
                          splashColor: Colors.blue,
                          child: Container(
                            child: Center(
                              // child: Column(
                              //   children: [
                              // Padding(
                              //   padding: const EdgeInsets.all(20),
                              //   child: Image(
                              //     image: AssetImage('assets/avatar.png'),
                              //   ),
                              // ),
                              child: Text(
                                item._name,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic,
                                    color: item._color),
                              ),
                              // ],
                              // ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardData {
  int _id;
  String _name;
  MaterialColor _color;

  CardData(this._id, this._name, this._color);
}
