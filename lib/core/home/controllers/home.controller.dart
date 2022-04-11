import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/domain/dating.dart';

class HomeController extends GetxController {
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

  Rx<List<DatingItemEntity>> _datingItemList = Rx<List<DatingItemEntity>>(
    [
      DatingItemEntity(id: "01"),
    ],
  );
  set datingItemList(value) => _datingItemList.value = value;
  List<DatingItemEntity> get datingItemList => _datingItemList.value;

  Future<void> sliverOnRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {});
    currentPage = 0;
  }

  _scrollMaxScrollExtent() async {
    if ((currentPage + 1) * pageSize != datingItemList.length) return;
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
