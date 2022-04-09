import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/announcement/widgets/announ_board_swiper.widget.dart';
import 'package:seeks_app_prototype/core/announcement/components/announ_board.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_list_item.widget.dart';
import 'package:seeks_app_prototype/core/home/components/home.component.dart';
import 'package:seeks_app_prototype/core/home/widgets/home_dating_list.widget.dart';
import 'package:seeks_app_prototype/domain/dating.dart';

class HomeBodyComponent extends StatefulWidget {
  const HomeBodyComponent({
    Key? key,
    this.scrollListener,
    this.enableCupertinoActivityIndicator = false,
    this.datingItemList = const [],
    this.onRefresh,
  }) : super(key: key);

  final Future<void> Function(ScrollController scrollController)?
      scrollListener;
  final bool enableCupertinoActivityIndicator;
  final List<DatingItemEntity> datingItemList;
  final Future<void> Function()? onRefresh;

  @override
  State<HomeBodyComponent> createState() => _HomeBodyComponentState();
}

class _HomeBodyComponentState extends State<HomeBodyComponent> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return body();
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
      () => widget.scrollListener != null
          ? widget.scrollListener!(_scrollController)
          : () {},
    );
  }

  body() {
    return CustomScrollView(
      controller: _scrollController,
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        bodySliverRefresh(),
        bodySliverAppBar(),
        bodySliverList(),
        bodySliverCupertinoActivityIndicator(),
      ],
    );
  }

  // 下拉刷新
  bodySliverRefresh() {
    return CupertinoSliverRefreshControl(
      builder: buildNoArrowRefreshIndicator,
      onRefresh: widget.onRefresh,
    );
  }

  // 下拉刷新 widget
  bodySliverCupertinoActivityIndicator() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (bc, idx) {
          return Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: widget.enableCupertinoActivityIndicator
                  ? CupertinoActivityIndicator()
                  : Container(),
            ),
          );
        },
        childCount: 1,
      ),
    );
  }

  // datingList
  bodySliverList() {
    return HomeDatingListWidget(
      items: widget.datingItemList,
      builder: (bc, idx, item) {
        return getDatingListItem(idx, item);
      },
    );
  }

  // datingList item widget
  getDatingListItem(int idx, DatingItemEntity item) {
    return DatingListItem(
      onPressed: () {
        print("idx: ${idx + 1} ");
      },
    );
  }

  // 公告sliver app bar
  bodySliverAppBar() {
    return SliverAppBar(
      pinned: false,
      expandedHeight: MediaQuery.of(context).size.width / 2.2,
      flexibleSpace: FlexibleSpaceBar(
        background: announBoard(),
      ),
    );
  }

  // 公告widget
  announBoard() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 2.2,
      color: colorBarWhite,
      child: AnnounBoardComponent(),
    );
  }
}
