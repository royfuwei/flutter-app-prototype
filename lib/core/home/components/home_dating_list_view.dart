import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/common/widgets/sliver_list.widget.dart';
import 'package:seeks_app_prototype/core/dating/services/dating.service.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_list_item.widget.dart';
import 'package:seeks_app_prototype/core/media/components/media_image.component.dart';
import 'package:seeks_app_prototype/domain/dating.dart';

class HomeDatingListViewComponent extends StatelessWidget {
  const HomeDatingListViewComponent({
    Key? key,
    this.items = const [],
    this.onPressed,
  }) : super(key: key);

  final List<DatingItemEntity> items;
  final void Function(int idx, DatingItemEntity item)? onPressed;

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
    DatingService datingService = DatingService();
    return DatingListItem(
      username: item.username,
      title: item.title,
      datingDate: item.datingInfoTime.datingDate,
      datingRange: item.datingInfoTime.datingRange,
      status: item.status,
      infoImage: getImageProviderByType(item.imageType, item.image),
      userImage: getImageProviderByType(item.userImageType, item.userImage),
      labelWidgets: datingService.getDatingInfoWidgetsByLabels(
        labels: item.labels,
        fontSize: 12,
      ),
      onPressed: () {
        if (onPressed != null) {
          onPressed!(idx, item);
        } else {
          print("idx: ${idx + 1} ");
          print("Icons.podcasts: ${Icons.podcasts.codePoint}");
        }
      },
    );
  }
}
