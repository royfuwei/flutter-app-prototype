import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/chat/widgets/chat_bubble.widget.dart';
import 'package:seeks_app_prototype/core/common/widgets/sliver_list.widget.dart';
import 'package:seeks_app_prototype/core/common/widgets/sliver_scroll_view.wdiget.dart';
import 'package:seeks_app_prototype/domain/chat.dart';

class ChatBubbleScrollViewComponent extends StatelessWidget {
  const ChatBubbleScrollViewComponent({
    Key? key,
    this.items = const [],
    this.scrollController,
    this.scrollListener,
    this.onRefresh,
  }) : super(key: key);

  final List<ChatBubbleEntity> items;
  final Future<void> Function(ScrollController)? scrollListener;
  final Future<void> Function()? onRefresh;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return bodySliverScrollView();
  }

  bodySliverScrollView() {
    return CommonSliverScrollViewWidget(
      scrollController: scrollController,
      scrollListener: scrollListener,
      onRefresh: onRefresh,
      sliverWidgetList: [
        bodyChatBubbleListView(),
      ],
    );
  }

  bodyChatBubbleListView() {
    return CommonSliverListWidget<ChatBubbleEntity>(
      items: items,
      builder: (bc, idx, item) => getChatBubbleItem(idx, item),
    );
  }

  getChatBubbleItem(int idx, ChatBubbleEntity item) {
    return ChatBubbleWidget(
      text: item.message,
      isCurrentUser: item.isCurrentUser,
    );
  }
}
