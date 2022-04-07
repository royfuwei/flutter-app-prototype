import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/common/components/default_flow_content.dart';
import 'package:seeks_app_prototype/core/common/components/default_title.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';
import 'package:seeks_app_prototype/core/signup/components/signup_images_upload_gridview.dart';
import 'package:seeks_app_prototype/core/signup/controllers/signup_images.controller.dart';

class SignUpImagesUploadBodyComponent extends StatelessWidget {
  const SignUpImagesUploadBodyComponent({
    Key? key,
    this.goNextOnPressed,
  }) : super(key: key);
  final void Function()? goNextOnPressed;

  @override
  Widget build(BuildContext context) {
    SignUpImagesController signUpImagesController = Get.put(
      SignUpImagesController(),
    );
    return body(
      context,
      signUpImagesController,
    );
  }

  body(
    BuildContext context,
    SignUpImagesController signUpImagesController,
  ) {
    return Container(
      child: DefaultFlowPage(
        contentMainAxisAlignment: MainAxisAlignment.start,
        content: [
          _contentTitle(context),
          VerticalSpacing(of: 25),
          Expanded(
            child: _contentBody(),
          ),
        ],
        buttom: [
          _bottomContent(context, signUpImagesController),
        ],
      ),
    );
  }

  _contentTitle(BuildContext context) {
    return DefaultTitle(
      title: "上傳照片",
      subTitle: "請至少上傳一張照片",
    );
  }

  _contentBody() {
    return SignUpImagesUploadGridViewCompnent();
  }

  _bottomContent(
    BuildContext context,
    SignUpImagesController signUpImagesController,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(context, 24),
      ),
      child: Obx(
        () => StatusButton(
          text: "下一步",
          isDisabled: signUpImagesController.selectImageListLength <= 0,
          press: goNextOnPressed,
        ),
      ),
    );
  }
}

/* class SignUpImagesUploadBodyComponent extends StatefulWidget {
  const SignUpImagesUploadBodyComponent({Key? key}) : super(key: key);

  @override
  State<SignUpImagesUploadBodyComponent> createState() =>
      _SignUpImagesUploadBodyComponentState();
}

class _SignUpImagesUploadBodyComponentState
    extends State<SignUpImagesUploadBodyComponent> {
  SignUpImagesController signUpImagesController = Get.put(
    SignUpImagesController(),
  );
  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return Container(
      child: DefaultFlowPage(
        contentMainAxisAlignment: MainAxisAlignment.start,
        content: [
          _contentTitle(),
          VerticalSpacing(of: 25),
          Expanded(
            child: _contentBody(),
          ),
        ],
        buttom: [
          _bottomContent(),
        ],
      ),
    );
  }

  _contentTitle() {
    return DefaultTitle(
      title: "上傳照片",
      subTitle: "請至少上傳一張照片",
    );
  }

  _contentBody() {
    return SignUpImagesUploadGridViewCompnent();
  }

  _bottomContent() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(context, 24),
      ),
      child: Obx(
        () => StatusButton(
          text: "下一步",
          isDisabled: signUpImagesController.selectImageListLength <= 0,
          press: () {},
        ),
      ),
    );
  }
} */
