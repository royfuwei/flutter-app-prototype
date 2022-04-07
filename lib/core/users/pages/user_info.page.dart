import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/media/widgets/media_images_viewer.widget.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info.widget.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info_label.widget.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info_list_item.widget.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info_list_title.widget.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info_title.widget.dart';

class UserInfoPage extends StatefulWidget {
  static String routeName = "/user_info_page";
  const UserInfoPage({Key? key}) : super(key: key);

  @override
  State<UserInfoPage> createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: editorButton(),
        backgroundColor: Colors.amber.shade300,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  body() {
    /* return CustomScrollView(
      slivers: [
        SliverAppBar(
          // backgroundColor: tintColor,
          // pinned: false,
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.width,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("CustomScrollView"),
            /* background: Image.asset(
              "assets/logo/seeks_logo.png",
              fit: BoxFit.cover,
            ), */
            background: bodyUserImages(),
          ),
        ),
        // bodyUserImages(),
        // bodyUserInfoList(),
      ],
    ); */
    return SafeArea(
      bottom: false,
      child: Container(
        /* child: SingleChildScrollView(
          child: Column(
            children: [
              bodyUserImages(),
              bodyUserInfoTitle(),
              bodyUserInfoList(),
              bodyUserInfoHabby(),
            ],
          ),
        ), */
        child: ListView(
          children: [
            bodyUserImages(),
            bodyUserInfoTitle(),
            bodyUserInfoList(),
            bodyUserInfoHabby(),
          ],
        ),
      ),
    );
  }

  bodyUserImages() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: MediaImagesViewerWidget(),
    );
  }

  bodyUserInfoTitle() {
    return Container(
      child: UserInfoTitleWidget(),
      // child: UserInfoWidget(),
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

  bodyUserInfoHabby() {
    return Container(
      child: Column(
        children: [
          UserInfoListTitleWidget(
            title: "興趣",
          ),
          bodyUserInfoLabelWrap(),
        ],
      ),
    );
  }

  bodyUserInfoLabelWrap() {
    return Container(
      padding: EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
      constraints: BoxConstraints(minHeight: 100),
      // color: Colors.blue.shade100,
      // constraints: BoxConstraints(maxHeight: 100),
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        spacing: 8,
        runSpacing: 0,
        children: [
          genCrapLabel(),
          genCrapLabel(title: "label"),
          genCrapLabel(title: "label"),
          genCrapLabel(title: "label"),
        ],
      ),
    );
  }

  genCrapLabel({
    String title = "label",
    void Function()? onDeleted,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 14,
          ),
        ),
        onDeleted: onDeleted,
      ),
    );
  }

  editorButton() {
    return Icon(
      Icons.edit,
      color: Colors.grey,
      size: 24,
    );
  }
}
