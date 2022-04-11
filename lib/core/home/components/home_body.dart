import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/announcement/components/announ_board.dart';
import 'package:seeks_app_prototype/core/common/widgets/sliver_scroll_view.wdiget.dart';
import 'package:seeks_app_prototype/core/home/components/home_dating_list_view.dart';
import 'package:seeks_app_prototype/domain/dating.dart';

class HomeBodyComponent extends StatelessWidget {
  const HomeBodyComponent({
    Key? key,
    this.items = const [],
    this.onRefresh,
    this.scrollListener,
    this.enableCupertinoActivityIndicator = false,
  }) : super(key: key);

  final bool enableCupertinoActivityIndicator;
  final List<DatingItemEntity> items;
  final Future<void> Function()? onRefresh;
  final Future<void> Function(ScrollController _scrollController)?
      scrollListener;

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return bodyRefreshScrollView(context);
  }

  bodyRefreshScrollView(BuildContext context) {
    return CommonSliverScrollViewWidget(
      scrollListener: scrollListener,
      enableCupertinoActivityIndicator: enableCupertinoActivityIndicator,
      sliverWidgetList: [
        bodySliverAppBar(context),
        bodySliverListView(),
      ],
      onRefresh: onRefresh,
    );
  }

  bodySliverListView() {
    return HomeDatingListViewComponent(
      items: items,
    );
  }

  // 公告sliver app bar
  bodySliverAppBar(BuildContext context) {
    return SliverAppBar(
      pinned: false,
      expandedHeight: MediaQuery.of(context).size.width / 2.2,
      flexibleSpace: FlexibleSpaceBar(
        background: announBoard(context),
      ),
    );
  }

  // 公告widget
  announBoard(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 2.2,
      color: colorBarWhite,
      child: AnnounBoardComponent(),
    );
  }
}
