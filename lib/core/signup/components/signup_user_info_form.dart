import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/common/components/input_text_field.dart';
import 'package:seeks_app_prototype/core/picker/components/picker_date_selector.dart';
import 'package:seeks_app_prototype/core/picker/components/picker_selector.dart';
import 'package:seeks_app_prototype/core/signup/controllers/signup_user_info.controller.dart';
import 'package:seeks_app_prototype/domain/picker.dart';

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
              signUpUserInfoController.nickName = _nickNameController.text;
              signUpUserInfoController.listerGoNext();
            },
            textEditingController: _nickNameController,
          ),
          InputTextField(
            title: "填寫生日",
            hintText: "生日",
            subTitle: "之後不能更改",
            keyboardType: TextInputType.none,
            // initialValue: signUpUserInfoController.nickName,
            onTap: birthDatePickerSelector,
            textEditingController: _birthController,
          ),
          InputTextField(
            title: "性別",
            hintText: "選擇性別",
            subTitle: "之後不能更改",
            keyboardType: TextInputType.none,
            onTap: sexSelectBottomSheet,
            textEditingController: _sexController,
          ),
          InputTextField(
            title: "你喜歡？",
            hintText: "擇你所愛",
            subTitle: "之後可以更改",
            keyboardType: TextInputType.none,
            onTap: genderPickerSelector,
            textEditingController: _genderController,
          ),
          InputTextField(
            title: "居住地",
            hintText: "填寫居住地",
            subTitle: "",
            keyboardType: TextInputType.none,
            onTap: genderPlaceSelector,
            textEditingController: _placeController,
          ),
        ],
      ),
    );
  }

  birthDatePickerSelector() {
    birthDateTimePicker(
      context: context,
      onDateTimeChanged: (date) {
        var dateString = "${date.year}-${date.month}-${date.day}";
        _birthController.text = dateString;
        signUpUserInfoController.birth = date;
        signUpUserInfoController.listerGoNext();
      },
    );
  }

  genderPickerSelector() {
    var items = signUpUserInfoController.getGenderSelectItems();
    var initIndex = 0;
    if (_genderController.text.isNotEmpty) {
      var initItem = items
          .where((element) => element.text == _genderController.text)
          .first;
      initIndex = items.indexOf(initItem) < 0 ? 0 : items.indexOf(initItem);
    }
    showPickerSelector(
      initialItem: initIndex,
      context: context,
      items: items,
      onSelectedItemChanged: (item) {
        _genderController.text = (item.value == null ? '' : item.text)!;
        signUpUserInfoController.gender =
            (item.value == null ? '' : item.text)!;
        signUpUserInfoController.listerGoNext();
      },
      generator: (item) => Text(
        item.text.toString(),
      ),
    );
  }

  genderPlaceSelector() {
    var items = signUpUserInfoController.getPlaceSelectItems();
    var initIndex = 0;
    if (_placeController.text.isNotEmpty) {
      var initItem =
          items.where((element) => element.text == _placeController.text).first;
      initIndex = items.indexOf(initItem) < 0 ? 0 : items.indexOf(initItem);
    }
    showPickerSelector(
      initialItem: initIndex,
      context: context,
      items: items,
      onSelectedItemChanged: (item) {
        _placeController.text = (item.value == null ? '' : item.text)!;
        signUpUserInfoController.place =
            (item.value == null ? '' : item.value)!;
        signUpUserInfoController.listerGoNext();
      },
      generator: (item) => Text(
        item.text.toString(),
      ),
    );
  }

  sexSelectBottomSheet() {
    var items = signUpUserInfoController.getSexSelectItems();
    showSelectorBottomSheet(
      context: context,
      items: items,
      generator: (item) {
        return ListTile(
          leading: Icon(Icons.woman),
          title: Text(item.text.toString()),
          onTap: () {
            _sexController.text = item.text.toString();
            signUpUserInfoController.sex = item.value;
            signUpUserInfoController.listerGoNext();
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
