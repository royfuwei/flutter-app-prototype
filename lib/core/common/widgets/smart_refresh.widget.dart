import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CommonSmartRefreshWidget extends StatefulWidget {
  const CommonSmartRefreshWidget({
    Key? key,
    this.child,
    this.refreshController,
    this.onRefresh,
    this.onLoading,
    this.header,
    this.footer,
    this.reverse,
  }) : super(key: key);
  final Widget? child;
  final RefreshController? refreshController;
  final void Function()? onRefresh;
  final void Function()? onLoading;
  final Widget? header;
  final Widget? footer;
  final bool? reverse;

  @override
  State<CommonSmartRefreshWidget> createState() =>
      _CommonSmartRefreshWidgetState();
}

class _CommonSmartRefreshWidgetState extends State<CommonSmartRefreshWidget> {
  late RefreshController _refreshController;

  @override
  void initState() {
    super.initState();
    _refreshController = (widget.refreshController != null
        ? widget.refreshController
        : RefreshController())!;
  }

  @override
  dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(),
    );
  }

  body() {
    return SmartRefresher(
      reverse: widget.reverse,
      enablePullDown: true,
      enablePullUp: true,
      header: widget.header != null ? widget.header : WaterDropHeader(),
      footer: widget.footer != null
          ? widget.footer
          : CustomFooter(
              builder: (BuildContext context, LoadStatus? mode) {
                Widget body;
                if (mode == LoadStatus.idle) {
                  body = Text("pull up load");
                } else if (mode == LoadStatus.loading) {
                  body = CupertinoActivityIndicator();
                } else if (mode == LoadStatus.failed) {
                  body = Text("Load Failed!Click retry!");
                } else if (mode == LoadStatus.canLoading) {
                  body = Text("release to load more");
                } else {
                  body = Text("No more Data");
                }
                body = Text("No more Data");
                return Container(
                  height: 55.0,
                  child: Center(child: body),
                );
              },
            ),
      onRefresh: widget.onRefresh != null
          ? widget.onRefresh
          : () => _refreshController.refreshCompleted(),
      onLoading: widget.onLoading != null
          ? widget.onLoading
          : () => _refreshController.loadComplete(),
      controller: _refreshController,
      child: widget.child,
    );
  }
}
