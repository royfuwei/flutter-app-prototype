import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/notification/services/notification.service.dart';
import 'package:seeks_app_prototype/domain/notification.dart';

class NotificationController extends GetxController {
  NotificationService notificationService = NotificationService();

  Rx<int> _pageSize = Rx<int>(20);
  set pageSize(value) => _pageSize.value = value;
  int get pageSize => _pageSize.value;

  Rx<int> _currentPage = Rx<int>(0);
  set currentPage(value) => _currentPage.value = value;
  int get currentPage => _currentPage.value;

  Rx<int> _maxPage = Rx<int>(3);
  set maxPage(value) => _maxPage.value = value;
  int get maxPage => _maxPage.value;

  Rx<bool> _enableCupertinoActivityIndicator = Rx<bool>(false);
  set enableCupertinoActivityIndicator(value) =>
      _enableCupertinoActivityIndicator.value = value;
  bool get enableCupertinoActivityIndicator =>
      _enableCupertinoActivityIndicator.value;

  Rx<List<NotifiItemEntity>> _notifiItemList = Rx<List<NotifiItemEntity>>(
    [
      NotifiItemEntity(id: "01"),
    ],
  );
  set notifiItemList(value) => _notifiItemList.value = value;
  List<NotifiItemEntity> get notifiItemList => _notifiItemList.value;

  Future<void> onRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {});
    currentPage = 0;
  }

  _scrollMaxScrollExtent() async {
    if ((currentPage + 1) * pageSize != notifiItemList.length) return;
    enableCupertinoActivityIndicator = true;
    await Future.delayed(Duration(seconds: 1)).then((value) {
      if (currentPage < maxPage) {
        currentPage++;
      }
    });
    enableCupertinoActivityIndicator = false;
  }

  Future<void> scrollListener(ScrollController _scrollController) async {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      await _scrollMaxScrollExtent();
    }
  }
}
