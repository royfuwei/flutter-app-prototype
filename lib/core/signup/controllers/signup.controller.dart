import 'package:get/get.dart';

class SignUpController extends GetxController {
  final _telephone = ''.obs;
  set telephone(String value) => this._telephone.value = value;
  String get telephone => this._telephone.value;
}
