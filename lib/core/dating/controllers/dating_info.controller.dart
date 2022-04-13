import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/dating/services/dating.service.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_label.widget.dart';
import 'package:seeks_app_prototype/core/media/components/media_image.component.dart';
import 'package:seeks_app_prototype/domain/dating.dart';

class DatingInfoController extends GetxController {
  DatingService datingService = DatingService();
  String userId = "01";

  Rx<List<ImageProvider<Object>>> _datingInfoImageProviders =
      Rx<List<ImageProvider<Object>>>([]);
  set datingInfoImageProviders(List<ImageProvider<Object>> value) =>
      _datingInfoImageProviders.value = value;
  List<ImageProvider<Object>> get datingInfoImageProviders =>
      _datingInfoImageProviders.value;

  Rx<DatingInfoEntity> _datingInfo = Rx<DatingInfoEntity>(
    DatingInfoEntity(
      id: "01",
      userId: "01",
      datingInfoTime: DatingInfoTimeEntity(),
    ),
  );

  Rx<List<Widget>> _datingLabelWidgets = Rx<List<Widget>>([]);
  set datingLabelWidgets(List<Widget> value) =>
      _datingLabelWidgets.value = value;
  List<Widget> get datingLabelWidgets => _datingLabelWidgets.value;
  set datingInfo(value) => _datingInfo.value = value;
  DatingInfoEntity get datingInfo => _datingInfo.value;

  getDatingInfoLabels() async {
    List<Widget> widgets = [];

    datingInfo.labels.forEach((key, value) {
      var widget = Container(
        padding: EdgeInsets.only(right: 0),
        child: DatingLabelWidget(
          icon: datingService.getIconByType(value.iconType),
          title: value.name,
        ),
      );
      widgets.add(widget);
    });

    datingLabelWidgets = widgets;
  }

  refreshUserImageProviders() async {
    datingInfoImageProviders = [];
    await Future.delayed(Duration(microseconds: 10));
    List<ImageProvider<Object>> temp = [];
    for (var image in datingInfo.images) {
      var result = getImageProviderByType(
        image.imageType,
        image.image,
      );
      temp.add(result);
    }
    datingInfoImageProviders = temp;
  }

  onInitUserInfo() async {
    datingInfo = await datingService.getDatingInfoById(userId);
    await getDatingInfoLabels();
    await refreshUserImageProviders();
  }

  @override
  void onInit() async {
    await onInitUserInfo();
    super.onInit();
  }
}
