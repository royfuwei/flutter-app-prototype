import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/announcement/widgets/announ_board_swiper.widget.dart';
import 'package:seeks_app_prototype/core/announcement/controllers/announ.controller.dart';

class AnnounBoardComponent extends StatelessWidget {
  static String routeName = "/announ_board_component";
  const AnnounBoardComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnnounController announController = Get.put(AnnounController());
    return body(context, announController);
  }

  body(BuildContext context, AnnounController announController) {
    // return Container();
    return Obx(
      () => AnnounBoardSwiperWidget(
        items: announController.announBoardList,
        itemOnTap: announController.onTapAnnounBoardItem,
      ),
    );
  }
}
