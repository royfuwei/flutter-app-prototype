import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/common/widgets/sliver_list.widget.dart';
import 'package:seeks_app_prototype/core/common/widgets/sliver_scroll_view.wdiget.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_list_item.widget.dart';
import 'package:seeks_app_prototype/core/home/pages/home.page.dart';
import 'package:seeks_app_prototype/domain/dating.dart';

class HomeDatingListViewComponent extends StatelessWidget {
  const HomeDatingListViewComponent({
    Key? key,
    this.items = const [],
  }) : super(key: key);

  final List<DatingItemEntity> items;

  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return bodySliverListView();
  }

  bodySliverListView() {
    return CommonSliverListWidget<DatingItemEntity>(
      items: items,
      builder: (bc, idx, item) => getDatingListItem(idx, item),
    );
  }

  Widget getDatingListItem(int idx, DatingItemEntity item) {
    return DatingListItem(
      onPressed: () {
        print("idx: ${idx + 1} ");
        print("Icons.podcasts: ${Icons.podcasts.codePoint}");
      },
    );
  }
}
