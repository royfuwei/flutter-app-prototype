import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/common/components/input_text_field.dart';
import 'package:seeks_app_prototype/core/signup/controllers/signup_user_info.controller.dart';

class SignUpUserInfoFormComponent extends StatefulWidget {
  const SignUpUserInfoFormComponent({Key? key}) : super(key: key);

  @override
  State<SignUpUserInfoFormComponent> createState() =>
      _SignUpUserInfoFormComponentState();
}

class _SignUpUserInfoFormComponentState
    extends State<SignUpUserInfoFormComponent> {
  SignUpUserInfoController signUpUserInfoController = Get.put(
    SignUpUserInfoController(),
  );
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();

  @override
  void dispose() {
    _nickNameController.dispose();
    _birthController.dispose();
    _sexController.dispose();
    _genderController.dispose();
    _placeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _birthController.addListener(() {
      signUpUserInfoController.birth = _birthController.text;
      print("_birthController.text: ${_birthController.text}");
      signUpUserInfoController.listerGoNext();
    });
    _sexController.addListener(() {
      signUpUserInfoController.sex = _sexController.text;
      print("_sexController.text: ${_sexController.text}");
      signUpUserInfoController.listerGoNext();
    });
    _genderController.addListener(() {
      signUpUserInfoController.gender = _genderController.text;
      print("_genderController.text: ${_genderController.text}");
      signUpUserInfoController.listerGoNext();
    });
    _placeController.addListener(() {
      signUpUserInfoController.place = _placeController.text;
      print("_placeController.text: ${_placeController.text}");
      signUpUserInfoController.listerGoNext();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return Obx(() => bodyUserInfoForm());
    // return bodyUserInfoForm();
  }

  bodyUserInfoForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputTextField(
            title: "填寫暱稱",
            hintText: "暱稱",
            subTitle: "用於顯示給其他使用者，之後可以更改",
            keyboardType: TextInputType.emailAddress,
            errorText: signUpUserInfoController.nickNameError,
            onChanged: (text) {
              signUpUserInfoController.nickNameOnChange(
                text,
                _nickNameController,
                context,
              );
            },
            textEditingController: _nickNameController,
          ),
          InputTextField(
            title: "填寫生日",
            hintText: "生日",
            subTitle: "之後不能更改",
            keyboardType: TextInputType.none,
            // initialValue: signUpUserInfoController.nickName,
            onTap: () {
              print("onTap: 填寫生日");
              datingDateTimePicker(
                _birthController,
              );
            },
            textEditingController: _birthController,
          ),
          InputTextField(
            title: "性別",
            hintText: "選擇性別",
            subTitle: "之後不能更改",
            keyboardType: TextInputType.none,
            onTap: () {
              print("onTap: 性別");
              showModalSelectBottomSheet(getSexSelectItems());
            },
            textEditingController: _sexController,
          ),
          InputTextField(
            title: "你喜歡？",
            hintText: "擇你所愛",
            subTitle: "之後可以更改",
            keyboardType: TextInputType.none,
            onTap: () {
              print("onTap: 你喜歡？");
              showSelectorPicker(
                getGenderSelectItems(),
                _genderController,
              );
            },
            textEditingController: _genderController,
          ),
          InputTextField(
            title: "居住地",
            hintText: "填寫居住地",
            subTitle: "",
            keyboardType: TextInputType.none,
            onTap: () {
              print("onTap: 居住地");
              showSelectorPicker(
                getPlaceSelectItems(),
                _placeController,
              );
            },
            textEditingController: _placeController,
          ),
        ],
      ),
    );
  }

  datingDateTimePicker(
    TextEditingController textEditingController,
  ) {
    // late DateTime startTime;
    // late DateTime endTime;
    var now = DateTime.now();
    var minimumDate = now.subtract(Duration(days: 365 * 120));
    var maximumDate = now.subtract(Duration(days: 365 * 18));
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
                    // minuteInterval: 30,
                    // mode: CupertinoDatePickerMode.dateAndTime,
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: maximumDate,
                    minimumDate: minimumDate,
                    maximumDate: maximumDate,
                    onDateTimeChanged: (date) {
                      var dateString = "${date.year}-${date.month}-${date.day}";
                      signUpUserInfoController.setTextEditingControllerValue(
                        textEditingController,
                        dateString,
                      );
                    },
                  ),
                ),
                // popOkButton(),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> getSexSelectItems() {
    return [
      ListTile(
        leading: Icon(Icons.man),
        title: Text('男性'),
        onTap: () {
          signUpUserInfoController.sex = '男性';
          signUpUserInfoController.setTextEditingControllerValue(
            _sexController,
            '男性',
          );
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: Icon(Icons.woman),
        title: Text('女性'),
        onTap: () {
          signUpUserInfoController.sex = '女性';
          signUpUserInfoController.setTextEditingControllerValue(
            _sexController,
            '女性',
          );
          Navigator.pop(context);
        },
      ),
    ];
  }

  List<String> getPlaceSelectItems() {
    return ["台北市", "新北市", "桃園市"];
  }

  List<String> getGenderSelectItems() {
    return ["喜歡女生", "喜歡男生", "都喜歡"];
  }

  void showSelectorPicker(
    List<String> items,
    TextEditingController textEditingController,
  ) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return Container(
          color: Colors.white,
          height: 300,
          child: Column(
            children: [
              VerticalSpacing(
                of: 25,
              ),
              Container(
                height: 100,
                child: getSelectorPicker(
                  items,
                  textEditingController,
                ),
              ),
              /* CupertinoButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ), */
            ],
          ),
        );
      },
    );
  }

  getSelectorPicker(
    List<String> items,
    TextEditingController textEditingController,
  ) {
    return CupertinoPicker(
      itemExtent: 30,
      onSelectedItemChanged: (index) {
        signUpUserInfoController.setTextEditingControllerValue(
          textEditingController,
          items[index],
        );
      },
      children: List.generate(
        items.length,
        (index) => Text(
          items[index],
        ),
      ),
    );
  }

  void showModalSelectBottomSheet(List<Widget> items) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) => getSelectWrap(items),
    );
  }

  getSelectWrap(List<Widget> items) {
    return Container(
      padding: EdgeInsets.only(),
      // color: Colors.greenAccent,
      child: SafeArea(
        child: Wrap(
          children: items,
        ),
      ),
    );
  }
}
