import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
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
  bool resizeToAvoidBottomInset = true;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      appBar: appBar(),
      body: body(),
    );
  }

  @override
  void initState() {
    super.initState();
    contentFocusNode.addListener(() {
      if (contentFocusNode.hasFocus) {
        setState(() {
          resizeToAvoidBottomInset = false;
        });
      } else {
        setState(() {
          resizeToAvoidBottomInset = true;
        });
      }
    });
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

  bodyDatingTopicTest() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  bodyTextDatingTextField(
                    title: "約會主題",
                    hintText: "填寫約會主題...",
                  ),
                  Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bodyDatingTopic() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
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
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  bodyTextDatingTextField(
                    title: "約會主題",
                    hintText: "填寫約會主題...",
                    focusNode: topicFocusNode,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 8, left: 16),
                    child: Divider(
                      height: 1,
                      color: Colors.black,
                    ),
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
            Expanded(
              child: bodyDatingContent(),
            ),
            Container(
              child: Divider(
                height: 2,
                color: Colors.black,
              ),
            ),
            datingSettingSide(),
          ],
        ),
      ),
    );
  }

  datingSettingSide() {
    return Container(
      child: Column(children: [
        datingSettingItem(
          title: "約會設定",
          errorTitle: "請設定約會費用",
          onPressed: () {
            _closeTextFieldKeyboard();
            datingSettingPaymentType();
          },
        ),
        datingSettingItem(
          title: "新增時間",
          errorTitle: "請設定約會日期",
          onPressed: () {
            _closeTextFieldKeyboard();
            datingDateTimePicker();
          },
        ),
        datingSettingItem(
          title: "新增地點",
          errorTitle: "請設定約會地點",
          onPressed: () {
            _closeTextFieldKeyboard();
            // datingLocationPicker();
            showMediaBottomSheet(
              context,
              scaffoldKey.currentState!,
            );
          },
        ),
      ]),
    );
  }

  _closeTextFieldKeyboard() {
    if (contentFocusNode.hasFocus) {
      contentFocusNode.unfocus();
    }
    if (topicFocusNode.hasFocus) {
      topicFocusNode.unfocus();
    }
  }

  datingSettingPaymentType() {
    // showCupertinoModalPopup(
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Scaffold(
          body: Container(
            color: Colors.white,
            // height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  // height: 200,
                  // color: Colors.grey.shade200,
                  child: bodyTextDatingTextField(
                    title: "輸入車馬費",
                    hintText: "請填寫金額...",
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    // focusNode: topicFocusNode,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    // color: Colors.amber.shade100,
                    child: CupertinoPicker(
                      itemExtent: 32,
                      onSelectedItemChanged: (position) {},
                      children: [
                        Text(
                          "我請客",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(
                              context,
                              getProportionateScreenHeight(context, 28),
                            ),
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "你買單",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(
                              context,
                              getProportionateScreenHeight(context, 28),
                            ),
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                popOkButton(),
              ],
            ),
          ),
        );
      },
    );
  }

  datingLocationPicker() {
    showCupertinoModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  color: Colors.amber.shade100,
                ),
              ),
              // popOkButton(),
            ],
          ),
        );
      },
    );
  }

  void showMediaBottomSheet(BuildContext context, ScaffoldState scaffoldState) {
    scaffoldState.showBottomSheet(
      /* (context) => Container(
        child: Column(
          children: [
            Expanded(
              child: getMediaWrap(),
            ),
            // popOkButton(),
          ],
        ),
      ), */
      (context) => getMediaWrap(),
    );
  }

  getMediaWrap() {
    return Container(
      padding: EdgeInsets.only(),
      color: Colors.greenAccent,
      child: SafeArea(
        bottom: false,
        child: Container(
          padding: EdgeInsets.only(bottom: 20),
          child: Wrap(
            children: <Widget>[
              ListTile(
                  leading: Icon(Icons.music_note),
                  title: Text('Music'),
                  onTap: () => {
                        setState(() {
                          Navigator.pop(context);
                        })
                      }),
              ListTile(
                leading: Icon(Icons.videocam),
                title: Text('Video'),
                onTap: () => {
                  setState(() {
                    Navigator.pop(context);
                  })
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  datingSettingDatetime() {}

  datingDateTimePicker() {
    late DateTime startTime;
    late DateTime endTime;
    var now = DateTime.now()..add(Duration(hours: 2));
    DateTime minimumDate = DateTime.parse(
        "${now.year}-${now.month.bitLength == 2 ? "0" : ""}${now.month}-${now.day} ${now.hour + 2}:00:00");
    var maximumDate = minimumDate.add(Duration(days: 2));
    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return SafeArea(
          bottom: false,
          child: Container(
            color: Colors.white,
            height: 380,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // appBar(),
                Container(
                  padding: EdgeInsets.only(bottom: 0),
                  height: 250,
                  child: CupertinoDatePicker(
                    minuteInterval: 30,
                    mode: CupertinoDatePickerMode.dateAndTime,
                    initialDateTime: minimumDate,
                    minimumDate: minimumDate,
                    maximumDate: maximumDate,
                    onDateTimeChanged: (date) {
                      startTime = date;
                    },
                  ),
                ),
                popOkButton(),
              ],
            ),
          ),
        );
      },
    );
  }

  popOkButton() {
    return Container(
      padding: EdgeInsets.only(bottom: 18),
      child: CupertinoButton(
        child: Text(
          'OK',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(
              context,
              getProportionateScreenHeight(context, 18),
            ),
            color: Colors.blue,
          ),
        ),
        onPressed: () {
          setState(() {
            // choosed = "$pickDatetime";
          });
          Navigator.of(context).pop();
        },
      ),
    );
  }

  datingSettingItem({
    String title = "約會設定",
    String errorTitle = "錯誤訊息",
    bool isError = false,
    void Function()? onPressed,
  }) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 8, top: 24, right: 8, bottom: 8),
            child: TextButton(
              onPressed: onPressed,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(
                            context,
                            getProportionateScreenHeight(context, 18),
                          ),
                          color: isError ? Colors.red : Colors.black,
                        ),
                      ),
                      isError
                          ? Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                errorTitle,
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(
                                    context,
                                    getProportionateScreenHeight(context, 14),
                                  ),
                                  color: Colors.red,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    // size: getProportionateScreenWidth(context, 30),
                    color: colorFont02,
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Divider(
              height: 2,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  bodyDatingContent() {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: bodyTextDatingTextFieldScrollView(
        title: "約會描述",
        hintText: "填寫關於這場約會的描述...",
        focusNode: contentFocusNode,
        textInputAction: TextInputAction.newline,
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
    TextInputAction? textInputAction = TextInputAction.done,
    TextInputType? keyboardType = TextInputType.name,
  }) {
    return Container(
      padding: EdgeInsets.only(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Container(
            child: _datingTextField(
              errorText: errorText,
              title: title,
              hintText: hintText,
              maxLines: maxLines,
              minLines: minLines,
              textInputAction: textInputAction,
              focusNode: focusNode,
              keyboardType: keyboardType,
            ),
          ),
        ],
      ),
    );
  }

  _datingTextField({
    String title = "",
    String hintText = "",
    String? errorText,
    int? maxLines,
    int? minLines,
    FocusNode? focusNode,
    TextInputAction? textInputAction = TextInputAction.done,
    TextInputType? keyboardType = TextInputType.name,
  }) {
    return TextField(
      focusNode: focusNode,
      // expands: true,
      maxLines: maxLines,
      minLines: minLines,
      textInputAction: textInputAction,
      cursorColor: Colors.black,
      style: TextStyle(
        fontSize: getProportionateScreenWidth(
          context,
          getProportionateScreenHeight(context, 16),
        ),
        color: Colors.black,
      ),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        isDense: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        errorBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Colors.transparent),
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
    );
  }

  bodyTextDatingTextFieldScrollView({
    String title = "",
    String hintText = "",
    String? errorText,
    int? maxLines,
    int? minLines,
    FocusNode? focusNode,
    TextInputAction? textInputAction = TextInputAction.done,
    TextInputType? keyboardType = TextInputType.name,
  }) {
    return Container(
      // constraints: BoxConstraints(minHeight: 80),
      padding: EdgeInsets.only(top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                textInputAction == TextInputAction.newline &&
                        focusNode!.hasFocus
                    ? Text(
                        "完成",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(
                            context,
                            getProportionateScreenHeight(context, 16),
                          ),
                          color: Colors.blue,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: _datingTextField(
                errorText: errorText,
                title: title,
                hintText: hintText,
                maxLines: maxLines,
                minLines: minLines,
                textInputAction: textInputAction,
                focusNode: focusNode,
                keyboardType: keyboardType,
              ),
            ),
          ),
        ],
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
