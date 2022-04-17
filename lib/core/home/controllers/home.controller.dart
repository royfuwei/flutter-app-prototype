import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/dating/controllers/dating_info.controller.dart';
import 'package:seeks_app_prototype/core/dating/services/dating.service.dart';
import 'package:seeks_app_prototype/core/users/services/user.service.dart';
import 'package:seeks_app_prototype/domain/dating.dart';

class HomeController extends GetxController {
  String userId = "000";

  DatingService datingService = DatingService();
  UserService userService = UserService();

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

  Rx<List<DatingItemEntity>> _datingItemList = Rx<List<DatingItemEntity>>([]);
  set datingItemList(List<DatingItemEntity> value) =>
      _datingItemList.value = value;
  List<DatingItemEntity> get datingItemList => _datingItemList.value;

  Future<void> sliverOnRefresh() async {
    await Future.delayed(Duration(seconds: 1), () {});
    datingItemList = await datingService.getDatingItemList(userId);
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

  Future<void> datingItemOnPressed(int idx, DatingItemEntity item) async {
    DatingInfoController datingInfoController = Get.put(DatingInfoController());
    print("datingItemOnPressed item.id: ${item.id}");
    // datingInfoController.datingId = item.id;
    // toRoutesNamed([MainPage.routeName, DatingInfoPage.routeName]);
    datingInfoController.goPageByDatingId(item.id);
  }

  onInitDatingItemList() async {
    await datingService.initDatingItemList();
    datingItemList = await datingService.getDatingItemList(userId);
  }

  @override
  void onInit() async {
    userId = await userService.getLoginUserId();
    await onInitDatingItemList();
    super.onInit();
  }
}
