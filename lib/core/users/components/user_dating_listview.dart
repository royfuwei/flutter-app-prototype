import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/common/widgets/smart_refresh.widget.dart';
import 'package:seeks_app_prototype/core/dating/services/dating.service.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_list_item.widget.dart';
import 'package:seeks_app_prototype/core/media/services/media.service.dart';
import 'package:seeks_app_prototype/domain/dating.dart';
import 'package:sticky_headers/sticky_headers.dart';

class UserDatingListviewComponent extends StatelessWidget {
  const UserDatingListviewComponent({
    Key? key,
    this.userSignUpDating = const [],
    this.userProcessDating = const [],
    this.userHistoryDating = const [],
    this.refreshController,
    this.scrollController,
    this.scrollListener,
    this.onRefresh,
    this.onLoading,
    this.itemOnPressed,
  }) : super(key: key);

  final List<DatingInfoEntity> userSignUpDating;
  final List<DatingInfoEntity> userProcessDating;
  final List<DatingInfoEntity> userHistoryDating;
  final RefreshController? refreshController;
  final ScrollController? scrollController;
  final Future<void> Function(ScrollController)? scrollListener;
  final void Function()? onRefresh;
  final void Function()? onLoading;
  final void Function(DatingInfoEntity item)? itemOnPressed;

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: userDatingRefreshListView(),
    );
  }

  userDatingRefreshListView() {
    return CommonSmartRefreshWidget(
      onRefresh: onRefresh,
      onLoading: onLoading,
      refreshController: refreshController,
      scrollController: scrollController,
      scrollListener: scrollListener,
      child: userDatingListView(),
    );
  }

  userDatingListView() {
    MediaService mediaService = MediaService();
    DatingService datingService = DatingService();
    return ListView(
      children: [
        userDatingProcessList(mediaService, datingService),
        VerticalSpacing(of: 10),
        userDatingSignUpList(mediaService, datingService),
        VerticalSpacing(of: 10),
        userDatingHistoryList(mediaService, datingService),
      ],
    );
  }

  userDatingProcessList(
      MediaService mediaService, DatingService datingService) {
    return StickyHeader(
      header: userDatingListTitle(),
      content: Column(
        children: List.generate(
          userProcessDating.length,
          (index) => getDatingInfoEntity(
            mediaService,
            datingService,
            userProcessDating[index],
          ),
        ),
      ),
    );
  }

  userDatingHistoryList(
    MediaService mediaService,
    DatingService datingService,
  ) {
    return StickyHeader(
      header: userDatingListTitle(title: "約會紀錄"),
      content: Column(
        children: List.generate(
          userHistoryDating.length,
          (index) => getDatingInfoEntity(
            mediaService,
            datingService,
            userHistoryDating[index],
          ),
        ),
      ),
    );
  }

  userDatingSignUpList(MediaService mediaService, DatingService datingService) {
    return StickyHeader(
      header: userDatingListTitle(title: "報名的約會"),
      content: Column(
        children: List.generate(
          userSignUpDating.length,
          (index) => getDatingInfoEntity(
            mediaService,
            datingService,
            userSignUpDating[index],
          ),
        ),
      ),
    );
  }

  getDatingInfoEntity(
    MediaService mediaService,
    DatingService datingService,
    DatingInfoEntity item,
  ) {
    return DatingListItem(
      username: item.username,
      title: item.title,
      status: datingService.getStatusByType(item.status),
      userImage: mediaService.getImageProviderByType(
        item.userImageType,
        item.userImage,
      ),
      infoImage: mediaService.getImageProviderByType(
        item.images[0].imageType,
        item.images[0].image,
      ),
      labelWidgets: datingService.getDatingInfoWidgetsByLabels(
        labels: item.labels,
        fontSize: 12,
      ),
      datingDate: item.datingInfoTime.datingDate,
      datingRange: item.datingInfoTime.datingRange,
      onPressed: () => itemOnPressed != null ? itemOnPressed!(item) : {},
    );
  }

  userDatingListTitle({
    String title = "進行中的約會",
  }) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.green.shade100,
      child: Row(
        children: [
          Container(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
