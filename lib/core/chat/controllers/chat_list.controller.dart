import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/domain/chat.dart';

class ChatListController extends GetxController {
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

  Rx<List<ChatItemEntity>> _chatItemList = Rx<List<ChatItemEntity>>(
    [
      ChatItemEntity(id: "01"),
    ],
  );
  set chatItemList(value) => _chatItemList.value = value;
  List<ChatItemEntity> get chatItemList => _chatItemList.value;

  Future<void> sliverOnRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {});
    currentPage = 0;
  }

  _scrollMaxScrollExtent() async {
    if ((currentPage + 1) * pageSize != chatItemList.length) return;
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
