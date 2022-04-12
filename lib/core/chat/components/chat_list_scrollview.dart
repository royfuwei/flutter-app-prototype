import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_app_prototype/core/chat/widgets/chat_list_item.widget.dart';
import 'package:seeks_app_prototype/core/common/widgets/sliver_list.widget.dart';
import 'package:seeks_app_prototype/core/common/widgets/sliver_scroll_view.wdiget.dart';
import 'package:seeks_app_prototype/domain/chat.dart';

class ChatListScrollViewComponent extends StatelessWidget {
  const ChatListScrollViewComponent({
    Key? key,
    this.items = const [],
  }) : super(key: key);

  final List<ChatItemEntity> items;

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return bodySliverScrollView();
  }

  bodySliverScrollView() {
    return CommonSliverScrollViewWidget(
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

  getChatListItem(int idx, dynamic item) {
    return ChatListItemWidget(
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
      onPressed: () {
        // Get.to(ChatPage());
      },
      itemImageOnTap: () {
        // Get.to(UserInfoPage());
      },
    );
  }
}
