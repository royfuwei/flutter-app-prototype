import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonSliverScrollViewWidget extends StatefulWidget {
  const CommonSliverScrollViewWidget({
    Key? key,
    this.isPullRefresh = true,
    this.scrollListener,
    this.enableCupertinoActivityIndicator = false,
    this.sliverWidgetList = const [],
    this.onRefresh,
  }) : super(key: key);
  final bool isPullRefresh;
  final Future<void> Function(ScrollController scrollController)?
      scrollListener;
  final bool enableCupertinoActivityIndicator;
  final List<Widget> sliverWidgetList;
  final Future<void> Function()? onRefresh;

  @override
  State<CommonSliverScrollViewWidget> createState() =>
      _CommonSliverScrollViewWidgetState();
}

class _CommonSliverScrollViewWidgetState
    extends State<CommonSliverScrollViewWidget> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(
      () => widget.scrollListener != null
          ? widget.scrollListener!(_scrollController)
          : () {},
    );
  }

  @override
  dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return CustomScrollView(
      controller: _scrollController,
      physics: AlwaysScrollableScrollPhysics(),
      slivers: [
        bodySliverRefresh(),
        ...widget.sliverWidgetList,
        bodySliverCupertinoActivityIndicator(),
      ],
    );
  }

  // 下拉刷新
  bodySliverRefresh() {
    return widget.isPullRefresh
        ? CupertinoSliverRefreshControl(
            builder: buildNoArrowRefreshIndicator,
            onRefresh: widget.onRefresh,
          )
        : SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(),
              childCount: 0,
            ),
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
}

Widget buildNoArrowRefreshIndicator(
  BuildContext context,
  RefreshIndicatorMode refreshState,
  double pulledExtent,
  double refreshTriggerPullDistance,
  double refreshIndicatorExtent,
) {
  const Curve opacityCurve = Interval(0.4, 0.8, curve: Curves.easeInOut);
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: refreshState == RefreshIndicatorMode.drag
          ? Opacity(
              opacity: opacityCurve.transform(
                  min(pulledExtent / refreshTriggerPullDistance, 1.0)),
              child: Icon(
                CupertinoIcons.refresh,
                color: CupertinoDynamicColor.resolve(
                    CupertinoColors.inactiveGray, context),
                size: 24.0,
              ),
            )
          : Opacity(
              opacity: opacityCurve
                  .transform(min(pulledExtent / refreshIndicatorExtent, 1.0)),
              child: const CupertinoActivityIndicator(radius: 14.0),
            ),
    ),
  );
}
