import 'package:flutter/material.dart';
import 'package:get/get.dart';

void toRoutesNamed(
  List<String> routes, {
  dynamic arguments,
  int? id,
  bool preventDuplicates = true,
  Map<String, String>? parameters,
}) {
  var route = routes.join();
  Get.toNamed(
    route,
    arguments: arguments,
    id: id,
    preventDuplicates: preventDuplicates,
    parameters: parameters,
  );
}

void offRoutesNamed(
  List<String> routes, {
  dynamic arguments,
  int? id,
  bool preventDuplicates = true,
  Map<String, String>? parameters,
}) {
  var route = routes.join();
  Get.offNamed(
    route,
    arguments: arguments,
    id: id,
    preventDuplicates: preventDuplicates,
    parameters: parameters,
  );
}

void offAllRoutesNamed(
  List<String> routes, {
  bool Function(Route<dynamic>)? predicate,
  dynamic arguments,
  int? id,
  Map<String, String>? parameters,
}) {
  var route = routes.join();
  Get.offAllNamed(
    route,
    arguments: arguments,
    id: id,
    parameters: parameters,
    predicate: predicate,
  );
}
