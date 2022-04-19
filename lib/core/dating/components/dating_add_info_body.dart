import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/dating/components/dating_add_info_content.dart';
import 'package:seeks_app_prototype/core/dating/components/dating_add_info_setting.dart';
import 'package:seeks_app_prototype/core/dating/components/dating_add_info_topic.dart';
import 'package:seeks_app_prototype/core/dating/controllers/dating_add.controller.dart';
import 'package:seeks_app_prototype/core/media/services/media.service.dart';

class DatingAddInfoBodyComponent extends StatefulWidget {
  const DatingAddInfoBodyComponent({Key? key}) : super(key: key);

  @override
  State<DatingAddInfoBodyComponent> createState() =>
      _DatingAddInfoBodyComponentState();
}

class _DatingAddInfoBodyComponentState
    extends State<DatingAddInfoBodyComponent> {
  GlobalKey<FormState> formGloalKey = GlobalKey<FormState>();
  FocusNode topicFocusNode = FocusNode();
  FocusNode contentFocusNode = FocusNode();
  TextEditingController textTopicController = TextEditingController();
  TextEditingController textContentController = TextEditingController();
  bool resizeToAvoidBottomInset = true;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  DatingAddController datingAddController = Get.put(DatingAddController());
  MediaService mediaService = MediaService();

  @override
  void initState() {
    super.initState();
    contentFocusNode.addListener(() {
      if (contentFocusNode.hasFocus) {
        datingAddController.resizeToAvoidBottomInset = false;
      } else {
        datingAddController.resizeToAvoidBottomInset = true;
      }
    });
    datingAddController.initPageDatingAddImages(
      textTopicController: textTopicController,
      textContentController: textContentController,
    );
  }

  @override
  void dispose() {
    topicFocusNode.dispose();
    contentFocusNode.dispose();
    textTopicController.dispose();
    textContentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return GestureDetector(
      onTap: () {
        topicFocusNode.unfocus();
        contentFocusNode.unfocus();
      },
      child: SafeArea(
        child: bodyTextForm(),
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
    return DatingAddInfoSettingComponent();
  }

  bodyDatingTopic() {
    return DatingAddInfoTopicComponent(
      topicFocusNode: topicFocusNode,
      controller: textTopicController,
      onChanged: datingAddController.textTopicOnChanged,
      image: datingAddController.datingInfoImageList.length > 0
          ? mediaService.getImageProviderByType(
              datingAddController.datingInfoImageList[0].imageType,
              datingAddController.datingInfoImageList[0].image,
            )
          : AssetImage("assets/images/splash_1.jpg"),
    );
  }

  bodyDatingContent() {
    return DatingAddInfoContentComponent(
      contentFocusNode: contentFocusNode,
      controller: textContentController,
      onChanged: datingAddController.textContentOnChanged,
    );
  }
}
