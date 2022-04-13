import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';
import 'package:seeks_app_prototype/core/dating/components/dating_info_body.dart';
import 'package:seeks_app_prototype/core/main/pages/main.page.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class DatingInfoPage extends StatelessWidget {
  static String routeName = "/dating_info";
  const DatingInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: body(context),
    );
  }

  appBar(BuildContext context) {
    return AppBar(
      // backgroundColor: Colors.black,
      leading: Container(),
      leadingWidth: 0,
      title: defaultExpandedAppBarTitle(
        startItems: [
          TextButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            child: Icon(
              Icons.arrow_back_ios,
              // size: getProportionateScreenWidth(context, 30),
              color: colorFont02,
            ),
          ),
        ],
        titleItems: [
          appBarUserTitle(context, "Username", "正在線上"),
        ],
        endItems: [
          appBarMoreButton(),
        ],
      ),
    );
  }

  appBarMoreButton() {
    return Container(
      // color: Colors.blueGrey,
      child: TextButton(
        onPressed: () {},
        child: Row(
          children: [
            Icon(
              Icons.more_horiz,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
    // dropdown
    /* return Container(
      color: Colors.grey,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: Icon(
            Icons.more_horiz,
            color: Colors.amber,
          ),
          items: appBarMoreButtonDropdownItems(),
          style: TextStyle(color: Colors.blue),
          onChanged: (value) {},
        ),
      ),
    ); */
  }

  List<DropdownMenuItem<String>> appBarMoreButtonDropdownItems() {
    return [
      DropdownMenuItem(
        child: Text("data"),
        value: "data",
      ),
      DropdownMenuItem(
        child: Text("data2"),
        value: "data2",
      ),
    ];
  }

  body(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: DatingInfoBodyComponent(),
            ),
            Container(
              // color: Colors.grey,
              padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(context, 8),
                horizontal: getProportionateScreenHeight(context, 16),
              ),
              child: Container(
                child: StatusButton(
                  text: "加入約會",
                  isDisabled: false,
                  press: () {
                    toRoutesNamed([
                      MainPage.routeName,
                    ]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  appBarUserTitle(BuildContext context, String name, status) {
    return Expanded(
      child: Container(
        // color: Colors.amber,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(
                    Icons.circle,
                    size: getProportionateScreenWidth(context, 10),
                    color: Colors.green,
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(context, 16)),
                ),
              ],
            ),
            Text(
              status,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(context, 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
