import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/chat/widgets/chat_bubble.widget.dart';
import 'package:seeks_app_prototype/core/common/widgets/listview.widget.dart';
import 'package:seeks_app_prototype/core/common/widgets/sliver_list.widget.dart';
import 'package:seeks_app_prototype/core/common/widgets/sliver_scroll_view.wdiget.dart';
import 'package:seeks_app_prototype/core/common/widgets/smart_refresh.widget.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_list_item.widget.dart';
import 'package:seeks_app_prototype/domain/chat.dart';
import 'package:sticky_headers/sticky_headers.dart';

class ChatBubbleRefreshViewComponent extends StatelessWidget {
  const ChatBubbleRefreshViewComponent({
    Key? key,
    this.items = const [],
    this.refreshController,
    this.scrollController,
    this.scrollListener,
    this.onRefresh,
  }) : super(key: key);

  final List<ChatBubbleEntity> items;
  final Future<void> Function(ScrollController)? scrollListener;
  final Future<void> Function()? onRefresh;
  final ScrollController? scrollController;
  final RefreshController? refreshController;

  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return Container(
      decoration: BoxDecoration(
        // color: Colors.amber.shade100,
        image: DecorationImage(
          image: AssetImage("assets/images/splash_1.jpg"),
          fit: BoxFit.cover,
          opacity: 0.3,
        ),
      ),
      child: bodyRefreshListView(),
    );
  }

  bodyRefreshListView() {
    return CommonSmartRefreshWidget(
      scrollListener: scrollListener,
      scrollController: scrollController,
      refreshController: refreshController,
      onRefresh: onRefresh,
      enablePullUp: false,
      header: CustomHeader(
        builder: (BuildContext context, RefreshStatus? mode) {
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
      child: bodyChatBubbleListView(),
    );
  }

  bodyChatBubbleListView() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (bc, idx) => getChatBubbleItem(idx, items[idx]),
    );
  }

  getChatBubbleItem(int idx, ChatBubbleEntity item) {
    return ChatBubbleWidget(
      text: item.message,
      isCurrentUser: item.isCurrentUser,
    );
  }
}
