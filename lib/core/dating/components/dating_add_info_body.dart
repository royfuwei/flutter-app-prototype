import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/dating/components/dating_add_info_content.dart';
import 'package:seeks_app_prototype/core/dating/components/dating_add_info_topic.dart';
import 'package:seeks_app_prototype/core/dating/controllers/dating_add.controller.dart';

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
            // datingSettingSide(),
          ],
        ),
      ),
    );
  }

  bodyDatingTopic() {
    return DatingAddInfoTopicComponent(
      topicFocusNode: topicFocusNode,
      controller: textTopicController,
      onChanged: datingAddController.textTopicOnChanged,
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
