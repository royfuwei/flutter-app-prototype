import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_list_item.widget.dart';

class DatingItemEntity {
  String username;
  Uint8List userImage;
  Uint8List coverImage;
  String title;
  DateTime startTime;
  DateTime endTime;
  int signupCount;
  int payment;
  String paymentType;

  DatingItemEntity({
    required this.username,
    required this.userImage,
    required this.coverImage,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.signupCount,
    required this.paymentType,
    required this.payment,
  });
}

class HomePage extends StatefulWidget {
  static String routeName = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: Scaffold(
            appBar: appBar(),
            body: SafeArea(
              child: GestureDetector(
                child: ListView(
                  children: [
                    DatingListItem(),
                  ],
                ),
                // child: SingleChildScrollView(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  getStartActionMenu(int index) {
    return [
      SlidableAction(
        onPressed: (_) {
          // deleteListItem(index);
        },
        backgroundColor: Color(0xFFFE4A49),
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: '刪除',
      ),
      SlidableAction(
        // onPressed: doNothing,
        onPressed: (_) {},
        backgroundColor: Color(0xFF21B7CA),
        foregroundColor: Colors.white,
        icon: Icons.share,
        label: '分享',
      ),
    ];
  }

  appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      // actions: [Text("hihi")],
      title: defaultAppBarTitle(startItems: [
        TextButton(
          onPressed: () {},
          style: ButtonStyle(),
          child: Row(
            children: [
              Text(
                "台灣",
                style: TextStyle(
                  color: colorFont02,
                  fontSize: getProportionateScreenWidth(context, 24),
                ),
              ),
              Icon(
                Icons.arrow_drop_down,
                color: colorFont02,
              )
            ],
          ),
        ),
      ], endItems: [
        appBarIconButton(Icons.location_on),
        appBarIconButton(Icons.search),
        appBarIconButton(Icons.filter_list),
      ]),
    );
  }

  appBarIconButton(
    IconData icon, {
    Color color = colorFont02,
  }) {
    return IconButton(
      iconSize: getProportionateScreenWidth(context, 32),
      onPressed: () {},
      padding: EdgeInsets.all(0),
      icon: Icon(
        icon,
        color: color,
        size: getProportionateScreenWidth(context, 32),
      ),
    );
  }
}
