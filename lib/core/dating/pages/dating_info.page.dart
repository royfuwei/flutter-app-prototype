import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';
import 'package:seeks_app_prototype/core/common/widgets/appbar.widget.dart';
import 'package:seeks_app_prototype/core/dating/components/dating_info_body.dart';
import 'package:seeks_app_prototype/core/dating/controllers/dating_info.controller.dart';
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
    DatingInfoController datingInfoController = Get.put(DatingInfoController());
    return AppBarWidget(
      startItems: [
        appBarBackButton(
          context: context,
          icon: Icons.arrow_back_ios,
        ),
      ],
      titleItems: [
        Obx(
          () => appBarUserTitle(
            context: context,
            name: datingInfoController.username,
            status: datingInfoController.userStatus,
            isOnline: datingInfoController.userIsOnline,
            onPressed: datingInfoController.appBarUserTitleOnPressed,
          ),
        ),
      ],
      endItems: [
        appBarMoreButton(),
      ],
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
}
