import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_app_prototype/core/common/widgets/sliver_scroll_view.wdiget.dart';
import 'package:seeks_app_prototype/core/common/widgets/sliver_list.widget.dart';
import 'package:seeks_app_prototype/core/notification/widgets/notifi_list_item.widget.dart';
import 'package:seeks_app_prototype/domain/notification.dart';

class NotificationListViewComponent extends StatelessWidget {
  const NotificationListViewComponent({
    Key? key,
    this.items = const [],
    this.onRefresh,
    this.itemBuilder,
    this.scrollListener,
    this.enableCupertinoActivityIndicator = false,
  }) : super(key: key);

  final bool enableCupertinoActivityIndicator;
  final List<NotifiItemEntity> items;
  final Future<void> Function()? onRefresh;
  final Widget Function(BuildContext, int, NotifiItemEntity)? itemBuilder;
  final Future<void> Function(ScrollController _scrollController)?
      scrollListener;

  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return bodyRefreshScrollView();
  }

  bodyRefreshScrollView() {
    return CommonSliverScrollViewWidget(
      scrollListener: scrollListener,
      enableCupertinoActivityIndicator: enableCupertinoActivityIndicator,
      sliverWidgetList: [
        bodySliverListView(),
      ],
      onRefresh: onRefresh,
    );
  }

  bodySliverListView() {
    return CommonSliverListWidget<NotifiItemEntity>(
      items: items,
      builder: itemBuilder != null
          ? itemBuilder!
          : (bc, idx, item) => genDefaultItem(idx, item),
    );
  }

  Widget genDefaultItem(int idx, NotifiItemEntity item) {
    return NotifiListItem(
      key: Key(idx.toString()),
      startActionPaneChildren: [
        SlidableAction(
          onPressed: (_) {},
          backgroundColor: Colors.grey,
          foregroundColor: Colors.white,
          icon: Icons.archive,
          label: '封存',
        ),
      ],
      endActionPaneChildren: [
        SlidableAction(
          onPressed: (_) {},
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          // icon: Icons.delete,
          label: '已讀',
        ),
      ],
    );
  }
}
