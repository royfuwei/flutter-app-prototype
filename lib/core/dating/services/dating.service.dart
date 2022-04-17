import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_label.widget.dart';
import 'package:seeks_app_prototype/core/users/services/user.service.dart';
import 'package:seeks_app_prototype/domain/dating.dart';
import 'package:seeks_app_prototype/domain/media.dart';
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

  String getStatusByType(DatingStatusType status) {
    String result = "配對中";
    switch (status) {
      case DatingStatusType.FINISH:
        result = "已結束";
        break;
      case DatingStatusType.PAITING:
        result = "配對中";
        break;
      case DatingStatusType.SIGNUP:
        result = "已報名";
        break;
    }
    return result;
  }

  Future<List<DatingItemEntity>> initDatingItemList() async {
    List<DatingItemEntity> results = [];
    datingItemMap = await _fakeDatingItemList();
    datingItemMap.forEach((key, value) {
      results.add(value);
    });
    return results;
  }

  createDatingInfo(DatingInfoEntity datingInfo) async {
    _fakeCreateDatingInfo(datingInfo);
  }

  Future<List<DatingItemEntity>> getDatingItemList(String userId) async {
    List<DatingItemEntity> results = [];
    datingItemMap = await _fakeDatingItemList();
    print("datingItemMap.length: ${datingItemMap.length}");
    datingItemMap.forEach((key, value) {
      // results.add(value);
      if (value.status != DatingStatusType.FINISH && value.userId != userId) {
        results.add(value);
      }
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

  Future<Map<String, DatingItemEntity>> _fakeDatingItemList() async {
    Map<String, DatingItemEntity> results = {};
    datingInfoMap.forEach((key, value) {
      DatingItemEntity result = DatingItemEntity(
        id: key,
        image: value.images[0].image,
        imageType: value.images[0].imageType,
        userImage: value.userImage,
        userImageType: value.userImageType,
        datingInfoTime: value.datingInfoTime,
        labels: value.labels,
        title: value.title,
        username: value.username,
        status: value.status,
      );
      results[key] = result;
    });

    return results;
  }

  Future<void> _fakeCreateDatingInfo(DatingInfoEntity datingInfo) async {
    int infoLength = datingInfoMap.length;
    String id = "00${infoLength + 1}";
    print("new id: ${id}");
    datingInfo.id = id;
    datingInfoMap[id] = datingInfo;
  }
}
