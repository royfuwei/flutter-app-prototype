import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/domain/dating.dart';

class DatingService {
  Future<DatingInfoEntity> getDatingInfoById(String id) async {
    DatingInfoEntity datingInfo = new DatingInfoEntity(
      id: "001",
      userId: "001",
      images: [
        DatingInfoImageEntity(id: "02", image: "assets/images/splash_2.jpg"),
        DatingInfoImageEntity(id: "03", image: "assets/images/splash_3.jpg"),
      ],
      datingInfoTime: DatingInfoTimeEntity(),
    );
    datingInfo.labels = <String, DatingInfoLabelEntity>{
      "datingDuration": DatingInfoLabelEntity(
        iconType: "access_time",
        name: "預計2hr",
        value: 60 * 60 * 2,
        key: "datingDuration",
      ),
      "signupCount": DatingInfoLabelEntity(
        iconType: "group_add",
        name: "100人報名",
        value: 100,
        key: "signupCount",
      ),
      "payment": DatingInfoLabelEntity(
        iconType: "money_outlined",
        name: "-1000元",
        value: -1000,
        key: "payment",
      ),
    };
    datingInfo = await getDatingInfoLabels(datingInfo);
    datingInfo = await getDatingInfoTime(datingInfo);

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

  Future<DatingInfoEntity> getDatingInfoLabels(
    DatingInfoEntity datingInfo,
  ) async {
    Map<String, DatingInfoLabelEntity> labels = <String, DatingInfoLabelEntity>{
      "datingDuration": DatingInfoLabelEntity(
        iconType: "access_time",
        name: "預計2hr",
        value: 60 * 60 * 2,
        key: "datingDuration",
      ),
      "signupCount": DatingInfoLabelEntity(
        iconType: "group_add",
        name: "100人報名",
        value: 100,
        key: "signupCount",
      ),
      "payment": DatingInfoLabelEntity(
        iconType: "money_outlined",
        name: "-1000元",
        value: -1000,
        key: "payment",
      ),
    };
    datingInfo.labels = labels;
    return datingInfo;
  }

  Future<DatingInfoEntity> getDatingInfoTime(
    DatingInfoEntity datingInfo,
  ) async {
    DatingInfoTimeEntity datingInfoTime = DatingInfoTimeEntity(
      datingDate: "6/27",
      datingRange: "14:00 - 6/28 14:00",
    );
    datingInfo.datingInfoTime = datingInfoTime;
    return datingInfo;
  }
}
