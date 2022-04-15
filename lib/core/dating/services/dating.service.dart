import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_label.widget.dart';
import 'package:seeks_app_prototype/core/users/services/user.service.dart';
import 'package:seeks_app_prototype/domain/dating.dart';
part 'data.dart';

class DatingService {
  Future<DatingInfoEntity> getDatingInfoById(String id) async {
    DatingInfoEntity datingInfo = datingInfoMap[id]!;

    return datingInfo;
  }

  IconData getIconByType(String iconType) {
    IconData icon = Icons.label;
    switch (iconType) {
      case "access_time":
        icon = Icons.access_time;
        break;
      case "group_add":
        icon = Icons.group_add;
        break;
      case "money_outlined":
        icon = Icons.money_outlined;
        break;
      default:
        icon = Icons.label;
        break;
    }

    return icon;
  }

  Future<List<DatingItemEntity>> getDatingItemList() async {
    List<DatingItemEntity> results = [];
    datingItemMap.forEach((key, value) {
      results.add(value);
    });
    return results;
  }

  getDatingLabelWidget({
    required IconData icon,
    String title = "",
    double fontSize = 16,
  }) {
    return Container(
      padding: EdgeInsets.only(right: 0),
      child: DatingLabelWidget(
        icon: icon,
        title: title,
        textStyle: TextStyle(
          fontSize: fontSize,
          color: colorFont02,
        ),
      ),
    );
  }

  List<Widget> getDatingInfoWidgetsByLabels({
    Map<String, DatingInfoLabelEntity> labels =
        const <String, DatingInfoLabelEntity>{},
    double fontSize = 16,
  }) {
    List<Widget> widgets = [];

    labels.forEach((key, value) {
      var widget = getDatingLabelWidget(
        icon: getIconByType(value.iconType),
        title: value.name,
        fontSize: fontSize,
      );
      widgets.add(widget);
    });

    return widgets;
  }
}
