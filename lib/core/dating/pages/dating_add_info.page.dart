import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';

class DatingAddInfoPage extends StatefulWidget {
  static String routeName = "/dating_add_info";
  const DatingAddInfoPage({Key? key}) : super(key: key);

  @override
  State<DatingAddInfoPage> createState() => _DatingAddInfoPageState();
}

class _DatingAddInfoPageState extends State<DatingAddInfoPage> {
  GlobalKey<FormState> formGloalKey = GlobalKey<FormState>();
  FocusNode topicFocusNode = FocusNode();
  FocusNode contentFocusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(),
    );
  }

  body() {
    return GestureDetector(
      onTap: () {
        topicFocusNode.unfocus();
        contentFocusNode.unfocus();
      },
      child: SafeArea(
        /* child: Container(
          color: Colors.amber,
          child: Column(
            children: [
              bodyDatingTopic(),
              // bodyTopicTextField2(),
              bodyTextForm(),
            ],
          ),
        ), */
        child: bodyTextForm(),
      ),
    );
  }

  bodyDatingTopic() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.width / 4.5,
            width: MediaQuery.of(context).size.width / 4.5,
            decoration: BoxDecoration(
              color: Colors.green.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 16),
              // height: MediaQuery.of(context).size.width / 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  bodyTextDatingTextField(
                    title: "約會主題",
                    hintText: "填寫約會主題...",
                    focusNode: topicFocusNode,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bodyTextForm() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      // color: Colors.amber.shade100,
      child: Form(
        key: formGloalKey,
        child: Column(
          children: [
            bodyDatingTopic(),
            bodyTextDatingTextField(
              title: "約會描述",
              hintText: "填寫關於這場約會的描述...",
              minLines: 10,
              focusNode: contentFocusNode,
            ),
          ],
        ),
      ),
    );
  }

  bodyTextDatingTextField({
    String title = "",
    String hintText = "",
    String? errorText,
    int? maxLines,
    int? minLines,
    FocusNode? focusNode,
  }) {
    return Container(
      constraints: BoxConstraints(minHeight: 80),
      padding: EdgeInsets.only(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(
                      context,
                      getProportionateScreenHeight(context, 18),
                    ),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: TextFormField(
              focusNode: focusNode,
              // expands: true,
              maxLines: maxLines,
              minLines: minLines,
              textInputAction: TextInputAction.done,
              cursorColor: Colors.black,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(
                  context,
                  getProportionateScreenHeight(context, 16),
                ),
                color: Colors.black,
              ),
              decoration: InputDecoration(
                isDense: true,
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black),
                ),
                errorBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black),
                ),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.black),
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  fontSize: getProportionateScreenWidth(
                    context,
                    getProportionateScreenHeight(context, 16),
                  ),
                  color: Colors.grey,
                ),
                floatingLabelStyle: TextStyle(
                  fontSize: getProportionateScreenWidth(
                    context,
                    getProportionateScreenHeight(context, 16),
                  ),
                  color: Colors.black,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                errorText: errorText,
              ),
            ),
          ),
        ],
      ),
    );
  }

  bodyTopicTextField2() {
    return Container(
      color: Colors.grey.shade300,
      constraints: BoxConstraints(
        minHeight: getProportionateScreenHeight(context, 40),
        maxHeight: getProportionateScreenHeight(context, 120),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: TextField(
        // controller: textEditingController,
        maxLines: null,
        // focusNode: focusNode,
        textInputAction: TextInputAction.newline,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: "輸入訊息",
          hintStyle: TextStyle(
            fontSize: getProportionateScreenWidth(
              context,
              getProportionateScreenHeight(context, 16),
            ),
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
        ),
        style: TextStyle(
          fontSize: getProportionateScreenWidth(
            context,
            getProportionateScreenHeight(context, 16),
          ),
          color: Colors.black,
        ),
      ),
    );
  }

  bodyTopicTextField() {
    return Container(
      // color: Colors.grey.shade300,
      constraints: BoxConstraints(
        minHeight: getProportionateScreenHeight(context, 40),
        maxHeight: getProportionateScreenHeight(context, 120),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: TextField(
        // controller: textEditingController,
        maxLines: null,
        // focusNode: focusNode,
        textInputAction: TextInputAction.newline,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey),
          ),
          hintText: "輸入訊息",
          hintStyle: TextStyle(
            fontSize: getProportionateScreenWidth(
              context,
              getProportionateScreenHeight(context, 16),
            ),
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
        ),
        style: TextStyle(
          fontSize: getProportionateScreenWidth(
            context,
            getProportionateScreenHeight(context, 16),
          ),
          color: Colors.black,
        ),
      ),
    );
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
              Icons.arrow_back_ios,
              // size: getProportionateScreenWidth(context, 30),
              color: colorFont02,
            ),
          ),
        ],
        titleItems: [
          Text(
            "新約會",
            style: TextStyle(
              color: colorFont02,
              fontSize: getProportionateScreenWidth(context, 20),
            ),
          ),
        ],
        endItems: [
          TextButton(
            onPressed: () {
              print('hihi');
            },
            child: Row(
              children: [
                isActivedButton(false, "預覽"),
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
