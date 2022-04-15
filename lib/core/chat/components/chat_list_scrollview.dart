import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_app_prototype/core/chat/widgets/chat_list_item.widget.dart';
import 'package:seeks_app_prototype/core/common/widgets/sliver_list.widget.dart';
import 'package:seeks_app_prototype/core/common/widgets/sliver_scroll_view.wdiget.dart';
import 'package:seeks_app_prototype/core/media/components/media_image.component.dart';
import 'package:seeks_app_prototype/domain/chat.dart';

class ChatListScrollViewComponent extends StatelessWidget {
  const ChatListScrollViewComponent({
    Key? key,
    this.items = const [],
    this.chatItemOnPressed,
    this.chatItemImageOnPressed,
    this.onRefresh,
  }) : super(key: key);

  final List<ChatItemEntity> items;
  final void Function(ChatItemEntity item)? chatItemOnPressed;
  final void Function(ChatItemEntity item)? chatItemImageOnPressed;
  final Future<void> Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return bodySliverScrollView();
  }

  bodySliverScrollView() {
    return CommonSliverScrollViewWidget(
      onRefresh: onRefresh,
      sliverWidgetList: [
        bodyChatListView(),
      ],
    );
  }

  bodyChatListView() {
    return CommonSliverListWidget<ChatItemEntity>(
      items: items,
      builder: (bc, idx, item) => getChatListItem(idx, item),
    );
  }

  getChatListItem(int idx, ChatItemEntity item) {
    return Container(
      padding: EdgeInsets.only(bottom: 2),
      child: ChatListItemWidget(
        username: item.username!,
        itemImage: getImageProviderByType(item.userImageType, item.userImage),
        message: item.message!,
        unReadCount: "0",
        endActionPaneChildren: [
          SlidableAction(
            onPressed: (_) {},
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
            // icon: Icons.delete,
            label: '檢舉',
          ),
          SlidableAction(
            onPressed: (_) {},
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            // icon: Icons.delete,
            label: '刪除',
          ),
        ],
        startActionPaneChildren: [
          SlidableAction(
              onPressed: (_) {},
              backgroundColor: Colors.green.shade100,
              foregroundColor: Colors.white,
              icon: Icons.push_pin
              // label: '',
              ),
          SlidableAction(
            onPressed: (_) {},
            backgroundColor: Colors.green.shade200,
            foregroundColor: Colors.white,
            icon: Icons.volume_off,
            // label: '刪除',
          ),
        ],
        onPressed: () =>
            chatItemOnPressed != null ? chatItemOnPressed!(item) : {},
        itemImageOnPressed: () =>
            chatItemImageOnPressed != null ? chatItemImageOnPressed!(item) : {},
      ),
    );
  }
}
