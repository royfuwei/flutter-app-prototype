import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/theme.dart';
import 'package:seeks_app_prototype/core/init/controllers/init.controller.dart';
import 'package:seeks_app_prototype/routes/app_pages.dart';

class GetxProductionApp extends StatelessWidget {
  InitController initController = Get.put(InitController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      initialRoute: AppPages.initPage,
      getPages: AppPages.routes,
      enableLog: true,
    );
  }
}
