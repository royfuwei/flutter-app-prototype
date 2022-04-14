import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';
import 'package:seeks_app_prototype/core/common/widgets/appbar.widget.dart';
import 'package:seeks_app_prototype/core/common/widgets/is_actived_button.widget.dart';
import 'package:seeks_app_prototype/core/dating/components/dating_info_body.dart';
import 'package:seeks_app_prototype/core/dating/controllers/dating_add.controller.dart';

class DatingAddPreviewPage extends StatelessWidget {
  static String routeName = "/dating_add_preiview";
  const DatingAddPreviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: DatingInfoBodyComponent(),
    );
  }

  appBar(BuildContext context) {
    DatingAddController datingAddController = Get.put(DatingAddController());
    return AppBarWidget(
      startItems: [
        appBarBackButton(
          context: context,
          icon: Icons.arrow_back_ios,
        ),
      ],
      titleItems: [
        appBarTitleText(
          context: context,
          text: "預覽約會",
        ),
      ],
      endItems: [
        Obx(
          () => isActivedTextButtonWidget(
            onPressed: datingAddController.datingAddPreviewToPublicOnPressed,
            isActived: datingAddController.datingAddPreviewToPublic,
            context: context,
            text: "發布",
          ),
        ),
      ],
    );
  }
}
