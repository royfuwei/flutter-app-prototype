import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_datetime.widget.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_label.widget.dart';
import 'package:seeks_app_prototype/core/media/widgets/images_viewer.widget.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class DatingInfoPage extends StatefulWidget {
  static String routeName = "/dating_info";
  const DatingInfoPage({Key? key}) : super(key: key);

  @override
  State<DatingInfoPage> createState() => _DatingInfoPageState();
}

class _DatingInfoPageState extends State<DatingInfoPage> {
  List<ImageProvider<Object>> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  @override
  void initState() {
    super.initState();
    asyncInitState();
  }

  asyncInitState() async {
    images = [
      AssetImage("assets/images/splash_2.jpg"),
      AssetImage("assets/images/splash_1.jpg"),
    ];
  }

  appBar() {
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
              Icons.close,
              // size: getProportionateScreenWidth(context, 30),
              color: colorFont02,
            ),
          ),
        ],
        titleItems: [
          appBarUserTitle("Username", "正在線上"),
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

  body() {
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                // color: Colors.amber,
                child: SingleChildScrollView(
                  child: bodyDatingWidget(),
                ),
              ),
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
                    /* toRoutesNamed([
                        EntryPage.routeName,
                        UserCreateInfoPage.routeName,
                      ]); */
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bodyDatingWidget() {
    return Container(
      // color: Colors.green,
      child: Column(
        children: [
          bodyDatingImages(),
          bodyDatingInfo(),
        ],
      ),
    );
  }

  bodyDatingInfoLocation() {
    return Container(
      color: Colors.grey.shade300,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Row(
        children: [
          Container(
            child: Icon(
              Icons.place,
              size: getProportionateScreenWidth(context, 30),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("台灣台北市信義區華納威秀 CASHBANK"),
                  Text("台北市"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bodyDatingImages() {
    return Container(
      height: MediaQuery.of(context).size.width,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.blueGrey),
      child: ImagesViewerWidget(
        images: images,
      ),
    );
  }

  bodyDatingInfo() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          bodyDatingInfoTitle("一起讀書"),
          bodyDatingInfoLabel(),
          bodyDatingInfoDateTime(),
          bodyDatingInfoLocation(),
          bodyDatingInfoContent(),
          // VerticalSpacing(),
        ],
      ),
    );
  }

  bodyDatingInfoDateTime() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: DatingDateTimeWidget(),
    );
  }

  bodyDatingInfoContent() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Text(
        "歡迎一起約會、一起讀書",
      ),
    );
  }

  bodyDatingInfoTitle(String title) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: getProportionateScreenWidth(
            context,
            24,
          ),
        ),
      ),
    );
  }

  appBarUserTitle(String name, status) {
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

  bodyDatingInfoLabel({
    String title = "一起讀書",
    String datingDate = "週四, 6月10日",
    String datingHour = "12:00-14:00",
    String status = "配對中",
    String datingDuration = "預計2hr",
    String signupCount = "100人報名",
    String payment = "-1000元",
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      child: Wrap(
        alignment: WrapAlignment.start,
        // direction: Axis.horizontal,
        spacing: 8,
        runSpacing: 2,
        children: [
          Container(
            padding: EdgeInsets.only(right: 0),
            child: DatingLabelWidget(
              icon: Icons.access_time,
              title: datingDuration,
            ),
          ),
          Container(
            // color: Colors.green,
            padding: EdgeInsets.only(right: 0),
            child: DatingLabelWidget(
              icon: Icons.group_add,
              title: signupCount,
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 0),
            child: DatingLabelWidget(
              icon: Icons.money_outlined,
              title: payment,
            ),
          ),
        ],
      ),
    );
  }
}
