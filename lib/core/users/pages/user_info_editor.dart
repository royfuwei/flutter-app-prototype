import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';
import 'package:seeks_app_prototype/core/common/widgets/appbar.widget.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info_list_item.widget.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info_list_title.widget.dart';

class UserInfoEditorPage extends StatefulWidget {
  static String routeName = "/user_info_editor";
  const UserInfoEditorPage({Key? key}) : super(key: key);

  @override
  State<UserInfoEditorPage> createState() => _UserInfoEditorPageState();
}

class _UserInfoEditorPageState extends State<UserInfoEditorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar2(),
      body: body(),
    );
  }

  body() {
    return SafeArea(
      child: Container(
        color: Colors.grey.shade100,
        child: SingleChildScrollView(
          child: Column(
            children: [
              bodyUserImagesEditor(),
              bodyUserInfoList(),
            ],
          ),
        ),
      ),
    );
  }

  bodyUserInfoList() {
    return Container(
      child: Column(
        children: [
          UserInfoListTitleWidget(),
          UserInfoListItemWidget(),
        ],
      ),
    );
  }

  bodyUserImagesEditor() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 0.1, color: Colors.grey),
          image: DecorationImage(
            image: AssetImage("assets/images/female-user.png"),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.bottomRight,
        child: userImagesEditorButton(),
      ),
    );
  }

  userImagesEditorButton() {
    return TextButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.amber),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        ),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Icon(Icons.edit),
          Text("編輯"),
        ],
      ),
    );
  }

  appBar() {
    return AppBarWidget();
  }

  appBar2() {
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
          Text(
            "編輯個人資料",
            style: TextStyle(
              color: colorFont02,
              fontSize: getProportionateScreenWidth(context, 20),
            ),
          ),
        ],
        endItems: [
          TextButton(
            onPressed: () {
              // print('hihi');
            },
            child: Row(
              children: [
                isActivedButton(false, "儲存"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  isActivedButton(bool isRead, String text) {
    return TextButton(
      onPressed: isRead
          ? () {
              setState(() {
                // 目前沒有效果
                isRead = !isRead;
              });
            }
          : null,
      child: Row(
        children: [
          /* Icon(
            Icons.check,
            color: isRead ? Colors.green : colorFont03,
          ), */
          Text(
            text,
            style: TextStyle(
              color: isRead ? Colors.green : colorFont03,
              fontSize: getProportionateScreenWidth(context, 18),
            ),
          ),
        ],
      ),
    );
  }
}
